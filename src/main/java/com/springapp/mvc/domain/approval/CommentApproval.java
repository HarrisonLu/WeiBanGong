package com.springapp.mvc.domain.approval;

import java.sql.Timestamp;

/**
 * Created by lion on 14-6-27.
 */
public class CommentApproval {
    private Integer id;
    private String details;
    private Timestamp createTime;
    private String displayCreateTime;
    private Integer userId;
    private String userChineseName;
    private String userEnglishName;
    private Integer approvalId;
    private Integer isPass;
    private String displayIsPass;
    private Integer companyId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public String getDisplayCreateTime() {
        return displayCreateTime;
    }

    public void setDisplayCreateTime(String displayCreateTime) {
        this.displayCreateTime = displayCreateTime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserChineseName() {
        return userChineseName;
    }

    public void setUserChineseName(String userChineseName) {
        this.userChineseName = userChineseName;
    }

    public String getUserEnglishName() {
        return userEnglishName;
    }

    public void setUserEnglishName(String userEnglishName) {
        this.userEnglishName = userEnglishName;
    }

    public Integer getApprovalId() {
        return approvalId;
    }

    public void setApprovalId(Integer approvalId) {
        this.approvalId = approvalId;
    }

    public Integer getIsPass() {
        return isPass;
    }

    public void setIsPass(Integer isPass) {
        this.isPass = isPass;
    }

    public String getDisplayIsPass() {
        return displayIsPass;
    }

    public void setDisplayIsPass(String displayIsPass) {
        this.displayIsPass = displayIsPass;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }
}
