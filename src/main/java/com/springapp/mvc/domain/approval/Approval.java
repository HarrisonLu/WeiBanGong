package com.springapp.mvc.domain.approval;

import java.sql.Timestamp;

/**
 * Created by lion on 14-6-27.
 */
public class Approval {
    // id
    private Integer id;
    // 提交时间
    private Timestamp submitTime;
    // 提交时间显示字符串
    private String displaySubmitTime;
    // 申请人id
    private Integer applicantId;
    // 申请人名称
    private String applicantName;
    // 所属部门id
    private Integer departmentId;
    // 所属部门名称
    private String departmentName;
    // 事由
    private String reasons;
    // 一级审批人id
    private Integer firstApprovalUserId;
    // 一级审批人名称
    private String firstApprovalUserName;
    // 二级审批人id
    private Integer secondApprovalUserId;
    // 二级审批人名称
    private String secondApprovalUserName;
    // 抄送人id
    private Integer beCarbonCopyUserId;
    // 抄送人名称
    private String beCarbonCopyUserName;
    // 当前审批人id
    private Integer currentApprovalUserId;
    // 当前审批人名称
    private String currentApprovalUserName;
    // 审批阶段id
    private Integer approvalStageId;
    // 审批阶段名称
    private String approvalStageName;
    // 审批状态id
    private Integer approvalStatusId;
    // 审批状态名称
    private String approvalStatusName;
    // 审批类型id
    private Integer approvalTypeId;
    // 审批类型名称
    private String approvalTypeName;
    // 休假类型id
    private Integer leaveTypeId;
    // 休假类型名称
    private String leaveTypeName;
    // 费用类型id
    private Integer claimTypeId;
    // 费用类型名称
    private String claimTypeName;
    // 物品类型id
    private Integer goodsTypeId;
    // 物品类型名称
    private String goodsTypeName;
    // 经费类型id
    private Integer fundsTypeId;
    // 经费类型名称
    private String fundsTypeName;
    // 开始时间
    private Timestamp startTime;
    // 开始时间字符串
    private String displayStartTime;
    // 结束时间
    private Timestamp endTime;
    // 结束时间字符串
    private String displayEndTime;
    // 出发地
    private String travelFrom;
    // 目的地
    private String travelTo;
    // 金额
    private Double amount;
    // 公司id
    private Integer companyId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Timestamp getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(Timestamp submitTime) {
        this.submitTime = submitTime;
    }

    public String getDisplaySubmitTime() {
        return displaySubmitTime;
    }

    public void setDisplaySubmitTime(String displaySubmitTime) {
        this.displaySubmitTime = displaySubmitTime;
    }

    public Integer getApplicantId() {
        return applicantId;
    }

    public void setApplicantId(Integer applicantId) {
        this.applicantId = applicantId;
    }

    public String getApplicantName() {
        return applicantName;
    }

    public void setApplicantName(String applicantName) {
        this.applicantName = applicantName;
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

    public String getReasons() {
        return reasons;
    }

    public void setReasons(String reasons) {
        this.reasons = reasons;
    }

    public Integer getFirstApprovalUserId() {
        return firstApprovalUserId;
    }

    public void setFirstApprovalUserId(Integer firstApprovalUserId) {
        this.firstApprovalUserId = firstApprovalUserId;
    }

    public String getFirstApprovalUserName() {
        return firstApprovalUserName;
    }

    public void setFirstApprovalUserName(String firstApprovalUserName) {
        this.firstApprovalUserName = firstApprovalUserName;
    }

    public Integer getSecondApprovalUserId() {
        return secondApprovalUserId;
    }

    public void setSecondApprovalUserId(Integer secondApprovalUserId) {
        this.secondApprovalUserId = secondApprovalUserId;
    }

    public String getSecondApprovalUserName() {
        return secondApprovalUserName;
    }

    public void setSecondApprovalUserName(String secondApprovalUserName) {
        this.secondApprovalUserName = secondApprovalUserName;
    }

    public Integer getBeCarbonCopyUserId() {
        return beCarbonCopyUserId;
    }

    public void setBeCarbonCopyUserId(Integer beCarbonCopyUserId) {
        this.beCarbonCopyUserId = beCarbonCopyUserId;
    }

    public String getBeCarbonCopyUserName() {
        return beCarbonCopyUserName;
    }

    public void setBeCarbonCopyUserName(String beCarbonCopyUserName) {
        this.beCarbonCopyUserName = beCarbonCopyUserName;
    }

    public Integer getCurrentApprovalUserId() {
        return currentApprovalUserId;
    }

    public void setCurrentApprovalUserId(Integer currentApprovalUserId) {
        this.currentApprovalUserId = currentApprovalUserId;
    }

    public String getCurrentApprovalUserName() {
        return currentApprovalUserName;
    }

    public void setCurrentApprovalUserName(String currentApprovalUserName) {
        this.currentApprovalUserName = currentApprovalUserName;
    }

    public Integer getApprovalStageId() {
        return approvalStageId;
    }

    public void setApprovalStageId(Integer approvalStageId) {
        this.approvalStageId = approvalStageId;
    }

    public String getApprovalStageName() {
        return approvalStageName;
    }

    public void setApprovalStageName(String approvalStageName) {
        this.approvalStageName = approvalStageName;
    }

    public Integer getApprovalStatusId() {
        return approvalStatusId;
    }

    public void setApprovalStatusId(Integer approvalStatusId) {
        this.approvalStatusId = approvalStatusId;
    }

    public String getApprovalStatusName() {
        return approvalStatusName;
    }

    public void setApprovalStatusName(String approvalStatusName) {
        this.approvalStatusName = approvalStatusName;
    }

    public Integer getApprovalTypeId() {
        return approvalTypeId;
    }

    public void setApprovalTypeId(Integer approvalTypeId) {
        this.approvalTypeId = approvalTypeId;
    }

    public String getApprovalTypeName() {
        return approvalTypeName;
    }

    public void setApprovalTypeName(String approvalTypeName) {
        this.approvalTypeName = approvalTypeName;
    }

    public Integer getLeaveTypeId() {
        return leaveTypeId;
    }

    public void setLeaveTypeId(Integer leaveTypeId) {
        this.leaveTypeId = leaveTypeId;
    }

    public String getLeaveTypeName() {
        return leaveTypeName;
    }

    public void setLeaveTypeName(String leaveTypeName) {
        this.leaveTypeName = leaveTypeName;
    }

    public Integer getClaimTypeId() {
        return claimTypeId;
    }

    public void setClaimTypeId(Integer claimTypeId) {
        this.claimTypeId = claimTypeId;
    }

    public String getClaimTypeName() {
        return claimTypeName;
    }

    public void setClaimTypeName(String claimTypeName) {
        this.claimTypeName = claimTypeName;
    }

    public Integer getGoodsTypeId() {
        return goodsTypeId;
    }

    public void setGoodsTypeId(Integer goodsTypeId) {
        this.goodsTypeId = goodsTypeId;
    }

    public String getGoodsTypeName() {
        return goodsTypeName;
    }

    public void setGoodsTypeName(String goodsTypeName) {
        this.goodsTypeName = goodsTypeName;
    }

    public Integer getFundsTypeId() {
        return fundsTypeId;
    }

    public void setFundsTypeId(Integer fundsTypeId) {
        this.fundsTypeId = fundsTypeId;
    }

    public String getFundsTypeName() {
        return fundsTypeName;
    }

    public void setFundsTypeName(String fundsTypeName) {
        this.fundsTypeName = fundsTypeName;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public String getDisplayStartTime() {
        return displayStartTime;
    }

    public void setDisplayStartTime(String displayStartTime) {
        this.displayStartTime = displayStartTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public String getDisplayEndTime() {
        return displayEndTime;
    }

    public void setDisplayEndTime(String displayEndTime) {
        this.displayEndTime = displayEndTime;
    }

    public String getTravelFrom() {
        return travelFrom;
    }

    public void setTravelFrom(String travelFrom) {
        this.travelFrom = travelFrom;
    }

    public String getTravelTo() {
        return travelTo;
    }

    public void setTravelTo(String travelTo) {
        this.travelTo = travelTo;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }
}

