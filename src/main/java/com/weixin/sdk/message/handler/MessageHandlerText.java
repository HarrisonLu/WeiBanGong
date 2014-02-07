package com.weixin.sdk.message.handler;

import org.w3c.dom.Element;

import com.weixin.sdk.message.Message;
import com.weixin.sdk.message.MessageText;

public class MessageHandlerText extends MessageHandlerHelper {

    @Override
    protected void parseSpecificMessage(Message message, Element root) {
        MessageText messageText = (MessageText) message;
        messageText.setContent(root.getElementsByTagName(TAG_CONTENT).item(0)
                .getTextContent());
    }

    @Override
    protected Message handleSpecificMessage() {
        return null;
    }

}
