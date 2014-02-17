package com.springapp.mvc.contacts.service;

import com.springapp.mvc.contacts.dao.DepartmentMapper;
import com.springapp.mvc.contacts.dao.UserMapper;
import com.springapp.mvc.contacts.domain.Department;
import com.springapp.mvc.contacts.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Lion on 14-2-8.
 */

@Service
@Transactional
public class ContactsOperateService {

    @Autowired
    private UserMapper userMapper;

    // 增加常用联系人
    public void addFrequentContacts(Map<String, Integer> map) {
        //   userMapper.insertUserFrequentContactsLink(map);
    }

    // 删除常用联系人
    public void deleteFrequentContacts(Map<String, Integer> map) {
        //  userMapper.deleteUserFrequentContactsLink(map);
    }

    @Autowired
    private DepartmentMapper departmentMapper;

    // 录入成员
    public void insertUser(User user) {
        userMapper.insertUser(user);
    }

    // 更新成员
    public void updateUserInfo(User user) {
        userMapper.updateUser(user);
    }

    // 删除成员
    public void deleteUser(int id) {
        //  userMapper.deleteUser(id);
    }

    // 增加部门
    public void insertDepartment(Department department) {
        departmentMapper.insertDepartment(department);
    }

    // 更新部门
    public void updateDepartment(Department department) {
        departmentMapper.updateDepartment(department);
    }

    // 删除部门
    public void deleteDepartment(int id) {
        //  departmentMapper.deleteDepartment(id);
    }

    // 插入User和Department关联
    public void insertUserDepartmentLink(Map<String, Integer> map) {
        //  userMapper.insertUserDepartmentLink(map);
    }

    // 删除User和Department关联
    public void deleteUserDepartmentLink(Map<String, Integer> map) {
        // userMapper.deleteUserDepartmentLink(map);
    }
}
