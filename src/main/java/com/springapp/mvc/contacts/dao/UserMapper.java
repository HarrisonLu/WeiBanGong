package com.springapp.mvc.contacts.dao;

import com.springapp.mvc.contacts.domain.Department;
import com.springapp.mvc.contacts.domain.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {

    //插入User
    public void insertUser(User user);

    //根据chineseName找user
    public User findUserByChineseName(String chineseName);

    //根据englishName找user
    public User findUserByEnglishName(String englishName);

    public List<User> selectUserById(int id);
    public List<User> selectAllUser();

    //修改User
    public void updateUser(User user);

    //删除User
    void deleteUser(int id);

}
