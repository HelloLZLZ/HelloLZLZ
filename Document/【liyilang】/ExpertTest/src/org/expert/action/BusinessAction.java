package org.expert.action;
/**
 * @author Seth 
 * 
 */

import java.io.IOException; 
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;









import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.expert.common.DataHelper;
import org.expert.model.Business;
import org.expert.model.Project;
import org.expert.service.ExpertService;
import org.expert.service.impl.BusinessServiceBean;
import org.expert.service.impl.ExpertServiceBean;
import org.expert.service.impl.ProjectServiceBean;








import org.omg.CORBA.PUBLIC_MEMBER;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BusinessAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private Project project;
    private Business business;
    Map<String, List<Project>> request;
    ActionContext ctx=ActionContext.getContext();
    ProjectServiceBean ps=new ProjectServiceBean();
	BusinessServiceBean bs=new BusinessServiceBean();
	private final List<String> businessList = DataHelper.getBusinessList();
	private final List<String> budgetList = DataHelper.getBudgetList();   
	
	public List<String> getBusinessList() {
		return businessList;
	}

	public List<String> getBudgetList() {
		return budgetList;
	}


	
	
	public Map<String, List<Project>> getRequest() {
		return request;
	}
	public void setRequest(Map<String, List<Project>> request) {
		this.request = request;
	}
	public Business getBusiness() {
		return business;
	}
	public void setBusiness(Business business) {
		this.business = business;
	}
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	
	public String enterProfile(){
		
		initProfile();
		return "enter_success";
		
	}
	
	public String initProfile(){
		int userid = (Integer) ctx.getSession().get("buserid");
		String username = String.valueOf(ctx.getSession().get("busername"));
		this.business = bs.get(userid);
		return "init_success";
	}
	
	public void saveProfile() throws IOException{
		
		initProfile();
		HttpServletRequest req=ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();    
		response.setCharacterEncoding("UTF-8");   
		PrintWriter out = response.getWriter(); 
		
		
		String name=req.getParameter("name");
		String tel=req.getParameter("phone");
		String net=req.getParameter("website");
		int  vocation=Integer.valueOf(req.getParameter("business"));
		String summary=req.getParameter("introduction");
		this.business.setBname(name);
		this.business.setBtel(tel);
		this.business.setBnet(net);
		this.business.setBvocation(vocation);
		this.business.setBsummary(summary);
		if(bs.update(business)){
	        out.println("资料保存成功");    
	        out.flush();    
	        out.close();    
		}
		out.println("资料保存失败"); 
		out.flush();
		out.close();	
	}
	
	
	public void modifyPwd() throws IOException{
		System.out.print("modify password");
		initProfile();
		HttpServletRequest req=ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse(); 
		PrintWriter out = response.getWriter(); 
		
		String oldPwd=req.getParameter("oldpwd");
		String newPwd=req.getParameter("newpwd");
		
		if (business.getBpwd().equals(oldPwd)){
			business.setBpwd(newPwd);
			if(bs.update(business)){
			req.setAttribute("message", "密码修改成功");
			out.print("密码修改成功");
		   
			}
		}
		else {
			req.setAttribute("message", "密码修改失败");
			out.print("密码修改失败");
		}
			
		
		
		
		
	}
	
/*	public void createProject() throws ServletException, IOException{
		


		String temp_str="";   
	    Date dt = new Date();   
	    //最后的aa表示“上午”或“下午”    HH表示24小时制    如果换成hh表示12小时制   
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
	    temp_str=sdf.format(dt); 
	    int bid=(Integer) ctx.getSession().get("buserid");
		HttpServletRequest req=ServletActionContext.getRequest();
		
		HttpServletResponse response = ServletActionContext.getResponse();    
		response.setCharacterEncoding("UTF-8");   
		PrintWriter out = response.getWriter(); 
		
		String name=req.getParameter("name");
		String tag=req.getParameter("tag");
		String deadline=req.getParameter("deadline")+" 00:00:00";
		String pdescrpt=req.getParameter("detail");
		String budget=req.getParameter("money");
		System.out.println("id:"+bid+"name:"+name);
		System.out.println(temp_str);
		this.business=bs.get(bid);
		System.out.print(business.getBname());
		this.project=new Project();
		this.project.setPname(name);
		this.project.setTag(Integer.valueOf(tag));
		this.project.setPdescrpt(pdescrpt);
		this.project.setBudget(Integer.valueOf(budget));
		this.project.setBusiness(business);
		this.project.setSchedule(0);
		this.project.setDeadline(Timestamp.valueOf(deadline));
		this.project.setStarttime(new Timestamp(System.currentTimeMillis()));
		
		if(ps.save(project)){
			String hql="create table expert."+project.getPid()+"(eid int,checked int default 0)";
			ps.createSQL(hql);
	        out.println("项目创建成功");    
	        out.flush();    
	        out.close();  
		}
		out.println("项目创建失败"); 
		out.flush();
		out.close();
		 
		//return null;
		//if(ps.save(project)){
		// System.out.println("项目发布成功");

	     // req.getRequestDispatcher("../business/company_home.jsp").forward(req, null);
		}


	
	@SuppressWarnings("unchecked")
	public String searchBprojects(){
		String result = "error";
		
		int bid=(Integer) ctx.getSession().get("buserid");
	    List<Project> projects0, projects1, projects2, projects3;
	    Map<String, List<Project>> request;
	    String HQL;
		HQL="from Project p where p.schedule=0 and  p.business.bid="+bid;
		projects0 = ps.getListByK(HQL);
		HQL="from Project p where p.schedule=1 and  p.business.bid="+bid;
		projects1 = ps.getListByK(HQL);
		HQL="from Project p where p.schedule=2 and  p.business.bid="+bid;
 		projects2 = ps.getListByK(HQL);
 		HQL="from Project p where p.schedule=3 and  p.business.bid="+bid;
 		projects3 = ps.getListByK(HQL);
        System.out.println("p0"+projects0.size());
        System.out.println("p1"+projects1.size());
        System.out.println("p2"+projects2.size());
        System.out.println("p3"+projects3.size());
 		
 		request =(Map<String, List<Project>>) ctx.get("request");
 		request.put("projects0", projects0);
 		request.put("projects1", projects1);
 		request.put("projects2", projects2);
 		request.put("projects3", projects3);
 		if(!request.isEmpty()){
 			result="search_bprojects";
 		}
		
		return result;
	}*/
}
