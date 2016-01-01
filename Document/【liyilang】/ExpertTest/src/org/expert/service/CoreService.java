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
	 * 处理微信发来的请求
	 * 
	 * @param request
	 * @return
	 */
	public static String processRequest(HttpServletRequest request){
		String respMessage = null;
		try {
			//默认返回文本消息内容
			String respContent = "请求处理异常，请稍后尝试";
		    
			//xml请求解析
			Map<String, String> requestMap = MessageUtil.parseXml(request);
			
			//发送方账号（openid）
			String fromUserName = requestMap.get("FromUserName");
			//公众账号
			String toUserName = requestMap.get("ToUserName");
			//消息类型
			String msgType = requestMap.get("MsgType");
			
			//回复文本消息
			TextMessage textMessage = new TextMessage();
			textMessage.setToUserName(fromUserName);
			textMessage.setFromUserName(toUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			textMessage.setFuncFlag(0);
			
			//文本消息
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)){
				respContent = "您发送的是文本消息";
			}
			//图片消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)){
				respContent = "您发送的是图片消息";
			}
			//地理位置消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)){
				respContent =  "您发送的是地理位置消息";
			}
			//链接消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)){
				respContent = "您发送的是链接消息";
			}
			//音频消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)){
				respContent = "您发送的是音频消息";
			}
			//事件推送
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)){
				//事件类型
				String eventType = requestMap.get("Event");
				//订阅
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)){
						//创建图文消息
						List<Article> list = new ArrayList<Article>(); 
						NewsMessage newsMessage = new NewsMessage();
						newsMessage.setToUserName(fromUserName);
						newsMessage.setFromUserName(toUserName);
						newsMessage.setCreateTime(new Date().getTime());
						newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
						newsMessage.setFuncFlag(0);
						Article article = new Article();
						article.setTitle("专家汇");
						article.setDescription("欢迎关注专家汇");
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
				//取消订阅
				else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)){
					//TODO 取消订阅后用户不会再收到消息
					respContent = "用户取消订阅";
				}
				//自定义菜单点击事件
				else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)){
					//TODO 自定义菜单权没用开放，暂不处理该类消息
					String eventKey = requestMap.get("EventKey");  
					  
                    if (eventKey.equals("11")) {  
                        respContent = "11！";  
                    } else if (eventKey.equals("12")) {  
                        respContent = "欢迎关注专家汇！";  
                    } else if (eventKey.equals("13")) {  
                        respContent = "欢迎关注专家汇！！";  
                    } else if (eventKey.equals("21")) {  
                        respContent = "欢迎关注专家汇！！";  
                    } else if (eventKey.equals("22")) {  
                        respContent = "欢迎关注专家汇！";  
                    } else if (eventKey.equals("23")) {  
                        respContent = "欢迎关注专家汇！";  
                    } else if (eventKey.equals("31")) {  
                        respContent = "欢迎关注专家汇！";  
                    } else if (eventKey.equals("32")) {  
                        respContent = "欢迎关注专家汇！";  
                    } else if (eventKey.equals("33")) {  
                        respContent = "欢迎关注专家汇！";  
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
