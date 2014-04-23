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
    public void insertUserIdCollectedContactsIdLink(Map<String, Integer> map);

    // 删除 成员id 和 收藏联系人id 关联
    public void deleteUserIdCollectedContactsIdLink(Map<String, Integer> map);

    // 根据 成员id 找 收藏联系人基本资料列表
    public List<User> selectCollectedContactsBaseInfoListByUserId(int userId);

    /// 插入 成员id 和 部门id 关联
    public void insertUserIdDepartmentIdLink(Map<String, Integer> map);

    /// 删除 成员id 和 部门id 关联
    public void deleteUserIdDepartmentIdLink(Map<String, Integer> map);

    /// 插入 成员id 和 组id 关联
    public void insertUserIdGroupIdLink(Map<String, Integer> map);

    /// 删除 成员id 和 组id 关联
    public void deleteUserIdGroupIdLink(Map<String, Integer> map);

    // 根据 成员id 找 所在组成员基本信息列表
    public List<User> searchGroupUserBaseInfoListByUserId(int userId);

    // 插入 成员-客户共享关系
    public void insertUserSharedCustomerLink(Map<String, Integer> map);

    // 删除 成员-客户共享关系
    public void deleteUserSharedCustomerLink(Map<String, Integer> map);

    // 插入 项目关联客户
    public void insertProjectCustomerLink(Map<String, Integer> map);

    // 删除 项目关联客户
    public void deleteProjectCustomerLink(Map<String, Integer> map);

    // 插入 模块关联客户
    public void insertModuleCustomerLink(Map<String, Integer> map);

    // 删除 模块关联客户
    public void deleteModuleCustomerLink(Map<String, Integer> map);

    // 删除 指定模块与所有客户 关联
    public void deleteAllModuleCustomerLinkByModuleId(int moduleId);

    // 插入 任务关联客户
    public void insertTaskCustomerLink(Map<String, Integer> map);

    // 删除 任务关联客户
    public void deleteTaskCustomerLink(Map<String, Integer> map);

    // 删除 指定任务与所有客户 关联
    public void deleteAllTaskCustomerLinkByTaskId(int taskId);

// 成员与项目

    // 根据 项目id 找 成员id列表
    public List<User> selectUserIdByProjectId(int projectId);

    // 插入 项目与负责人 关联
    public void insertProjectManagerLink(Map<String, Integer> map);

    // 删除 项目与负责人 关联
    public void deleteProjectManagerLink(Map<String, Integer> map);

    // 插入 项目与成员 关联
    public void insertProjectMemberLink(Map<String, Integer> map);

    // 删除 项目与成员 关联
    public void deleteProjectMemberLink(Map<String, Integer> map);

    // 判断 是否为 项目负责人
    public Integer isProjectManager(Map<String, Integer> map);

    // 判断 是否为 项目成员
    public Integer isProjectMember(Map<String, Integer> map);

// 成员与模块

    // 插入 模块与负责人 关联
    public void insertModuleManagerLink(Map<String, Integer> map);

    // 删除 模块与负责人 关联
    public void deleteModuleManagerLink(Map<String, Integer> map);

    // 插入 模块与成员 关联
    public void insertModuleMemberLink(Map<String, Integer> map);

    // 删除 模块与成员 关联
    public void deleteModuleMemberLink(Map<String, Integer> map);

    // 判断 是否为 模块负责人
    public Integer isModuleManager(Map<String, Integer> map);

    // 判断 是否为 模块成员
    public Integer isModuleMember(Map<String, Integer> map);

    // 删除 指定模块与所有成员 关联
    public void deleteAllModuleMemberLinkByModuleId(int moduleId);

    // 删除 指定模块与所有负责人 关联
    public void deleteAllModuleManagerLinkByModuleId(int moduleId);

// 成员与任务

    // 插入 任务与负责人 关联
    public void insertTaskManagerLink(Map<String, Integer> map);

    // 删除 任务与负责人 关联
    public void deleteTaskManagerLink(Map<String, Integer> map);

    // 插入 任务与成员 关联
    public void insertTaskMemberLink(Map<String, Integer> map);

    // 删除 任务与成员 关联
    public void deleteTaskMemberLink(Map<String, Integer> map);

    // 判断 是否为 任务负责人
    public Integer isTaskManager(Map<String, Integer> map);

    // 判断 是否为 任务成员
    public Integer isTaskMember(Map<String, Integer> map);

    // 删除 指定任务与所有成员 关联
    public void deleteAllTaskMemberLinkByTaskId(int taskId);

    // 删除 指定任务与所有负责人 关联
    public void deleteAllTaskManagerLinkByTaskId(int taskId);

    // 根据 模块id 找 项目id
    public int selectProjectIdByModuleId(int moduleId);

    // 根据 任务id 找 模块id
    public int selectModuleIdByTaskId(int taskId);

    // 根据 字符串 和 模块id 模糊搜索 任务基本资料列表
    public List<Task> fuzzySelectTaskBaseInfoList(Map<String, String> map);

}
