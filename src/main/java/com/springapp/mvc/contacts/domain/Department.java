package com.springapp.mvc.contacts.domain;

import com.springapp.mvc.common.BaseDomain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Department extends BaseDomain {

    private Integer id;
    private String name;
    private Date createdTime;
    private List<User> users = new ArrayList<User>();

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

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }
}
