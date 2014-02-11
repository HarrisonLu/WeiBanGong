package com.springapp.mvc.contacts.service;

import com.springapp.mvc.contacts.dao.DepartmentMapper;
import com.springapp.mvc.contacts.dao.UserMapper;
import com.springapp.mvc.contacts.domain.Department;
import com.springapp.mvc.contacts.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Lion on 14-2-8.
 */

@Service
@Transactional
public class ContactsOperateService {

    @Autowired
    private UserMapper userMapper;

    //录入成员
    public void insertUser(User user) {
        userMapper.insertUser(user);
    }

    public User selectUserById(int id) {
        return userMapper.selectUserById(id);
    }

    public User selectUserByName(String name) {
        return userMapper.selectUserByName(name);
    }

    public List<User> selectAllUser() {
        return userMapper.selectAllUser();
    }

    //更新成员
    public void updateUserInfo(User user) {
        userMapper.updateUser(user);
    }

    //删除成员
    public void deleteUser(int id) {
        userMapper.deleteUser(id);
    }

    @Autowired
    private DepartmentMapper departmentMapper;

    //增加部门
    public void addDepartment(Department department) {
        departmentMapper.insertDepartment(department);
    }

    //更新部门
    public void updateDepartment(Department department) {
        departmentMapper.updateDepartment(department);
    }

    //删除部门
    public void deleteDepartment(int id) {
        departmentMapper.deleteDepartment(id);
    }

}
