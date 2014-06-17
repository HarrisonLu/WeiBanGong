package com.springapp.mvc.dao.project;

import com.springapp.mvc.domain.project.Module;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by lion on 14-4-3.
 */
@Repository
public interface ModuleMapper {

    // 根据 模块id 找 模块详细资料
    public Module selectModuleDetailsByModuleId(int moduleId);

    // 根据 项目id 找 模块列表
    public List<Module> selectModuleListByProjectId(Map<String, Integer> map);

    // 根据 成员id 和 项目id 找 模块列表
    public List<Module> getModuleListByUserIdAndProjectId(Map<String, Integer> map);

    // 插入 模块
    public Integer insertModule(Module module);

    // 更新 模块详细资料
    public void updateModuleDetail(Module module);

    // 判断 是否为 模块创建人
    public Integer isModuleCreater(Map<String, Integer> map);

    // 删除 模块详细资料
    public Integer deleteModuleDetailByModuleId(int moduleId);
}
