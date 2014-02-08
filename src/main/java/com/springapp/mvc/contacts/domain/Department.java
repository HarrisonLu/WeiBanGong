package com.springapp.mvc.contacts.domain;

import com.springapp.mvc.common.BaseDomain;

import java.util.List;

public class Department extends BaseDomain {

    private int id;
    private String name;
    private List employeeIdList;

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

    public List getEmployeeIdList() {
        return employeeIdList;
    }

    public void setEmployeeIdList(List employeeIdList) {
        this.employeeIdList = employeeIdList;
    }
}
