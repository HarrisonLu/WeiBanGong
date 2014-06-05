package com.springapp.mvc.domain.project;

import java.sql.Timestamp;

/**
 * Created by lion on 14-4-2.
 */
public class Module {
    private Integer id;
    private String name;
    private Integer projectId;
    private String projectName;
    private Timestamp createTime;
    private Timestamp updateTime;
    private Integer createrId;
    private String createrChineseName;
    private String createrEnglishName;
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

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
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

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
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

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }
}
