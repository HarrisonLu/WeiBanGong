package com.springapp.mvc.contacts.domain;

import com.springapp.mvc.common.BaseDomain;

import java.util.List;

public class Organization extends BaseDomain {

    private List departmentIdList;

    public List getDepartmentIdList() {
        return departmentIdList;
    }

    public void setDepartmentIdList(List departmentIdList) {
        this.departmentIdList = departmentIdList;
    }

}
