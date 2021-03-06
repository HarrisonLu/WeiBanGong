package com.weixin.sdk.message.result.handler;

import com.weixin.sdk.message.Message;
import com.weixin.sdk.message.MessageResultText;

public class MessageResultHandlerText extends MessageResultHandlerHelper {

    @Override
    public String getMessageResult(Message message) {
        MessageResultText messageResultText = (MessageResultText) message;
        StringBuffer buffer = new StringBuffer();
        buffer.append(
                wrapperContent(TAG_TOUSERNAME,
                        messageResultText.getToUserName(), true))
                .append(wrapperContent(TAG_FROMUSERNAME,
                        messageResultText.getFromUserName(), true))
                .append(wrapperContent(TAG_CREATETIME,
                        messageResultText.getCreateTime() + "", false))
                .append(wrapperContent(TAG_MSGTYPE,
                        messageResultText.getMsgType(), true))
                .append(wrapperContent(TAG_CONTENT,
                        messageResultText.getContent(), true))
                .append(wrapperContent(TAG_FUNCFLAG,
                        messageResultText.getFuncFlag() + "", false));
        return wrapperXmlContent(buffer.toString());
    }
}
