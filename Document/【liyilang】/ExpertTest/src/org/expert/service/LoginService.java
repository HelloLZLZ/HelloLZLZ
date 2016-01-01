package org.expert.service;

import org.expert.model.Business;
import org.expert.model.Expert;
import org.expert.model.User;

public interface LoginService {
	
	boolean hasExpertUser(String name);
	
	boolean hasBusinessUser(String name);
	
	boolean checkUserLogin(User user);
	
	boolean checkExpertLogin(Expert expert);
	
	boolean checkBusinessLogin(Business business);
	
	int register(User user);
	
	int expertRegister(Expert expert);
	
	int businessRegister(Business business);

	User getUserFromName(String name);
	
	Expert getExpertFromName(String name);
	
	Business getBusinessFromName(String name);
	
	void updateLoginInfo(User user);
}