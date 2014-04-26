package com.springapp.mvc.dao.project;

import com.springapp.mvc.domain.project.Project;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Lion on 14-3-6.
 */
@Repository
public interface ProjectMapper {

    // 根据 字符串 模糊搜索 项目基本资料列表
    public List<Project> fuzzySelectProjectBaseInfoList(String str);

    // 根据 项目id 找 项目详细资料
    public Project selectProjectDetailsByProjectId(int projectId);

    // 根据 成员id 和 字符串 模糊搜索 项目基本信息列表
    public List<Project> fuzzySelectProjectBaseInfoListByUserId(Map<String, String> map);

    // 根据 成员id 得到 项目基本信息列表
    public List<Project> selectProjectListByUserId(int userId);

    // 插入 项目
    public void insertProject(Project project);

    // 更新 项目详细资料
    public void updateProjectDetail(Project project);

    // 判断 是否为 项目创建人
    public Integer isProjectCreater(Map<String, Integer> map);

    // 删除 项目详细资料
    public void deleteProjectDetailByProjectId(int projectId);
}
