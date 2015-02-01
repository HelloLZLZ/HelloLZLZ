package org.expert.servlet;

import java.io.IOException; 
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.expert.service.CoreService;
import org.expert.util.SignUtil;
/*
 * ������������
 * @author Seth
 */
/**
 * Servlet implementation class CoreServlet
 */

public class CoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /*
     * ȷ����������΢�ŷ�����
     */
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//΢�ż���ǩ��
		String signature = request.getParameter("signature");
		//ʱ���
		String timestamp = request.getParameter("timestamp");
		//�����
		String nonce = request.getParameter("nonce");
		//����ַ���
		String echostr = request.getParameter("echostr");
		
		PrintWriter out =response.getWriter();
		//ͨ������signature���������У�飬��У��ɹ���ԭ������echostr����ʾ����ɹ����������ʧ��
		if(SignUtil.checkSignature(signature, timestamp, nonce)){
			out.print(echostr);
		}
		out.close();
		out = null;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//����������Ӧ����
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//���ú���ҵ���������Ϣ��������Ϣ
		String respMessage =  CoreService.processRequest(request);
		
		//��Ӧ��Ϣ
		PrintWriter out = response.getWriter();
		out.print(respMessage);
		out.close();
		

		
	}

}
