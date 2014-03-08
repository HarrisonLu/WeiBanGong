package com.springapp.mvc.domain.project;

import java.sql.Timestamp;

/**
 * Created by Lion on 14-3-6.
 */
public class Task {
    private int id;
    private String name;
    private String projectName;
    private Timestamp createTime;

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

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp time) {
        this.createTime = time;
    }
}
