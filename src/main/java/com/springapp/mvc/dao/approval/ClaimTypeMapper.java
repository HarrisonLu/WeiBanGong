package com.springapp.mvc.dao.approval;

import com.springapp.mvc.domain.approval.ClaimType;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lion on 14-6-27.
 */
@Repository
public interface ClaimTypeMapper {
    // 得到所有费用类型
    public List<ClaimType> getAllClaimType();

    // 根据 费用类型id 找 费用类型
    public ClaimType selectClaimTypeByClaimTypeId(int claimTypeId);
}

