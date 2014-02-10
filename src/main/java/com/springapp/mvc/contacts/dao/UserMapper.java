package com.springapp.mvc.contacts.dao;

import com.springapp.mvc.contacts.domain.User;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface UserMapper {

    public void insertUser(User user);

    public void insertDepartmentLink(HashMap<String, Integer> map);

    public User selectUserById(int id);

    public List<User> selectUserByUsername(String userName);

    public List<User> selectAllUser();

    public void updateUser(User user);

    public void deleteUser(int id);

}
