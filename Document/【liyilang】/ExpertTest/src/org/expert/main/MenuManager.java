package org.expert.main;

import org.expert.pojo.AccessToken;
import org.expert.pojo.Button;
import org.expert.pojo.CommonButton;
import org.expert.pojo.ComplexButton;
import org.expert.pojo.Menu;
import org.expert.pojo.ViewButton;
import org.expert.util.WechatUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

 /**
  * 菜单管理类
  * @author Seth
  *
  */


public class MenuManager {
	private static Logger log = LoggerFactory.getLogger(MenuManager.class);
	
	public static void main(String[] args) {
		//第三方用户唯一凭证
		String appId="wxebafdf9647c9cbbb";
		//第三方用户唯一凭证密钥
		String appSecret="41bec8f05dc1972b2e6f19c5e2e9b80f";
		
		//调用借口获取access_token
		AccessToken at = WechatUtil.getAccessToken(appId, appSecret);
		
		if (null!= at){
			//调用借口创建菜单
			int result = WechatUtil.createMenu(getMenu(), at.getToken());
			
			//判断菜单创建结果
			if (0 == result)
				log.info("菜单创建成功");
			else 
				log.info("菜单创建失败，错误码："+result);
			
		}
		
	}
	
	/**
	 * 组装菜单数据
	 * 
	 * @return
	 */
	private static Menu getMenu(){
  
       /* CommonButton btn21 = new CommonButton();  
        btn21.setName("21");  
        btn21.setType("click");  
        btn21.setKey("21");  
  
        CommonButton btn22 = new CommonButton();  
        btn22.setName("22");  
        btn22.setType("click");  
        btn22.setKey("22");  
  
        CommonButton btn23 = new CommonButton();  
        btn23.setName("23");  
        btn23.setType("click");  
        btn23.setKey("23");  */
 
  
        CommonButton btn31 = new CommonButton();  
        btn31.setName("联系我们");  
        btn31.setType("click");  
        btn31.setKey("31");  
  
        CommonButton btn32 = new CommonButton();  
        btn32.setName("反馈");  
        btn32.setType("click");  
        btn32.setKey("32");  
  
        ViewButton btn33 = new ViewButton();
        btn33.setName("关于我们");
        btn33.setType("view");
        btn33.setUrl("http://wechatexpert.nat123.net/ExpertTest/index.jsp");
  
        ViewButton mainBtn1 = new ViewButton();
        mainBtn1.setName("首页");
        mainBtn1.setType("view");
        mainBtn1.setUrl("http://wechatexpert.nat123.net/ExpertTest/loginPage/login.jsp"); 
  
        
  
        ComplexButton mainBtn3 = new ComplexButton();  
        mainBtn3.setName("更多");  
        mainBtn3.setSub_button(new Button[] { btn31, btn32, btn33 });  
  
  
        Menu menu = new Menu();  
        menu.setButton(new Button[] {mainBtn1, mainBtn3 });  
  
        return menu; 
	   
	}
	

}
