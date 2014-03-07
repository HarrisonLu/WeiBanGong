package com.springapp.mvc.dao.customer;

import com.springapp.mvc.domain.customer.DiscussStage;

import java.util.List;

/**
 * Created by Lion on 14-3-6.
 */
public interface DiscussStageMapper {

    // 找 所有 所处阶段列表
    public List<DiscussStage> selectAllDiscussStage();
}
