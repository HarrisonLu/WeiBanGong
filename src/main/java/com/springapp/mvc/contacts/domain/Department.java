package com.springapp.mvc.contacts.domain;

import com.springapp.mvc.common.BaseDomain;

import java.sql.Timestamp;
import java.util.List;

public class Department extends BaseDomain {

    private int id;
    private String name;
    private Timestamp createdTime;
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

    public Timestamp getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Timestamp createdTime) {
        this.createdTime = createdTime;
    }

    public List getEmployeeIdList() {
        return employeeIdList;
    }

    public void setEmployeeIdList(List employeeIdList) {
        this.employeeIdList = employeeIdList;
    }
}
