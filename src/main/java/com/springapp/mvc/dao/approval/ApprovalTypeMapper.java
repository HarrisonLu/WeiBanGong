package com.springapp.mvc.dao.approval;

import com.springapp.mvc.domain.approval.ApprovalType;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lion on 14-6-27.
 */
@Repository
public interface ApprovalTypeMapper {
    // 得到 所有审批类型列表
    public List<ApprovalType> getAllApprovalType();
}
