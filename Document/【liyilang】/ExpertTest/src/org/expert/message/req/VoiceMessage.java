package org.expert.message.req;

/**
 * ��Ƶ��Ϣ
 * @author Seth
 *
 */

public class VoiceMessage extends BaseMessage{
	//ý��id
	private String MediaId;
	//���Ը�ʽ
	private String Format;
	
	public String getMediaId() {
		return MediaId;
	}
	public void setMediaId(String mediaId) {
		MediaId = mediaId;
	}
	public String getFormat() {
		return Format;
	}
	public void setFormat(String format) {
		Format = format;
	}

	
	

}
