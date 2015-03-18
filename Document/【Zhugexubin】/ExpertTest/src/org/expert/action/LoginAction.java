package org.expert.action;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.expert.model.Business;
import org.expert.model.Expert;
import org.expert.model.User;
import org.expert.service.LoginService;
import org.expert.service.impl.LoginServiceBean;


 
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends ActionSupport {
	
	/**
	 * Author: zhugexubin
	 */
	private static final long serialVersionUID = 1L;
	private User user = new User();
	private Expert expert = new Expert();
	private Business business = new Business();
	private LoginService loginService;
	
	public User getUser() {
		return this.user;
	}
	public void setUser(User user){
		this.user = user;
	}
	
	public Expert getExpert(){
		return this.expert;
	}
	public void setExpert(Expert expert){
		this.expert = expert;
	}
	public Business getBusiness(){
		return this.business;
	}
	public void setBusiness(Business business){
		this.business = business;
	}
	
	public String login() throws Exception {
		loginService = new LoginServiceBean();
		if(user.getUsertype() == 1){
			expert.setEusername(user.getUsername());
			expert.setEpwd(user.getPassword());
			Expert usertmp = loginService.getExpertFromName(expert.getEusername()); 
			if(loginService.checkExpertLogin(expert)) {
				ActionContext ctx = ActionContext.getContext();
				Map<String, Object> session = ctx.getSession();
				
				session.put("euserid", usertmp.getEid());
				session.put("eusername", usertmp.getEusername());
				session.put("usertype", 1);
				session.put("epwd", usertmp.getEpwd());
				//Timestamp ts = new Timestamp(System.currentTimeMillis());
				//usertmp.setLogintime(ts);  
				//loginService.updateLoginInfo(usertmp);
				return "expert_login_success";
			}
			return "not-login";
			
		}else if(user.getUsertype() == 2){
			business.setBusername(user.getUsername());
			business.setBpwd(user.getPassword());
			Business usertmp = loginService.getBusinessFromName(business.getBusername()); 
			if(loginService.checkBusinessLogin(business)) {
				ActionContext ctx = ActionContext.getContext();
				Map<String, Object> session = ctx.getSession();
				
				session.put("buserid", usertmp.getBid());
				session.put("busername", usertmp.getBusername());
				session.put("usertype", 2);
				return "business_login_success";
			}
			return "not-login";
		}
		return "not-login";
	}
	
	/*********** 验证专家用户名是否存在 *****************/
	public String expertExist() throws Exception{
		loginService = new LoginServiceBean();
		String uname = ServletActionContext.getRequest().getParameter("username");
		boolean boo = loginService.hasExpertUser(uname);
		System.out.println("++++++++++++"+uname);
		//获取原始的PrintWriter对象,以便输出响应结果,而不用跳转到某个试图    
		HttpServletResponse response = ServletActionContext.getResponse();    
		//设置字符集    
		response.setCharacterEncoding("UTF-8");    
		PrintWriter out = response.getWriter();    
		if(boo){	     
	        //直接输入响应的内容    
	        out.println("用户名已存在");    
	        out.flush();    
	        out.close();    
		}
		out.println("用户名可用"); 
		out.flush();
		out.close();
		
		return null;
	}
	
	/*********** 验证企业用户名是否存在 *****************/
	public String businessExist() throws Exception{
		loginService = new LoginServiceBean();
		String uname = ServletActionContext.getRequest().getParameter("username");
		boolean boo = loginService.hasBusinessUser(uname);
		System.out.println("++++++++++++"+uname);
		//获取原始的PrintWriter对象,以便输出响应结果,而不用跳转到某个试图    
		HttpServletResponse response = ServletActionContext.getResponse();    
		//设置字符集    
		response.setCharacterEncoding("UTF-8");    
		PrintWriter out = response.getWriter();    
		if(boo){	     
	        //直接输入响应的内容    
	        out.println("用户名已存在");    
	        out.flush();    
	        out.close();    
		}
		out.println("用户名可用"); 
		out.flush();
		out.close();
		
		return null;
	}
	
	public String register() throws Exception { 
		
		String result = "error";
		//loginService = new LoginServiceBean();
		switch(loginService.register(user)) {
		case 0:
			result = "error";break;
		case 1:
			result = "uname_exist";break;
		case 2:
			result = "register_success";break;
		}
	
		return result;
	}
	
	public String expertRegister() throws Exception { 
		
		String result = "error";
		loginService = new LoginServiceBean();
		switch(loginService.expertRegister(expert)) {
		case 0:
			result = "error";break;
		case 1:
			result = "uname_exist";break;
		case 2:
			result = "expert_register_success";break;
		}
		System.out.println("===========result:"+result);
		return result;
	}
	public String businessRegister() throws Exception { 
		System.out.println("register1-------------------------");
		String result = "error";
		loginService = new LoginServiceBean();
		switch(loginService.businessRegister(business)) {
		case 0:
			System.out.println("register2-------------------------");
			result = "error";break;
		case 1:
			result = "uname_exist";break;
		case 2:
			result = "business_register_success";break;
		}
		return result;
	}
	public String logout() {
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> session = ctx.getSession();
		session.remove("userid");
		session.remove("username");
		session.remove("usertype");
		session.remove("epwd");
		return "logout_success";
	}
}
