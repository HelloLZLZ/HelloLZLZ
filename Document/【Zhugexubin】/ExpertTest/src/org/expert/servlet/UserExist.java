package org.expert.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.expert.service.LoginService;
import org.expert.service.impl.LoginServiceBean;

public class UserExist extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("=======================");
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		String uname = request.getParameter("username");
		
		String uname1 = request.getParameter("eusername");
		String uname2 =  request.getParameter("expert.eusername");
		System.out.println("uname =" + uname+" uname=1"+uname1+" uname2="+uname2);
		
		LoginService loginService = new LoginServiceBean();
		boolean boo = loginService.hasUser(uname);
		//获取原始的PrintWriter对象,以便输出响应结果,而不用跳转到某个试图    
		if(boo){	     
	        //直接输入响应的内容    
	        out.println("用户名已存在");    
	       
	        out.flush();    
	        out.close();    
		}
		out.println("用户名可用"); 
	 
		out.flush();
		out.close();
	}

}
