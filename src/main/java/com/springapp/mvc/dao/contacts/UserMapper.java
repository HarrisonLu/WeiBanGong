package com.springapp.mvc.dao.contacts;

import com.springapp.mvc.domain.contacts.User;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface UserMapper {

    /// 插入 成员
    public void insertUser(User user);

    // 修改 成员信息
    public void updateUserInfo(User user);

    /// 删除 成员
    public void deleteUserById(int id);

    // 根据 成员id 找 成员基本信息（中英文名、所属部门和组）
    public User selectUserBaseInfoById(int userId);

    // 根据 成员id 找 成员详细信息
    public User selectUserDetailsById(int userId);

    // 根据 英文字符串 模糊搜索 成员基本信息列表
    public List<User> fuzzySelectUserBaseInfoListByString(String englishStr);

    // 找出 所有 User
    public List<User> selectAllUser();

    // 判断 成员和联系人 是否为 收藏联系人关系
    public Boolean isCollectedContacts(Map<String, Integer> map);
}
