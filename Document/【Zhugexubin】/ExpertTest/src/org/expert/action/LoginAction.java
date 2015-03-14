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
 * 1.Struts2鐩存帴浣跨敤Action鏉ュ皝瑁匟TTP璇锋眰鍙傛暟锛屽洜姝ction绫诲簲璇ュ寘鍚笌璇锋眰鐩稿搴旂殑灞炴?锛屽苟涓鸿灞炴?鎻愪緵瀵瑰簲鐨剆etter鍜実etter鏂规硶銆?
 * 2.涓篈ction绫婚噷澧炲姞涓?釜execute鏂规硶锛屽洜涓篠truts2妗嗘灦榛樿浼氭墽琛岃繖涓柟娉曘?杩欎釜鏂规硶鏈韩骞朵笉鍋氫笟鍔￠?杈戝鐞嗭紝鑰屾槸璋冪敤鍏朵粬涓氬姟閫昏緫缁勪欢瀹屾垚杩欓儴鍒嗗伐浣溿? 
 * 3.Action绫昏繑鍥炰竴涓爣鍑嗙殑瀛楃涓诧紝璇ュ瓧绗︿覆鏄竴涓?杈戣鍥惧悕锛岃瑙嗗浘鍚嶅搴斿疄闄呯殑鐗╃悊瑙嗗浘銆?
 * 
 * Action鐨勭壒鐐癸細
 * 鈥truts2妗嗘灦涓瑼ction鏄竴涓狿OJO锛屾病鏈夎浠ｇ爜姹℃煋銆?
 * 鈥truts2涓殑Action鐨別xecute鏂规硶涓嶄緷璧栦簬servlet API锛屾敼鍠勪簡Struts1涓?鍚堣繃浜庣揣瀵嗭紝鏋佸ぇ鏂逛究浜嗗崟鍏冩祴璇曘? 
 * 鈥truts2鐨凙ction鏃犻』鐢ˋctionForm灏佽璇锋眰鍙傛暟銆?
 * 鈥㈢浉瀵筍truts1妗嗘灦鑰岃█锛孲truts2鐨勯?杈戣鍥句笉鍐嶆槸ActionForward瀵硅薄锛岃?鏄竴涓櫘閫氱殑瀛楃涓诧紝鍒╀簬鍒嗙鍜屽鐢ㄣ? 
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
		loginService = new LoginServiceBean();
		String uname = ServletActionContext.getRequest().getParameter("username");
		boolean boo = loginService.hasUser(uname);
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
