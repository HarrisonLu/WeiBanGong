package com.weixin.sdk.message.handler;

import java.util.Date;
import java.util.List;

import org.w3c.dom.Element;

import com.weixin.sdk.message.IMessage;
import com.weixin.sdk.message.ItemArticle;
import com.weixin.sdk.message.ItemMusic;
import com.weixin.sdk.message.Message;
import com.weixin.sdk.message.MessageResultMusic;
import com.weixin.sdk.message.MessageResultNews;
import com.weixin.sdk.message.MessageResultText;

public abstract class MessageHandlerHelper implements IMessageHandler, IMessage {

    protected Message message;

    protected abstract void parseSpecificMessage(Message message, Element root);

    protected abstract Message handleSpecificMessage();

    @Override
    public void parseMessage(Message message, Element root) {
        message.setMsgType(root.getElementsByTagName(TAG_MSGTYPE).item(0)
                .getTextContent());
        message.setFromUserName(root.getElementsByTagName(TAG_FROMUSERNAME)
                .item(0).getTextContent());
        message.setToUserName(root.getElementsByTagName(TAG_TOUSERNAME).item(0)
                .getTextContent());
        parseSpecificMessage(message, root);
    }

    @Override
    public Message handleMessage(Message message) {
        this.message = message;
        return handleSpecificMessage();
    }

    protected Message buildMessageResultText(String content) {
        MessageResultText messageResultText = new MessageResultText();
        messageResultText.setMsgType(MESSAGE_RESULT_TEXT);
        messageResultText.setFromUserName(message.getToUserName());
        messageResultText.setToUserName(message.getFromUserName());
        messageResultText.setContent(content);
        messageResultText.setFuncFlag(1);
        messageResultText.setCreateTime(getCurrentUnixTimestamp());
        return messageResultText;
    }

    protected Message buildMessageResultMusic(ItemMusic item) {
        MessageResultMusic messageResultMusic = new MessageResultMusic();
        messageResultMusic.setMsgType(MESSAGE_RESULT_MUSIC);
        messageResultMusic.setFromUserName(message.getToUserName());
        messageResultMusic.setToUserName(message.getFromUserName());
        messageResultMusic.setMusic(item);
        messageResultMusic.setFuncFlag(1);
        messageResultMusic.setCreateTime(getCurrentUnixTimestamp());
        return messageResultMusic;
    }

    protected Message buildMessageResultNews(List<ItemArticle> items) {
        MessageResultNews messageResultNews = new MessageResultNews();
        messageResultNews.setMsgType(MESSAGE_RESULT_NEWS);
        messageResultNews.setFromUserName(message.getToUserName());
        messageResultNews.setToUserName(message.getFromUserName());
        messageResultNews.setCount(items.size());
        messageResultNews.setArticleItems(items);
        messageResultNews.setFuncFlag(1);
        messageResultNews.setCreateTime(getCurrentUnixTimestamp());
        return messageResultNews;
    }

    // get current Unix time
    public int getCurrentUnixTimestamp() {
        return (int) (new Date().getTime() / 1000);
    }

}
