package com.springapp.mvc.dao.contacts;

import com.springapp.mvc.domain.contacts.User;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface UserMapper {

    // 插入 成员
    public Integer insertUser(User user);

    // 修改 成员信息
    public Integer updateUserInfo(User user);

    // 修改 成员密码
    public void updateUserPassword(User user);

    // 修改 成员所有信息
    public Integer updateUserAllInfo(User user);

    // 删除 成员
    public Integer deleteUserById(int id);

    // 根据 成员id 找 成员基本信息（中英文名、所属部门和组）
    public User selectUserBaseInfoById(int userId);

    // 根据 成员id 找 成员详细信息
    public User selectUserDetailsById(int userId);

    // 根据 字符串 模糊搜索 成员基本信息列表
    public List<User> fuzzySelectUserBaseInfoListByString(Map<String, String> map);

    // 判断 成员和联系人 是否为 收藏联系人关系
    public Boolean isCollectedContacts(Map<String, Integer> map);

    // 根据 项目id 找 项目负责人基本资料 列表
    public List<User> selectProjectManagerListByProjectId(Map<String, Integer> map);

    // 根据 模块id 找 模块负责人基本资料 列表
    public List<User> selectModuleManagerListByModuleId(Map<String, Integer> map);

    // 根据 任务id 找 任务负责人基本资料 列表
    public List<User> selectTaskManagerListByTaskId(Map<String, Integer> map);

    // 根据 项目id 找 项目成员基本资料 列表
    public List<User> selectProjectMemberListByProjectId(Map<String, Integer> map);

    // 根据 模块id 找 模块关联成员基本资料 列表
    public List<User> selectModuleMemberListByModuleId(Map<String, Integer> map);

    // 根据 任务id 找 任务关联成员基本资料 列表
    public List<User> selectTaskMemberListByTaskId(Map<String, Integer> map);

    // 根据 账号和密码 判断 成员是否存在
    public Integer hasAccountWithUser(Map<String, String> map);

    // 根据 账号和密码 找 成员详细资料
    public User selectUserDetailByAccountNumAndPassword(Map<String, String> map);

    // 得到 所有成员email信息
    public List<User> getAllUserEmail();
}
