package org.expert.message.resp;

/**
 * ͼ��model
 * @author Seth
 *
 */

public class Article {
	//ͼ����Ϣ����
	private String Title;
	//ͼ����Ϣ����
	private String Description;
	//ͼƬ����
	private String PicUrl;
	//���ͼ����Ϣ��ת����
	private String Url;
	
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getPicUrl() {
		return null == PicUrl ? "" : PicUrl;
	}
	public void setPicUrl(String picUrl) {
		PicUrl = picUrl;
	}
	public String getUrl() {
		return null == Url ? "" : Url;
	}
	public void setUrl(String url) {
		this.Url = url;
	}


}
