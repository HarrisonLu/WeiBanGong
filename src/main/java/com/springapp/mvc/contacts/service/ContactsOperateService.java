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

/**
 * Created by Lion on 14-2-8.
 */

@Service
@Transactional
public class ContactsOperateService {

    @Autowired
    private UserMapper userMapper;

    // 普通用户操作 相关
        // 个人信息操作相关


        // 常用联系人操作 相关
            // 增加常用联系人
            public void addFrequentContacts(HashMap<String, Integer> map){
                userMapper.insertUserFrequentContactsLink(map);
            }

            // 删除常用联系人
            public void deleteFrequentContacts(HashMap<String, Integer> map){
                userMapper.deleteUserFrequentContactsLink(map);
            }
            // 根据userId找frequentContacts
            public List<User> getFrequentContacts(int id){
                return null;
            }


    @Autowired
    private DepartmentMapper departmentMapper;

    // 管理员操作相关
        // 修改成员 相关
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
                userMapper.deleteUser(id);
            }

        // 修改部门相关
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
                departmentMapper.deleteDepartment(id);
            }

        // 修改成员与部门关联 相关
            // 插入User和Department关联
            public void insertUserDepartmentLink(HashMap<String, Integer> map) {
                userMapper.insertUserDepartmentLink(map);
            }
            // 删除User和Department关联
            public void deleteUserDepartmentLink(HashMap<String, Integer> map)
            {
                userMapper.deleteUserDepartmentLink(map);
            }
}
