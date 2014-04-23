package com.springapp.mvc.dao.project;

import com.springapp.mvc.domain.project.Priority;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lion on 14-4-20.
 */
@Repository
public interface PriorityMapper {

    // 得到 所有优先级列表
    public List<Priority> getAllPriorityList();
}
