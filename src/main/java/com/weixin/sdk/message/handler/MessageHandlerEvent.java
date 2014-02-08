package com.weixin.sdk.message.handler;

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
            return buildMessageResultText("Hello");
        } else if (messageEvent.getEvent().equalsIgnoreCase(EVENT_CLICK)) {
            return buildMessageResultNews(getArticleList(0));
        }
        return null;
    }

    public List<ItemArticle> getArticleList(int count) {
        List<ItemArticle> items = new ArrayList<ItemArticle>();
        ItemArticle itemArticle1 = new ItemArticle();
        itemArticle1.setTitle("Amazing");
        itemArticle1.setDescription("If you are looking for the guilty, you need only look into a mirror!");
        itemArticle1.setPicUrl("http://tech.co/wp-content/uploads/2011/09/fiskersurf.jpg");
        itemArticle1.setUrl("http://www.baidu.com");
        items.add(itemArticle1);

        for (int i = 0; i < count; ++i) {
            ItemArticle itemArticle = new ItemArticle();
            itemArticle.setTitle("我叫U盘");
            itemArticle.setDescription("Description HERE");
            itemArticle
                    .setPicUrl("http://ichauffeur.info/a/i/lexus-hybrid-eco-wedding-cars-sm.jpg");
            itemArticle.setUrl("http://www.baidu.com");
            items.add(itemArticle);
        }

        return items;
    }


}
