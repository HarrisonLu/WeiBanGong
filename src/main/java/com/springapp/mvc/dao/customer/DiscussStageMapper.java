package com.springapp.mvc.dao.customer;

import com.springapp.mvc.domain.customer.DiscussStage;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Lion on 14-3-6.
 */
@Repository
public interface DiscussStageMapper {

    // 找 所有 所处阶段列表
    public List<DiscussStage> selectAllDiscussStage();
}
