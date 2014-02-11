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

    // 根据id搜索User
    public User selectUserById(int id);

    // 根据名字搜索User
    public User selectUserByEnglishName(String name);

    // 根据userId找frequentContacts
    public List<User> selectFrequentContactsByUser(int id);

    // 搜索所有User
    public List<User> selectAllUser();

}
