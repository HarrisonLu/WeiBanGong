package com.springapp.mvc.dao;

import com.springapp.mvc.domain.contacts.User;
import com.springapp.mvc.domain.customer.Comment;
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

    // 根据 客户id 和 项目id 找 非项目成员的成员基本资料列表
    public List<User> selectOtherSharedUserList(Map<String, Integer> map);

    // 根据 项目id 找 成员id列表
    public List<User> selectUserIdByProjectId(int projectId);

    // 根据 项目id 和 用户id 判断 用户是否为项目成员
    public boolean isProjectMember(Map<String, Integer> map);

    // 根据 任务id 找 项目id
    public int selectProjectIdByTaskId(int taskId);

    // 根据 字符串 和 项目id 模糊搜索 任务基本资料列表
    public List<Task> fuzzySelectTaskBaseInfoList(Map<String, String> map);

    // 根据 客户id 找 评论列表
    public List<Comment> selectCommentListByCustomerId(int customerId);
}
