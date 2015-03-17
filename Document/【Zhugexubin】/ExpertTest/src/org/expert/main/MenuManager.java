package org.expert.main;

import org.expert.pojo.AccessToken;
import org.expert.pojo.Button;
import org.expert.pojo.CommonButton;
import org.expert.pojo.ComplexButton;
import org.expert.pojo.Menu;
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
		CommonButton btn11 = new CommonButton();  
        btn11.setName("11");  
        btn11.setType("click");  
        btn11.setKey("11");  
  
        CommonButton btn12 = new CommonButton();  
        btn12.setName("12");  
        btn12.setType("click");  
        btn12.setKey("12");  
  
        CommonButton btn13 = new CommonButton();  
        btn13.setName("13");  
        btn13.setType("click");  
        btn13.setKey("13");   
  
        CommonButton btn21 = new CommonButton();  
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
        btn23.setKey("23");  
 
  
        CommonButton btn31 = new CommonButton();  
        btn31.setName("31");  
        btn31.setType("click");  
        btn31.setKey("31");  
  
        CommonButton btn32 = new CommonButton();  
        btn32.setName("32");  
        btn32.setType("click");  
        btn32.setKey("32");  
  
        CommonButton btn33 = new CommonButton();  
        btn33.setName("33");  
        btn33.setType("click");  
        btn33.setKey("33");  
  
        ComplexButton mainBtn1 = new ComplexButton();  
        mainBtn1.setName("1");  
        mainBtn1.setSub_button(new CommonButton[] { btn11, btn12, btn13});  
  
        ComplexButton mainBtn2 = new ComplexButton();  
        mainBtn2.setName("2");  
        mainBtn2.setSub_button(new CommonButton[] { btn21, btn22, btn23 });  
  
        ComplexButton mainBtn3 = new ComplexButton();  
        mainBtn3.setName("3");  
        mainBtn3.setSub_button(new CommonButton[] { btn31, btn32, btn33 });  
  
  
        Menu menu = new Menu();  
        menu.setButton(new Button[] { mainBtn1, mainBtn2, mainBtn3 });  
  
        return menu; 
	   
	}
	

}
