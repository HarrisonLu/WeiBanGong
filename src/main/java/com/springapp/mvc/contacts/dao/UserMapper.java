package com.springapp.mvc.contacts.dao;

import com.springapp.mvc.contacts.domain.User;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface UserMapper {

    // 插入User
    public void insertUser(User user);

    // 插入User和Department关联
    public void insertUserDepartmentLink(Map<String, Integer> map);

    // 插入User和FrequentContacts关联
    public void insertUserFrequentContactsLink(Map<String, Integer> map);

    // 修改User
    public void updateUser(User user);

    // 删除User
    public void deleteUser(int id);

    // 删除User和Department关联
    public void deleteUserDepartmentLink(Map<String, Integer> map);

    // 删除user和frequentContacts关联
    public void deleteUserFrequentContactsLink(Map<String, Integer> map);

    // 根据用户id搜索user
    public User selectUserById(int id);

    // 搜索User，根据搜索条件装配User参数
    public List<User> selectUserByName(User user);

    // 根据 用户id 找 常用联系人id列表
    public List<Integer> selectFrequentContactsIdByUserId(int userId);

    // 搜索所有User
    public List<User> selectAllUser();

}
