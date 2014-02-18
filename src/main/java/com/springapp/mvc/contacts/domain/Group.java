package com.springapp.mvc.contacts.domain;

import com.springapp.mvc.common.BaseDomain;

import java.util.List;

public class Group extends BaseDomain {

    // id
    private int id;

    // 组名
    private String name;

    // 归属部门名
    private String departmentName;

    // 成员列表
    private List<User> userList;

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

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }
}
