package com.springapp.mvc.dao.project;

import com.springapp.mvc.domain.project.Project;

import java.util.List;
import java.util.Map;

/**
 * Created by Lion on 14-3-6.
 */
public interface ProjectMapper {

    // 根据 字符串 模糊搜索 项目基本资料列表
    public List<Project> fuzzySelectProjectBaseInfoList(String str);

    // 根据 项目id 找 项目详细资料
    public Project selectProjectDetailsByProjectId(int projectId);
}
