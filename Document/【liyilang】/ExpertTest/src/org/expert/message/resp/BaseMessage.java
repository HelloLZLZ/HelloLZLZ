package org.expert.message.resp;

/**
 * ��Ϣ���ࣨ�����˺�->��ͨ�û���
 * @author Seth
 *
 */

public class BaseMessage {
	//���շ��˺ţ��յ���OpenId��
	private String ToUserName;
	//������΢��
	private String FromUserName;
	//��Ϣ����ʱ��
	private long CreateTime;
	//��Ϣ����
	private String MsgType;
	//΢��0x0001����ʶʱ���Ǳ���յ�����Ϣ
	private int FuncFlag;
	
	
	public String getToUserName() {
		return ToUserName;
	}
	public void setToUserName(String toUserName) {
		ToUserName = toUserName;
	}
	public String getFromUserName() {
		return FromUserName;
	}
	public void setFromUserName(String fromUserName) {
		FromUserName = fromUserName;
	}
	public long getCreateTime() {
		return CreateTime;
	}
	public void setCreateTime(long createTime) {
		CreateTime = createTime;
	}
	public String getMsgType() {
		return MsgType;
	}
	public void setMsgType(String msgType) {
		MsgType = msgType;
	}
	public int getFuncFlag() {
		return FuncFlag;
	}
	public void setFuncFlag(int funcFlag) {
		FuncFlag = funcFlag;
	}


}
