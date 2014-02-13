package com.springapp.mvc.contacts.dao;

import com.springapp.mvc.contacts.domain.User;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface UserMapper {

    // 插入User
    public void insertUser(User user);

    // 插入User和Department关联
    public void insertUserDepartmentLink(HashMap<String, Integer> map);

    // 插入User和FrequentContacts关联
    public void insertUserFrequentContactsLink(HashMap<String, Integer> map);

    // 修改User
    public void updateUser(User user);

    // 删除User
    public void deleteUser(int id);

    // 删除User和Department关联
    public void deleteUserDepartmentLink(HashMap<String, Integer> map);

    // 删除user和frequentContacts关联
    public void deleteUserFrequentContactsLink(HashMap<String, Integer> map);

    // 根据用户id搜索user
    public User selectUserById(int id);

    // 根据englishName找user
    public User selectUserByEnglishName(String englishName);

    // 根据英文字符串模糊搜索User列表
    public List<User> fuzzySelectUserByEnglishString(String englishStr);

    // 根据 用户id 找 常用联系人id列表
    public List<Integer> selectFrequentContactsIdByUserId(int userId);

    // 搜索所有User
    public List<User> selectAllUser();

}
