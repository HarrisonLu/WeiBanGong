package com.springapp.mvc.domain.contacts;

import com.springapp.mvc.domain.BaseDomain;

import java.util.List;

public class Department extends BaseDomain {

    // id
    private Integer id;

    // 部门名
    private String name;

    // 组列表
    private List<Group> groupList;

    // 成员列表
    private List<User> userList;

    // 公司id
    private Integer companyId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Group> getGroupList() {
        return groupList;
    }

    public void setGroupList(List<Group> groupList) {
        this.groupList = groupList;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }
}
