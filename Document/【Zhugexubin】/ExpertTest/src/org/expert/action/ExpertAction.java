package org.expert.action;

import org.expert.model.Expert;
import org.expert.service.ExpertService;
import org.expert.service.impl.ExpertServiceBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ExpertAction extends ActionSupport {
 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	 
	private Expert expert;
	private ExpertService es;
	
	public Expert getExpert(){
		return this.expert;
	}
	
	public void setExpert(Expert expert){
		this.expert = expert;
	}
	 
	public String initProfile(){
		ActionContext ctx = ActionContext.getContext();
		int userid = (Integer) ctx.getSession().get("euserid");
		String username = String.valueOf(ctx.getSession().get("eusername"));
		
		ExpertService es = new ExpertServiceBean();
		this.expert = es.get(userid);
		System.out.println(this.expert); //--- for test
		
		return "init_success";
	}
	
	public String enterProfile(){
		initProfile();
		return "enter_success";
	}
	
	public String enterPhoto(){
		initProfile();
		return "enter_photo_success";
	}
	
	public String saveProfile(){
		es = new ExpertServiceBean();
		//es.update(expert);
		Expert e = es.get(expert.getEid());		
		e.copy(expert);
		es.update(e);
	
		return "save_success";
	}
	
 
	
}
