package com.springapp.mvc.contacts.dao;

import com.springapp.mvc.contacts.domain.Department;
import com.springapp.mvc.contacts.domain.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {

    //插入User
    public void insertUser(User user);

    public User selectUserById(int id);
    public User selectUserByName(String name);
    public List<User> selectAllUser();

    //修改User
    public void updateUser(User user);

    //删除User
    void deleteUser(int id);

}
