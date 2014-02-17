package com.weixin.sdk.message.result.handler;

import com.weixin.sdk.message.ItemMusic;
import com.weixin.sdk.message.Message;
import com.weixin.sdk.message.MessageResultMusic;

public class MessageResultHandlerMusic extends MessageResultHandlerHelper {

    @Override
    public String getMessageResult(Message message) {
        MessageResultMusic messageResultMusic = (MessageResultMusic) message;
        StringBuffer buffer = new StringBuffer();
        StringBuffer item = new StringBuffer();

        ItemMusic itemMusic = messageResultMusic.getMusic();
        item.append(wrapperContent(TAG_TITLE, itemMusic.getTitle(), true))
                .append(wrapperContent(TAG_DESCRIPTION,
                        itemMusic.getDescription(), true))
                .append(wrapperContent(TAG_MUSICURL, itemMusic.getMusicUrl(),
                        true))
                .append(wrapperContent(TAG_HQMUSICURL,
                        itemMusic.getHqMusicUrl(), true));
        String music = wrapperContent(TAG_MUSIC, item.toString(), false);
        buffer.append(
                wrapperContent(TAG_TOUSERNAME,
                        messageResultMusic.getToUserName(), true))
                .append(wrapperContent(TAG_FROMUSERNAME,
                        messageResultMusic.getFromUserName(), true))
                .append(wrapperContent(TAG_CREATETIME,
                        messageResultMusic.getCreateTime() + "", false))
                .append(wrapperContent(TAG_MSGTYPE,
                        messageResultMusic.getMsgType(), true))
                .append(music)
                .append(wrapperContent(TAG_FUNCFLAG,
                        messageResultMusic.getFuncFlag() + "", false));
        return wrapperXmlContent(buffer.toString());
    }
}
