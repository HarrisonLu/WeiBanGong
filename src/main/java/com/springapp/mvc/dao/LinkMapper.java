package com.springapp.mvc.dao;

import com.springapp.mvc.domain.contacts.User;
import com.springapp.mvc.domain.customer.CommentCustomer;
import com.springapp.mvc.domain.project.Task;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Lion on 14-2-15.
 */

@Repository
public interface LinkMapper {

    // 插入 成员id 和 收藏联系人id 关联
    public Integer insertUserIdCollectedContactsIdLink(Map<String, Integer> map);

    // 删除 成员id 和 收藏联系人id 关联
    public Integer deleteUserIdCollectedContactsIdLink(Map<String, Integer> map);

    // 根据 成员id 找 收藏联系人基本资料列表
    public List<User> selectCollectedContactsBaseInfoListByUserId(int userId);

    /// 插入 成员id 和 部门id 关联
    public Integer insertUserIdDepartmentIdLink(Map<String, Integer> map);

    /// 删除 成员id 和 部门id 关联
    public Integer deleteUserIdDepartmentIdLink(Map<String, Integer> map);

    /// 插入 成员id 和 组id 关联
    public Integer insertUserIdGroupIdLink(Map<String, Integer> map);

    /// 删除 成员id 和 组id 关联
    public Integer deleteUserIdGroupIdLink(Map<String, Integer> map);

    // 根据 成员id 找 所在组成员基本信息列表
    public List<User> searchGroupUserBaseInfoListByUserId(int userId);

    // 插入 成员-客户共享关系
    public Integer insertUserSharedCustomerLink(Map<String, Integer> map);

    // 删除 成员-客户共享关系
    public Integer deleteUserSharedCustomerLink(Map<String, Integer> map);

    // 插入 项目关联客户
    public Integer insertProjectCustomerLink(Map<String, Integer> map);

    // 删除 项目关联客户
    public Integer deleteProjectCustomerLink(Map<String, Integer> map);

    // 删除 指定项目与所有客户 关联
    public Integer deleteAllProjectCustomerLinkByProjectId(int projectId);

    // 插入 模块关联客户
    public Integer insertModuleCustomerLink(Map<String, Integer> map);

    // 删除 模块关联客户
    public Integer deleteModuleCustomerLink(Map<String, Integer> map);

    // 删除 指定模块与所有客户 关联
    public Integer deleteAllModuleCustomerLinkByModuleId(int moduleId);

    // 插入 任务关联客户
    public Integer insertTaskCustomerLink(Map<String, Integer> map);

    // 删除 任务关联客户
    public Integer deleteTaskCustomerLink(Map<String, Integer> map);

    // 删除 指定任务与所有客户 关联
    public Integer deleteAllTaskCustomerLinkByTaskId(int taskId);

// 成员与项目

    // 根据 项目id 找 成员id列表
    public List<User> selectUserIdByProjectId(int projectId);

    // 插入 项目与负责人 关联
    public Integer insertProjectManagerLink(Map<String, Integer> map);

    // 删除 项目与负责人 关联
    public Integer deleteProjectManagerLink(Map<String, Integer> map);

    // 插入 项目与成员 关联
    public Integer insertProjectMemberLink(Map<String, Integer> map);

    // 删除 项目与成员 关联
    public Integer deleteProjectMemberLink(Map<String, Integer> map);

    // 判断 是否为 项目负责人
    public Integer isProjectManager(Map<String, Integer> map);

    // 判断 是否为 项目成员
    public Integer isProjectMember(Map<String, Integer> map);

    // 删除 指定项目与所有成员 关联
    public Integer deleteAllProjectMemberLinkByProjectId(int projectId);

    // 删除 指定项目与所有负责人 关联
    public Integer deleteAllProjectManagerLinkByProjectId(int projectId);

// 成员与模块

    // 插入 模块与负责人 关联
    public Integer insertModuleManagerLink(Map<String, Integer> map);

    // 删除 模块与负责人 关联
    public Integer deleteModuleManagerLink(Map<String, Integer> map);

    // 插入 模块与成员 关联
    public Integer insertModuleMemberLink(Map<String, Integer> map);

    // 删除 模块与成员 关联
    public Integer deleteModuleMemberLink(Map<String, Integer> map);

    // 判断 是否为 模块负责人
    public Integer isModuleManager(Map<String, Integer> map);

    // 判断 是否为 模块成员
    public Integer isModuleMember(Map<String, Integer> map);

    // 删除 指定模块与所有成员 关联
    public Integer deleteAllModuleMemberLinkByModuleId(int moduleId);

    // 删除 指定模块与所有负责人 关联
    public Integer deleteAllModuleManagerLinkByModuleId(int moduleId);

// 成员与任务

    // 插入 任务与负责人 关联
    public Integer insertTaskManagerLink(Map<String, Integer> map);

    // 删除 任务与负责人 关联
    public Integer deleteTaskManagerLink(Map<String, Integer> map);

    // 插入 任务与成员 关联
    public Integer insertTaskMemberLink(Map<String, Integer> map);

    // 删除 任务与成员 关联
    public Integer deleteTaskMemberLink(Map<String, Integer> map);

    // 判断 是否为 任务负责人
    public Integer isTaskManager(Map<String, Integer> map);

    // 判断 是否为 任务成员
    public Integer isTaskMember(Map<String, Integer> map);

    // 删除 指定任务与所有成员 关联
    public Integer deleteAllTaskMemberLinkByTaskId(int taskId);

    // 删除 指定任务与所有负责人 关联
    public Integer deleteAllTaskManagerLinkByTaskId(int taskId);

    // 根据 模块id 找 项目id
    public int selectProjectIdByModuleId(int moduleId);

    // 根据 任务id 找 模块id
    public int selectModuleIdByTaskId(int taskId);

    // 根据 字符串 和 模块id 模糊搜索 任务基本资料列表
    public List<Task> fuzzySelectTaskBaseInfoList(Map<String, String> map);

}
