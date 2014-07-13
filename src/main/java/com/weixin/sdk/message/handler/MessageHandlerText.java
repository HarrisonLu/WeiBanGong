package com.weixin.sdk.message.handler;

import com.weixin.sdk.ResourceManager;
import com.weixin.sdk.message.Message;
import com.weixin.sdk.message.MessageText;
import org.w3c.dom.Element;

public class MessageHandlerText extends MessageHandlerHelper {

    @Override
    protected void parseSpecificMessage(Message message, Element root) {
        MessageText messageText = (MessageText) message;
        messageText.setContent(root.getElementsByTagName(TAG_CONTENT).item(0)
                .getTextContent());
    }

    @Override
    protected Message handleSpecificMessage() {
        MessageText messageText = (MessageText) message;
        if (messageText.getContent().equals("1")) {
            return buildMessageResultText(ResourceManager.getValue("number1"));
        } else if (messageText.getContent().equals("2")) {
            return buildMessageResultText(ResourceManager.getValue("number2"));
        } else if (messageText.getContent().equals("3")) {
            return buildMessageResultText(ResourceManager.getValue("number3"));
        }
        return buildMessageResultText(ResourceManager.getValue("others"));
    }

}
