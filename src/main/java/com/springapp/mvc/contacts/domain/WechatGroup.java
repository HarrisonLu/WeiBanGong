package com.springapp.mvc.contacts.domain;

import com.springapp.mvc.common.BaseDomain;

public class WechatGroup extends BaseDomain {

    private int id;
    private String EnglishName;
    private String ChineseName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEnglishName() {
        return EnglishName;
    }

    public void setEnglishName(String englishName) {
        EnglishName = englishName;
    }

    public String getChineseName() {
        return ChineseName;
    }

    public void setChineseName(String chineseName) {
        ChineseName = chineseName;
    }
}
