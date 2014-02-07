package com.springapp.mvc.contacts.domain;

import com.springapp.mvc.common.BaseDomain;

import java.util.List;

public class FrequentContacts extends BaseDomain {

    private List departmentContactsIdList;
    private List collectContactsList;

    public List getCollectContactsList() {
        return collectContactsList;
    }

    public void setCollectContactsList(List collectContactsList) {
        this.collectContactsList = collectContactsList;
    }

    public List getDepartmentContactsIdList() {
        return departmentContactsIdList;
    }

    public void setDepartmentContactsIdList(List departmentContactsIdList) {
        this.departmentContactsIdList = departmentContactsIdList;
    }

}
