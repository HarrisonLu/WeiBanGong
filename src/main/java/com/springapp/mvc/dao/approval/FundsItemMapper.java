package com.springapp.mvc.dao.approval;

import com.springapp.mvc.domain.approval.FundsItem;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by lion on 14-6-27.
 */
@Repository
public interface FundsItemMapper {
    // 插入 经费预估
    public Integer insertFundsItem(FundsItem fundsItem);
    // 删除 经费预估
    public Integer deleteFundsItem(int fundsItemId);
    // 根据 审批id 删除 所有经费预估
    public Integer deleteAllFundsItemByApprovalId(int approvalId);
    // 根据 审批id 找 经费预估列表
    public List<FundsItem> selectFundsItemByApprovalId(Map<String, Integer> map);
}
