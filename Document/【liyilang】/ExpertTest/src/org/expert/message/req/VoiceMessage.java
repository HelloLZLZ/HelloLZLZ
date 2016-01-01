package org.expert.message.req;

/**
 * 音频消息
 * @author Seth
 *
 */

public class VoiceMessage extends BaseMessage{
	//媒体id
	private String MediaId;
	//语言格式
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
