package com.springapp.mvc.contacts.domain;

import com.springapp.mvc.common.BaseDomain;

public class Group extends BaseDomain {

    // id
    private int id;

    // 组名
    private String name;

    // 所属部门id
    private int departmentId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

}
