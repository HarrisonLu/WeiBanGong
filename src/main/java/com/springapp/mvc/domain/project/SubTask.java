package com.springapp.mvc.domain.project;

/**
 * Created by lion on 14-4-17.
 */
public class SubTask {
    private Integer id;
    private String name;
    private Integer taskId;
    private String taskName;
    private boolean isUnderway;

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

    public Integer getTaskId() {
        return taskId;
    }

    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public boolean isUnderway() {
        return isUnderway;
    }

    public void setUnderway(boolean isUnderway) {
        this.isUnderway = isUnderway;
    }
}
