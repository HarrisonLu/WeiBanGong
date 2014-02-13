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
 * Created by Lion on 14-2-9.
 */
@Service
@Transactional
public class ContactsSearchService {

    @Autowired
    private UserMapper userMapper;

    public User selectUserById(int id) {
        return userMapper.selectUserById(id);
    }

    public List<User> selectUserByName(User user) {
        return userMapper.selectUserByName(user);
    }

    public List<User> selectAllUser() {
        return userMapper.selectAllUser();
    }

    @Autowired
    private DepartmentMapper departmentMapper;

    public Department selectDepartmentById(int id) {
        return departmentMapper.selectDepartmentById(id);
    }

    public Department selectDepartmentByName(String name) {
        return departmentMapper.selectDepartmentByName(name);
    }

    public List<Department> selectAllDepartment() {
        return departmentMapper.selectAllDepartment();
    }

}
