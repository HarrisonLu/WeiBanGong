package com.springapp.mvc.contacts.service;

import com.springapp.mvc.contacts.dao.UserMapper;
import com.springapp.mvc.contacts.domain.Department;
import com.springapp.mvc.contacts.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Lion on 14-2-8.
 */

@Service
@Transactional
public class ContactsOperateService {

    @Autowired
    private UserMapper userMapper;

    //录入成员
    public void addUser(User user) {
        userMapper.insertUser(user);
    }

    //删除成员
    public void deleteUser(User user) {
        userMapper.deleteUser(user);
    }

    //更新成员
    public void updateUserInfo(User user) {
        userMapper.updateUser(user);
    }

    //增加部门
    public void addDepartment(Department department) {
        userMapper.insertDepartment(department);
    }

    //删除部门
    public void deleteDepartment(Department department) {
        userMapper.deleteDepartment(department);
    }

    //更新部门
    public void updateDepartment(Department department) {
        userMapper.updateDepartment(department);
    }

}
