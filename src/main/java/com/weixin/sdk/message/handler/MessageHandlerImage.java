package com.weixin.sdk.message.handler;

import org.w3c.dom.Element;

import com.weixin.sdk.message.Message;
import com.weixin.sdk.message.MessageImage;

public class MessageHandlerImage extends MessageHandlerHelper {

    @Override
    protected void parseSpecificMessage(Message message, Element root) {
        MessageImage messageImage = (MessageImage) message;
        messageImage.setPicUrl(root.getElementsByTagName(TAG_PICURL).item(0)
                .getTextContent());
    }

    @Override
    protected Message handleSpecificMessage() {
        return null;
    }

}
