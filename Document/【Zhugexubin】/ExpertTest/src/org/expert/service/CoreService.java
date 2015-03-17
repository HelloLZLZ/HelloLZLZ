package org.expert.service;

import java.util.ArrayList;  
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.expert.message.resp.Article;
import org.expert.message.resp.NewsMessage;
import org.expert.message.resp.TextMessage;
import org.expert.util.MessageUtil;


public class CoreService {
	/**
	 * ����΢�ŷ���������
	 * 
	 * @param request
	 * @return
	 */
	public static String processRequest(HttpServletRequest request){
		String respMessage = null;
		try {
			//Ĭ�Ϸ����ı���Ϣ����
			String respContent = "�������쳣�����Ժ���";
		    
			//xml�������
			Map<String, String> requestMap = MessageUtil.parseXml(request);
			
			//���ͷ��˺ţ�openid��
			String fromUserName = requestMap.get("FromUserName");
			//�����˺�
			String toUserName = requestMap.get("ToUserName");
			//��Ϣ����
			String msgType = requestMap.get("MsgType");
			
			//�ظ��ı���Ϣ
			TextMessage textMessage = new TextMessage();
			textMessage.setToUserName(fromUserName);
			textMessage.setFromUserName(toUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			textMessage.setFuncFlag(0);
			
			//�ı���Ϣ
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)){
				respContent = "�����͵����ı���Ϣ";
			}
			//ͼƬ��Ϣ
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)){
				respContent = "�����͵���ͼƬ��Ϣ";
			}
			//����λ����Ϣ
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)){
				respContent =  "�����͵��ǵ���λ����Ϣ";
			}
			//������Ϣ
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)){
				respContent = "�����͵���������Ϣ";
			}
			//��Ƶ��Ϣ
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)){
				respContent = "�����͵�����Ƶ��Ϣ";
			}
			//�¼�����
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)){
				//�¼�����
				String eventType = requestMap.get("Event");
				//����
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)){
						//����ͼ����Ϣ
						List<Article> list = new ArrayList<Article>(); 
						NewsMessage newsMessage = new NewsMessage();
						newsMessage.setToUserName(fromUserName);
						newsMessage.setFromUserName(toUserName);
						newsMessage.setCreateTime(new Date().getTime());
						newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
						newsMessage.setFuncFlag(0);
						Article article = new Article();
						article.setTitle("ר�һ�");
						article.setDescription("��ӭ��ער�һ�");
						String path=request.getContextPath();
						String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
						System.out.print(basepath);
						article.setPicUrl(basepath+"/IMG_0856.JPG");
						article.setUrl(basepath+"/index.jsp");
						list.add(article);
						newsMessage.setArticleCount(list.size());
						newsMessage.setArticles(list);
						respMessage = MessageUtil.newsMessageToXml(newsMessage);
						System.out.print(respMessage);
						return respMessage;
				}
				//ȡ������
				else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)){
					//TODO ȡ�����ĺ��û��������յ���Ϣ
					respContent = "�û�ȡ������";
				}
				//�Զ���˵�����¼�
				else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)){
					//TODO �Զ���˵�Ȩû�ÿ��ţ��ݲ����������Ϣ
					String eventKey = requestMap.get("EventKey");  
					  
                    if (eventKey.equals("11")) {  
                        respContent = "11��";  
                    } else if (eventKey.equals("12")) {  
                        respContent = "��ӭ��ער�һ㣡";  
                    } else if (eventKey.equals("13")) {  
                        respContent = "��ӭ��ער�һ㣡��";  
                    } else if (eventKey.equals("21")) {  
                        respContent = "��ӭ��ער�һ㣡��";  
                    } else if (eventKey.equals("22")) {  
                        respContent = "��ӭ��ער�һ㣡";  
                    } else if (eventKey.equals("23")) {  
                        respContent = "��ӭ��ער�һ㣡";  
                    } else if (eventKey.equals("31")) {  
                        respContent = "��ӭ��ער�һ㣡";  
                    } else if (eventKey.equals("32")) {  
                        respContent = "��ӭ��ער�һ㣡";  
                    } else if (eventKey.equals("33")) {  
                        respContent = "��ӭ��ער�һ㣡";  
                    }  
				}
			}
			textMessage.setContent(respContent);
			respMessage = MessageUtil.textMessageToXml(textMessage);
			System.out.print(respMessage);
		}catch (Exception e){
			e.printStackTrace();
		}
		return respMessage;
	}

}
