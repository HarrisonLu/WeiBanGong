package com.weixin.sdk.message.result.handler;

import com.weixin.sdk.message.IMessage;
import com.weixin.sdk.message.Message;

public class MessageResultHandlerHelper implements IMessageResultHandler, IMessage {

	@Override
	public String getMessageResult(Message message) {
		return null;
	}

	public String wrapperContent(String tag, String content, boolean isCdata) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("<" + tag + ">");
		if (isCdata) {
			buffer.append("<![CDATA[");
		}
		buffer.append(content);
		if (isCdata) {
			buffer.append("]]>");
		}
		buffer.append("</" + tag + ">");
		return buffer.toString();
	}

	public String wrapperXmlContent(String content) {
		StringBuffer buffer = new StringBuffer();
		buffer.append("<" + TAG_XML + ">");
		buffer.append(content);
		buffer.append("</" + TAG_XML + ">");
		return buffer.toString();
	}

}
