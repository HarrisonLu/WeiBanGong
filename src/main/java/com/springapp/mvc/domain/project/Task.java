package com.springapp.mvc.domain.project;

import java.sql.Timestamp;

/**
 * Created by Lion on 14-3-6.
 */
public class Task {
    private Integer id;
    private String name;
    private Integer moduleId;
    private String moduleName;
    private Timestamp createTime;
    private String displayCreateTime;
    private Timestamp deadline;
    private String displayDeadline;
    private Integer createrId;
    private String createrChineseName;
    private String createrEnglishName;
    private Integer priorityId;
    private String priorityName;
    private Integer stageId;
    private String stageName;
    private Timestamp updateTime;
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

    public Integer getModuleId() {
        return moduleId;
    }

    public void setModuleId(Integer moduleId) {
        this.moduleId = moduleId;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp time) {
        this.createTime = time;
    }

    public String getDisplayCreateTime() {
        return displayCreateTime;
    }

    public void setDisplayCreateTime(String displayCreateTime) {
        this.displayCreateTime = displayCreateTime;
    }

    public Timestamp getDeadline() {
        return deadline;
    }

    public void setDeadline(Timestamp deadline) {
        this.deadline = deadline;
    }

    public String getDisplayDeadline() {
        return displayDeadline;
    }

    public void setDisplayDeadline(String displayDeadline) {
        this.displayDeadline = displayDeadline;
    }

    public Integer getCreaterId() {
        return createrId;
    }

    public void setCreaterId(Integer createrId) {
        this.createrId = createrId;
    }

    public String getCreaterChineseName() {
        return createrChineseName;
    }

    public void setCreaterChineseName(String createrChineseName) {
        this.createrChineseName = createrChineseName;
    }

    public String getCreaterEnglishName() {
        return createrEnglishName;
    }

    public void setCreaterEnglishName(String createrEnglishName) {
        this.createrEnglishName = createrEnglishName;
    }

    public Integer getPriorityId() {
        return priorityId;
    }

    public void setPriorityId(Integer priorityId) {
        this.priorityId = priorityId;
    }

    public String getPriorityName() {
        return priorityName;
    }

    public void setPriorityName(String priorityName) {
        this.priorityName = priorityName;
    }

    public Integer getStageId() {
        return stageId;
    }

    public void setStageId(Integer stageId) {
        this.stageId = stageId;
    }

    public String getStageName() {
        return stageName;
    }

    public void setStageName(String stageName) {
        this.stageName = stageName;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }
}
