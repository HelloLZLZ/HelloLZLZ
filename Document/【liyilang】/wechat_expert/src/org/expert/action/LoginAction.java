package org.expert.action;

import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.expert.pojo.User;
import org.omg.CORBA.PUBLIC_MEMBER;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {

	/**
	 * 
	 */
    private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	private static final long serialVersionUID = 1L;

	public String execute(){
	    
		

		
		return "success";
		
	}

}
