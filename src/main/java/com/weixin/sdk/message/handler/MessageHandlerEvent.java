package com.weixin.sdk.message.handler;

import com.weixin.sdk.ResourceManager;
import com.weixin.sdk.message.ItemArticle;
import org.w3c.dom.Element;

import com.weixin.sdk.message.Message;
import com.weixin.sdk.message.MessageEvent;

import java.util.ArrayList;
import java.util.List;

public class MessageHandlerEvent extends MessageHandlerHelper {

    @Override
    protected void parseSpecificMessage(Message message, Element root) {
        MessageEvent messageEvent = (MessageEvent) message;
        messageEvent.setEvent(root.getElementsByTagName(TAG_EVENT).item(0)
                .getTextContent());
        messageEvent.setEventKey(root.getElementsByTagName(TAG_EVENTKEY)
                .item(0).getTextContent());
    }

    @Override
    protected Message handleSpecificMessage() {
        MessageEvent messageEvent = (MessageEvent) message;
        if (messageEvent.getEvent().equalsIgnoreCase(EVENT_SUBSCRIBE)) {
            return buildMessageResultText(ResourceManager.getValue("greeting"));
        } else if (messageEvent.getEvent().equalsIgnoreCase(EVENT_CLICK)) {
            return buildMessageResultNews(getArticleList());
        }
        return null;
    }

    public List<ItemArticle> getArticleList() {
        List<ItemArticle> items = new ArrayList<ItemArticle>();
        ItemArticle itemArticle1 = new ItemArticle();
        itemArticle1.setTitle("WeiBanGong");
        itemArticle1.setDescription("");
        itemArticle1.setPicUrl("http://p0.img.imtuan.com/wechatmsg/article/20130918/91991d9e7a1943e99d98ee588cd94c4f.jpg");
        itemArticle1.setUrl("http://microoffice.duapp.com/index");
        items.add(itemArticle1);
        return items;
    }


}
