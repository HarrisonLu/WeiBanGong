package com.springapp.mvc.domain.contacts;

import com.springapp.mvc.domain.BaseDomain;

import java.util.List;

public class Group extends BaseDomain {

    // id
    private Integer id;

    // 组名
    private String name;

    // 归属部门id
    private Integer departmentId;

    // 归属部门名
    private String departmentName;

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

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
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

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }
}
