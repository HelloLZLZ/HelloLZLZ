package org.expert.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.expert.common.DataHelper;
import org.expert.model.Expert;
import org.expert.service.ExpertService;
import org.expert.service.impl.ExpertServiceBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ExpertAction extends ActionSupport {
 
	/**
	 * Author: zhugexubin
	 */
	private static final long serialVersionUID = 1L;
	
	private Expert expert;
	private ExpertService es;
	 
	private final List<String> businessList = DataHelper.getBusinessList();
	private final List<String> jobList = DataHelper.getJobList(); 
	private final List<String> budgetList = DataHelper.getBudgetList();
	private final List<String> privacyList = DataHelper.getPrivacyList();
	
	public Expert getExpert(){
		return this.expert;
	}
	
	public void setExpert(Expert expert){
		this.expert = expert;
	}
	 
	public List<String> getBusinessList() {
		return this.businessList;
	}

	public List<String> getJobList() {
		return this.jobList;
	}
	
	public List<String> getBudgetList() {
		return this.budgetList;
	}
	
	public List<String> getPrivacyList() {
		return this.privacyList;
	}
	
	public String initProfile(){
		ActionContext ctx = ActionContext.getContext();
		int userid = (Integer) ctx.getSession().get("euserid");
		
		ExpertService es = new ExpertServiceBean();
		this.expert = es.get(userid);
		System.out.println(this.expert); //--- for test
		
		return "init_success";
	}
	
	public String enterProfile(){
		initProfile();
		Iterator<String> i = jobList.iterator();
		while(i.hasNext()){
			System.out.println(i.next()+"--");
		}
		return "enter_success";
	}
	
	public String enterPhoto(){
		initProfile();
		return "enter_photo_success";
	}
	
	public String enterModifyPwd(){
		initProfile();
		return "enter_pwd_success";
	}
	//保存专家个人资料
	public String saveProfile() throws IOException{
		es = new ExpertServiceBean();
		ActionContext ctx = ActionContext.getContext();
		int userid = (Integer) ctx.getSession().get("euserid");
		
		HttpServletResponse response = ServletActionContext.getResponse();    
		response.setCharacterEncoding("UTF-8");   
		PrintWriter out = response.getWriter(); 
		//获取原始的PrintWriter对象,以便输出响应结果,而不用跳转到某个试图    
		HttpServletRequest request = ServletActionContext.getRequest();
		//接收前台页面传来的表单数据
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		int business = Integer.parseInt(request.getParameter("business"));
		int job = Integer.parseInt(request.getParameter("job"));
		int years = Integer.parseInt(request.getParameter("years"));
		String introduction = request.getParameter("introduction");
		String education = request.getParameter("education");
		int interest = Integer.parseInt(request.getParameter("interest"));
		  
		this.expert = es.get(userid);
		//将数据进行更新
		this.expert.setName(name);
		this.expert.setPhone(phone);
		this.expert.setEvocation(business);
		this.expert.setEdomain(job);
		this.expert.setEyears(years);
		this.expert.setProfile(introduction);
		this.expert.setEducation(education);
		this.expert.setInterest(interest);
		
		if(es.update(expert)){	     
	        out.println("资料保存成功");    
	        out.flush();    
	        out.close();    
		}
		out.println("资料保存失败"); 
		out.flush();
		out.close();
		
		return null;
	}
	//保存专家头像
	public String savePhoto() throws IOException{
		es = new ExpertServiceBean();
		ActionContext ctx = ActionContext.getContext();
		int userid = (Integer) ctx.getSession().get("euserid");
		//获取原始的PrintWriter对象,以便输出响应结果,而不用跳转到某个试图    
		String imgName = ServletActionContext.getRequest().getParameter("imgName");
		HttpServletResponse response = ServletActionContext.getResponse();    
		//设置字符集    
		response.setCharacterEncoding("UTF-8");   
		PrintWriter out = response.getWriter();   
		
		this.expert = es.get(userid);
		System.out.println(this.expert+"---imgName:"+imgName); //--- for test
		this.expert.setPhoto(imgName);
		
		if(es.update(expert)){	     
	        out.println("头像保存成功");    
	        out.flush();    
	        out.close();    
		}
		out.println("头像保存失败"); 
		out.flush();
		out.close();
		
		return null;
	}
	//修改密码
	public String modifyPwd() throws IOException{
		System.out.println("saveExpertModify------------");
		es = new ExpertServiceBean();
		ActionContext ctx = ActionContext.getContext();
		int userid = (Integer) ctx.getSession().get("euserid");
		this.expert = es.get(userid);
		
		HttpServletResponse response = ServletActionContext.getResponse();    
		response.setCharacterEncoding("UTF-8");   
		PrintWriter out = response.getWriter(); 
		//获取原始的PrintWriter对象,以便输出响应结果,而不用跳转到某个试图    
		HttpServletRequest request = ServletActionContext.getRequest();
		//接收前台页面传来的表单数据
		String newpwd = request.getParameter("newpwd");
		String oldpwd = request.getParameter("oldpwd");
		String email = request.getParameter("email");
		
		if(expert.getEpwd().equals(oldpwd)) {
			expert.setEpwd(newpwd);
			expert.setEmail(email);
			es.update(expert);
			out.println("密码修改成功");    
	        out.flush();    
	        out.close();    
		}
		System.out.println("after saveExpertModify------------");
		out.println("密码修改失败"); 
		out.flush();
		out.close();
		return null;
	}
}
