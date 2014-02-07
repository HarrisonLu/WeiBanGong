package com.springapp.mvc.contacts.domain;

import com.springapp.mvc.common.BaseDomain;

import java.util.List;

public class User extends BaseDomain {

    private UserInfo userInfo;
    private FrequentContacts frequentContacts;
    private List weChatGroupIdList;

    public List getWeChatGroupIdList() {
        return weChatGroupIdList;
    }

    public void setWeChatGroupIdList(List weChatGroupIdList) {
        this.weChatGroupIdList = weChatGroupIdList;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public FrequentContacts getFrequentContacts() {
        return frequentContacts;
    }

    public void setFrequentContacts(FrequentContacts frequentContacts) {
        this.frequentContacts = frequentContacts;
    }
}
