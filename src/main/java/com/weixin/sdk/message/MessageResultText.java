package com.weixin.sdk.message;

public class MessageResultText extends Message {

    protected String content;
    protected int funcFlag;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getFuncFlag() {
        return funcFlag;
    }

    public void setFuncFlag(int funcFlag) {
        this.funcFlag = funcFlag;
    }

}
