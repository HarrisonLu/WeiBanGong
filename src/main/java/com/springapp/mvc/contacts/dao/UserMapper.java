package com.springapp.mvc.contacts.dao;

import com.springapp.mvc.contacts.domain.Department;
import com.springapp.mvc.contacts.domain.User;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public interface UserMapper {

    // 插入 成员
    public void insertUser(User user);

    // 修改 成员
    public void updateUser(User user);

    // 删除 成员
    public void deleteUserbyId(int id);

    // 根据 成员id 找 成员基本信息（中英文名、所属部门和组）
    public User selectUserBaseInfoById(int userId);

    // 根据 成员id 找 成员详细信息
    public User selectUserDetailsById(int userId);

    // 根据 中文名称 找 用户
    // 根据 英文名称 找 用户

    // 根据 英文字符串 模糊搜索 成员基本信息列表
    public List<User> fuzzySelectUserBaseInfoListByEnglishString(String englishStr);

    // 找出 所有 User
    public List<User> selectAllUser();

}
