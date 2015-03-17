package org.expert.action;

import org.expert.pojo.Expert;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import freemarker.template.utility.Execute;

public class RegisterAction extends ActionSupport implements ModelDriven<Expert> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private Expert expert=new Expert();
    public String execute(){
    	System.out.print(expert.getUsername());
    	//String name=ActionContext.getContext().ge
    	return "success";
    	
    }

	@Override
	public Expert getModel() {
		// TODO Auto-generated method stub
		return expert;
	}

}
