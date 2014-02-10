package com.springapp.mvc.contacts.domain;

import com.springapp.mvc.common.BaseDomain;

public class WechatGroup extends BaseDomain {

    private int id;
    private String englishName;
    private String chineseName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEnglishName() {
        return englishName;
    }

    public void setEnglishName(String englishName) {
        this.englishName = englishName;
    }

    public String getChineseName() {
        return chineseName;
    }

    public void setChineseName(String chineseName) {
        this.chineseName = chineseName;
    }
}
