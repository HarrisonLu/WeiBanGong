package com.springapp.mvc.dao.approval;

import com.springapp.mvc.domain.approval.FundsType;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lion on 14-6-27.
 */
@Repository
public interface FundsTypeMapper {
    // 得到所有经费类型
    public List<FundsType> getAllFundsType();
    // 根据 经费类型id 找 经费类型
    public FundsType selectFundsTypeByFundsTypeId(int fundsTypeId);
}
