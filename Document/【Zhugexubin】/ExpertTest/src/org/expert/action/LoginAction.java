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


/*
 * 1.Struts2直接使用Action来封装HTTP请求参数，因此Action类应该包含与请求相对应的属�?，并为该属�?提供对应的setter和getter方法�?
 * 2.为Action类里增加�?��execute方法，因为Struts2框架默认会执行这个方法�?这个方法本身并不做业务�?辑处理，而是调用其他业务逻辑组件完成这部分工作�? 
 * 3.Action类返回一个标准的字符串，该字符串是一个�?辑视图名，该视图名对应实际的物理视图�?
 * 
 * Action的特点：
 * •Struts2框架中Action是一个POJO，没有被代码污染�?
 * •Struts2中的Action的execute方法不依赖于servlet API，改善了Struts1中�?合过于紧密，极大方便了单元测试�? 
 * •Struts2的Action无须用ActionForm封装请求参数�?
 * •相对Struts1框架而言，Struts2的�?辑视图不再是ActionForward对象，�?是一个普通的字符串，利于分离和复用�? 
 */
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends ActionSupport {
	
	/**
	 * 
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
				return "business_login_success";
			}
			return "not-login";
		}
		return "not-login";
	}
	
	public String exist() throws Exception{
		//loginService = new LoginServiceBean();
		boolean boo = loginService.hasUser(user.getUsername());
		//获取原始的PrintWriter对象,以便输出响应结果,而不用跳转到某个试图    
		HttpServletResponse response = ServletActionContext.getResponse();    
		//设置字符�?   
		response.setCharacterEncoding("UTF-8");    
		PrintWriter out = response.getWriter();    
		if(boo){	     
	        //直接输入响应的内�?   
	        out.println("用户名已存在");    
	       
	        out.flush();    
	        out.close();    
		}
		out.println("用户名可�?"); 
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
			result = "register_success";break;
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
			result = "register_success";break;
		}
		return result;
	}
	public String logout() {
		ActionContext ctx = ActionContext.getContext();
		Map<String, Object> session = ctx.getSession();
		session.remove("userid");
		session.remove("username");
		session.remove("usertype");
		
		return "logout_success";
	}
}
