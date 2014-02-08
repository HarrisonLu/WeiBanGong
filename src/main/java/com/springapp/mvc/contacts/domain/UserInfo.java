package com.springapp.mvc.contacts.domain;

import com.springapp.mvc.common.BaseDomain;

public class UserInfo extends BaseDomain {

    private int id;
    private String chineseName;
    private String englishName;
    private String positionTitle;
    private String weChatNum;
    private int qqNum;
    private int phoneNum;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setChineseName(String chineseName) {
        this.chineseName = chineseName;
    }

    public String getChineseName() {
        return chineseName;
    }

    public void setEnglishName(String englishName) {
        this.englishName = englishName;
    }

    public String getEnglishName() {
        return englishName;
    }

    public void setPositionTitle(String positionTitle) {
        this.positionTitle = positionTitle;
    }

    public String getPositionTitle() {
        return positionTitle;
    }

    public void setWeChatNum(String weChatNum) {
        this.weChatNum = weChatNum;
    }

    public String getWeChatNum() {
        return weChatNum;
    }

    public void setQqNum(int qqNum) {
        this.qqNum = qqNum;
    }

    public int getQqNum() {
        return qqNum;
    }

    public void setPhoneNum(int phoneNum) {
        this.phoneNum = phoneNum;
    }

    public int getPhoneNum() {
        return phoneNum;
    }
}
