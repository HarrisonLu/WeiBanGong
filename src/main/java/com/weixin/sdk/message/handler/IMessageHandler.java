package com.weixin.sdk.message.handler;

import org.w3c.dom.Element;

import com.weixin.sdk.message.Message;

public interface IMessageHandler {

    public void parseMessage(Message message, Element root);

    public Message handleMessage(Message message);

}
