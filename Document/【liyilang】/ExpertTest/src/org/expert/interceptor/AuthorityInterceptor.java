package org.expert.interceptor;



import org.hibernate.Session;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AuthorityInterceptor extends AbstractInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		ActionContext ctx=invocation.getInvocationContext();
		
		    
		if (ctx.getSession().get("buserid")!=null  || ctx.getSession().get("euserid") != null){
			return invocation.invoke();
		}
		return Action.LOGIN; 
	}

}
