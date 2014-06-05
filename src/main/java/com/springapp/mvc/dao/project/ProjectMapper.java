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
        // 根据 成员id（为项目创建人） 得到 项目基本信息列表
    public List<Project> selectProjectListWithProjectCreatorByUserId(int userId);
        // 根据 成员id（为项目负责人） 得到 项目基本信息列表
    public List<Project> selectProjectListWithProjectManagerByUserId(int userId);
        // 根据 成员id（为项目成员） 得到 项目基本信息列表
    public List<Project> selectProjectListWithProjectMemberByUserId(int userId);
        // 根据 成员id（为模块创建人） 得到 项目基本信息列表
    public List<Project> selectProjectListWithModuleCreatorByUserId(int userId);
        // 根据 成员id（为模块负责人） 得到 项目基本信息列表
    public List<Project> selectProjectListWithModuleManagerByUserId(int userId);
        // 根据 成员id（为模块成员） 得到 项目基本信息列表
    public List<Project> selectProjectListWithModuleMemberByUserId(int userId);
        // 根据 成员id（为任务创建人） 得到 项目基本信息列表
    public List<Project> selectProjectListWithTaskCreatorByUserId(int userId);
        // 根据 成员id（为任务负责人） 得到 项目基本信息列表
    public List<Project> selectProjectListWithTaskManagerByUserId(int userId);
        // 根据 成员id（为任务成员） 得到 项目基本信息列表
    public List<Project> selectProjectListWithTaskMemberByUserId(int userId);

    // 插入 项目
    public Integer insertProject(Project project);

    // 更新 项目详细资料
    public void updateProjectDetail(Project project);

    // 判断 是否为 项目创建人
    public Integer isProjectCreater(Map<String, Integer> map);

    // 删除 项目详细资料
    public Integer deleteProjectDetailByProjectId(int projectId);
}
