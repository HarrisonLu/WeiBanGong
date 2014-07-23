package com.springapp.mvc.dao.approval;

import com.springapp.mvc.domain.approval.Approval;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by lion on 14-6-27.
 */
@Repository
public interface ApprovalMapper {
    // 根据 用户id 找 我的审批列表
    public List<Approval> getMyApprovalList(Map<String, Integer> map);

    // 根据 用户id 找 我的待审审批列表
    public List<Approval> getMyWaitingApprovalList(Map<String, Integer> map);

    // 根据 用户id 找 草稿审批列表
    public List<Approval> selectDraftApprovalListByUserId(Map<String, Integer> map);

    // 根据 用户id 找 归档审批列表
    public List<Approval> selectArchiveApprovalListByUserId(Map<String, Integer> map);

    // 插入 审批
    public Integer insertApproval(Approval approval);

    // 删除 审批
    public Integer deleteApproval(int approvalId);

    // 更新 审批
    public void updateApproval(Approval approval);

    // 更新 审批stage
    public void updateApprovalStage(Map<String, Integer> map);

    // 根据 审批id 找 审批详细资料
    public Approval getApprovalDetailByApprovalId(Map<String, Integer> map);

    // 插入 抄送审批
    public Integer insertCarbonCopyApproval(Map<String, Integer> map);

    // 删除 抄送审批
    public Integer deleteCarbonCopyApproval(int carbonCopyApprovalId);

    // 根据 用户id 得到 抄送审批列表
    public List<Approval> selectCarbonCopyApprovalListByUserId(Map<String, Integer> map);
}
