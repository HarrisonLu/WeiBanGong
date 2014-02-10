package com.springapp.mvc.contacts.service;

import com.springapp.mvc.contacts.dao.DepartmentMapper;
import com.springapp.mvc.contacts.dao.UserMapper;
import com.springapp.mvc.contacts.domain.Department;
import com.springapp.mvc.contacts.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

@Service
@Transactional
public class ContactService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 录入成员
     *
     * @param user
     */
    public void insertUser(User user) {
        userMapper.insertUser(user);
    }

    /**
     * 插入成员与部门关系
     *
     * @param map
     */
    public void insertDepartmentLink(HashMap<String, Integer> map) {
        userMapper.insertDepartmentLink(map);
    }

    /**
     * 根据id找成员
     *
     * @param id
     * @return
     */
    public User selectUserById(int id) {
        return userMapper.selectUserById(id);
    }

    /**
     * 根据名字找成员
     *
     * @param userName
     * @return
     */
    public List<User> selectUserByUsername(String userName) {
        return userMapper.selectUserByUsername(userName);
    }

    /**
     * 找出所有成员
     *
     * @return
     */
    public List<User> selectAllUser() {
        return userMapper.selectAllUser();
    }

    /**
     * 删除成员
     *
     * @param id
     */
    public void deleteUser(int id) {
        userMapper.deleteUser(id);
    }

    @Autowired
    private DepartmentMapper departmentMapper;

    /**
     * 增加部门
     *
     * @param department
     */
    public void insertDepartment(Department department) {
        departmentMapper.insertDepartment(department);
    }

    /**
     * 根据id找出部门
     *
     * @param id
     * @return
     */
    public Department selectDepartmentById(int id) {
        return departmentMapper.selectDepartmentById(id);
    }

    public List<Department> selectAllDepartment() {
        return departmentMapper.selectAllDepartment();
    }

    /**
     * 更新部门
     *
     * @param department
     */
    public void updateDepartment(Department department) {
        departmentMapper.updateDepartment(department);
    }

    /**
     * 删除部门
     *
     * @param id
     */
    public void deleteDepartment(int id) {
        departmentMapper.deleteDepartment(id);
    }

}
