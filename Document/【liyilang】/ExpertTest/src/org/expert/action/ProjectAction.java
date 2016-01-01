package org.expert.action;
/**
 * @author Seth
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.expert.common.DataHelper;
import org.expert.common.HibernateUtils;
import org.expert.model.Business;
import org.expert.model.Expert;
import org.expert.model.Project;
import org.expert.service.ProjectService;
import org.expert.service.impl.BusinessServiceBean;
import org.expert.service.impl.ExpertServiceBean;
import org.expert.service.impl.ProjectServiceBean;
import org.expert.servlet.expert_center;
import org.hibernate.Query;
import org.hibernate.Session;

import com.mysql.jdbc.EscapeTokenizer;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ProjectAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
    private Project project;
	private Business business;
	private Expert expert;
	private List<Project> projects0, projects1, projects2, projects3;
    public List<Project> getProjects0() {
		return projects0;
	}


	public List<Project> getProjects1() {
		return projects1;
	}


	public List<Project> getProjects2() {
		return projects2;
	}


	public List<Project> getProjects3() {
		return projects3;
	}


	public Expert getExpert() {
		return expert;
	}

    
	Map<String, List<Project>> request;
    ActionContext ctx=ActionContext.getContext();
    ProjectServiceBean ps=new ProjectServiceBean();
	BusinessServiceBean bs=new BusinessServiceBean();
	private final List<String> businessList = DataHelper.getBusinessList();
	private final List<String> budgetList = DataHelper.getBudgetList();
	private List<Project> targetList;
    private List<Expert> backList1;
    private List<Expert> backList2;

	public List<Expert> getBackList1() {
		return backList1;
	}


	public List<Expert> getBackList2() {
		return backList2;
	}



	public Business getBusiness() {
		return business;
	}

	public void setBusiness(Business business) {
		this.business = business;
	}

	public List<String> getBusinessList() {
		return businessList;
	}

	public List<String> getBudgetList() {
		return budgetList;
	}

	public List<Project> getTargetList() {
		return targetList;
	}

	public void setProject(Project project) {
			this.project = project;
	 }
	 
	 public Project getProject(){
		 return this.project;
	 }
	
	 //创建项目
	public void createProject() throws ServletException, IOException{
		
	    //����aa��ʾ�����硱�����硱    HH��ʾ24Сʱ��    ����hh��ʾ12Сʱ��   
	  /*  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
	    temp_str=sdf.format(dt); */
	    int bid=(Integer) ctx.getSession().get("buserid");
		HttpServletRequest req=ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();    
		response.setCharacterEncoding("UTF-8");   
		PrintWriter out = response.getWriter(); 
		
		String name=req.getParameter("name");
		String tag=req.getParameter("tag");
		String deadline=req.getParameter("deadline")+" 24:00:00";
		String pdescrpt=req.getParameter("detail");
		String budget=req.getParameter("money");
		this.business=bs.get(bid);
		this.project=new Project();
		this.project.setPname(name);
		this.project.setTag(tag);
		this.project.setPdescrpt(pdescrpt);
		this.project.setBudget(Integer.valueOf(budget));
		this.project.setBusiness(business);
		this.project.setPvocation(business.getBvocation());
		this.project.setSchedule(0);
		this.project.setDeadline(Timestamp.valueOf(deadline));
		this.project.setStarttime(new Timestamp(System.currentTimeMillis()));
		
		if(ps.save(project)){
			String SQL="create table expert."+project.getPid()+" (eid int UNIQUE,checked int default 0)";
			ps.createSQL(SQL);
	        out.println("项目发布成功");    
	        out.flush();    
	        out.close();  
		}else{
		out.println("项目发布失败"); 
		out.flush();
		out.close();
		}
		//return null;
		//if(ps.save(project)){
		// System.out.println("��Ŀ�����ɹ�");

	     // req.getRequestDispatcher("../business/company_home.jsp").forward(req, null);
	}


	//查询企业发布项目
	@SuppressWarnings("unchecked")
	public String searchBprojects(){

		int bid=(Integer) ctx.getSession().get("buserid");
	    String HQL;
		HQL="from Project p where p.schedule=0 and  p.business.bid="+bid+"order by p.pid desc";
		projects0 = ps.getListByK(HQL);
		HQL="from Project p where p.schedule=1 and  p.business.bid="+bid+"order by p.pid desc";
		projects1 = ps.getListByK(HQL);
		HQL="from Project p where p.schedule=2 and  p.business.bid="+bid+"order by p.pid desc";
 		projects2 = ps.getListByK(HQL);
 		HQL="from Project p where p.schedule=3 and  p.business.bid="+bid+"order by p.pid desc";
 		projects3 = ps.getListByK(HQL);
		return "search_bprojects";
	}
	
	//项目协议达成
	public String dealProject(){
		Integer pid = Integer.valueOf(ServletActionContext.getRequest().getParameter("project_id"));
		Integer eid= Integer.valueOf(ServletActionContext.getRequest().getParameter("expert_id"));
		project=ps.get(pid);
		project.setExpert(new ExpertServiceBean().get(eid));
		project.setSchedule(1);
		ps.update(project);
		String SQL="drop table expert."+pid;
		ps.createSQL(SQL);
		return "dealProject";
	}
	
	
	
	//专家首页查询行业项目
	public String queryExpertProjects(){
			
		int code=Integer.valueOf(ServletActionContext.getRequest().getParameter("code"));
		String HQL="from Project where pvocation="+code+" order by pid desc";
		targetList=new ArrayList<Project>();
		targetList=ps.getListByK(HQL);
		return "ExpertProjects";
		
	}
	
	//查询专家搜索的项目
	public String getSearchProjects(){
		int vid=Integer.valueOf(ServletActionContext.getRequest().getParameter("vid"));
		//int mid=Integer.valueOf(ServletActionContext.getRequest().getParameter("mid"));
		String start=String.valueOf(ServletActionContext.getRequest().getParameter("start"));
		String end=String.valueOf(ServletActionContext.getRequest().getParameter("end"));
		System.out.println(start+":"+end);
		String HQL;
		targetList=new ArrayList<Project>();
		if(start==""||end==""){
			HQL="from Project where pvocation="+vid+" and schedule=0 order by pid desc";
			targetList=ps.getListByK(HQL);
		}
		else{
			
			HQL="select p from Project p where p.pvocation="+vid+" and p.schedule=0"+" and p.starttime between :start and :end";
			
			try{
				Session session = HibernateUtils.getSessionFactory().getCurrentSession();
				session.getTransaction().begin();
				//Query query = session.createQuery(HQL).setTimestamp("start", Timestamp.valueOf(start+" 00:00:00")).setTimestamp("end", Timestamp.valueOf(end+" 00:00:00"));
				Query query = session.createQuery(HQL).setDate("start", Timestamp.valueOf(start+" 00:00:00")).setDate("end", Timestamp.valueOf(end+" 00:00:00"));
				targetList=((List<Project>)query.list());
			} catch(RuntimeException e) {
				HibernateUtils.getSessionFactory().getCurrentSession().getTransaction().rollback();
				e.printStackTrace();
			}finally{
				HibernateUtils.closeSession();
			}
		}
		
		return "getSearchProjects";
	}
	
    //获取指定项目编号的项目 By Zhuge
	public String getDProject(){
		
		ProjectService ps = new ProjectServiceBean();
		Integer pid = Integer.parseInt(ServletActionContext.getRequest().getParameter("pid"));
		
		this.project = ps.get(pid);
		int schedule = project.getSchedule();
		switch(schedule){
		case 0: return "getApyProject";
		case 1: return "getCurProject";
		case 2: return "getFinProject";
		}
		
		return "getEProject";
	}
	
	//专家申请项目 By Zhuge
	public String apyProject(){
		Integer eid =(Integer) ctx.getSession().get("euserid");
		Integer pid = Integer.valueOf(ServletActionContext.getRequest().getParameter("pid"));
		String sql = "insert into expert.`"+pid+"` values("+eid+", 0)";
		//System.out.println(sql+"---------");
		if(ps.createSQL(sql)){
			return "apySuccess";
		} else{
			return "apyFail";
		}
	}
	
	//获取专家的指定项目
	public String  getBProject(){
		Integer pid = Integer.valueOf(ServletActionContext.getRequest().getParameter("project_id"));
		
		this.project = ps.get(pid);
		
		return "getBProject";
	}
	
	//查询企业指定寻找中的项目
	public String getSProject(){
		getBProject();
		return "getSProject";
	}
	//查询企业进行中项目
	public String getWProject(){
		getBProject();
		return "getWProject";
	}
	
	public String getCProject(){
		getBProject();
		return "getCProject";
	}
	
	public String getFinExpert(){
		int eid = Integer.valueOf(ServletActionContext.getRequest().getParameter("eid"));
		expert=new ExpertServiceBean().get(eid);
		Integer pid = Integer.valueOf(ServletActionContext.getRequest().getParameter("project_id"));
		this.project = ps.get(pid);
		return "getFinExpert";
	}
	
	//项目进度设置
	public String signSchedule(){
		Integer pid = Integer.valueOf(ServletActionContext.getRequest().getParameter("project_id"));
		Integer schedule = Integer.valueOf(ServletActionContext.getRequest().getParameter("schedule"));
		this.project=ps.get(pid);
		this.project.setSchedule(schedule);
		if(ps.update(project))
			return "signSchedule_success";
		else {
			return "signSchedule_fail";
		}
	}
	
	//获取申请专家列表	
	public String getApplyedList(){
		int pid = Integer.valueOf(ServletActionContext.getRequest().getParameter("project_id"));
		getBProject();
		backList1=new ArrayList<Expert>();
		backList2=new ArrayList<Expert>();
		backList1=ps.getApplyedList(pid).get(0);
		backList2=ps.getApplyedList(pid).get(1);
		return "getApplyedList";
	}
	
	//获取申请专家详情
	public String getApplyedExpert(){
		getBProject();
		int eid = Integer.valueOf(ServletActionContext.getRequest().getParameter("eid"));
		int pid = Integer.valueOf(ServletActionContext.getRequest().getParameter("project_id"));
		expert=new ExpertServiceBean().get(eid);
		String sql="update expert."+pid+" set checked=1 where eid="+eid;
		ps.createSQL(sql);
		return "getApplyedExpert";
	}


}