package com.springapp.mvc.domain.project;

import java.sql.Timestamp;

/**
 * Created by Lion on 14-3-6.
 */
public class Project {
    private Integer id;
    private String name;
    private Timestamp createTime;
    private Timestamp updateTime;
    private String displayUpdateTime;
    private Integer stageId;
    private String stageName;
    private String info;
    private Integer createrId;
    private String createrChineseName;
    private String createrEnglishName;

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

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp time) {
        this.createTime = time;
    }

    public Timestamp getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Timestamp updateTime) {
        this.updateTime = updateTime;
    }

    public String getDisplayUpdateTime() {
        return displayUpdateTime;
    }

    public void setDisplayUpdateTime(String displayUpdateTime) {
        this.displayUpdateTime = displayUpdateTime;
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

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
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
}
