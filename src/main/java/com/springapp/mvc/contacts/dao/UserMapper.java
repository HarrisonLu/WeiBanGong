package com.springapp.mvc.contacts.dao;

import com.springapp.mvc.contacts.domain.Department;
import com.springapp.mvc.contacts.domain.User;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface UserMapper {

    // 插入User
    public void insertUser(User user);

    // 插入UserDepartmentLink
    public void insertUserDepartmentLink(HashMap<String, Integer> map);

    //插入user和frequentContacts关联
    void insertUserIdFrequentContactsId(int userId, int frequentContactsId);

    // 修改User
    public void updateUser(User user);

    // 删除User
    void deleteUser(int id);

    // 根据id搜索User
    public User selectUserById(int id);

    // 根据名字搜索User
    public User selectUserByName(String name);

    // 搜索所有User
    public List<User> selectAllUser();

}
