package com.springapp.mvc.dao.project;

import com.springapp.mvc.domain.project.Module;
import org.springframework.stereotype.Repository;

/**
 * Created by lion on 14-4-3.
 */
@Repository
public interface ModuleMapper {

    // 根据 模块id 找 模块详细资料
    public Module selectModuleDetailsByModuleId(int moduleId);
}
