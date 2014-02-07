package com.weixin.sdk.message.handler;

import org.w3c.dom.Element;

import com.weixin.sdk.message.Message;
import com.weixin.sdk.message.MessageLocation;

public class MessageHandlerLocation extends MessageHandlerHelper {

    @Override
    protected void parseSpecificMessage(Message message, Element root) {
        MessageLocation messageLocation = (MessageLocation) message;
        messageLocation.setLocationX(root.getElementsByTagName(TAG_LOCATIONX)
                .item(0).getTextContent());
        messageLocation.setLocationY(root.getElementsByTagName(TAG_LOCATIONY)
                .item(0).getTextContent());
        messageLocation.setLabel(root.getElementsByTagName(TAG_LABEL).item(0)
                .getTextContent());
        messageLocation.setScale(root.getElementsByTagName(TAG_SCALE).item(0)
                .getTextContent());
    }

    @Override
    protected Message handleSpecificMessage() {
        return null;
    }

}
