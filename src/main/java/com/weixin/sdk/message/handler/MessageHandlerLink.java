package com.weixin.sdk.message.handler;

import org.w3c.dom.Element;

import com.weixin.sdk.message.Message;
import com.weixin.sdk.message.MessageLink;

public class MessageHandlerLink extends MessageHandlerHelper {

    @Override
    protected void parseSpecificMessage(Message message, Element root) {
        MessageLink messageLink = new MessageLink();
        messageLink.setUrl(root.getElementsByTagName(TAG_URL).item(0)
                .getTextContent());
        messageLink.setTitle(root.getElementsByTagName(TAG_TITLE).item(0)
                .getTextContent());
        messageLink.setDescription(root.getElementsByTagName(TAG_DESCRIPTION)
                .item(0).getTextContent());
    }

    @Override
    protected Message handleSpecificMessage() {
        return null;
    }

}
