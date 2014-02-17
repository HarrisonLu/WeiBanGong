package com.weixin.sdk.message;

public class MessageResultMusic extends Message {

    protected ItemMusic music;
    protected int funcFlag;

    public ItemMusic getMusic() {
        return music;
    }

    public void setMusic(ItemMusic music) {
        this.music = music;
    }

    public int getFuncFlag() {
        return funcFlag;
    }

    public void setFuncFlag(int funcFlag) {
        this.funcFlag = funcFlag;
    }

}
