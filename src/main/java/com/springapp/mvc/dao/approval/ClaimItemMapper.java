package com.springapp.mvc.dao.approval;

import com.springapp.mvc.domain.approval.ClaimItem;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by lion on 14-6-27.
 */
@Repository
public interface ClaimItemMapper {
    // 插入 费用明细
    public Integer insertClaimItem(ClaimItem claimItem);

    // 删除 费用明细
    public Integer deleteClaimItem(int claimItemId);

    // 根据 审批id 删除 所有费用明细
    public Integer deleteAllClaimItemByApprovalId(int approvalId);

    // 根据 审批id 找 费用明细列表
    public List<ClaimItem> selectClaimItemByApprovalId(Map<String, Integer> map);
}
