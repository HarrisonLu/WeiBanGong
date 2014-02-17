package com.springapp.mvc.contacts.service;

import com.springapp.mvc.contacts.dao.DepartmentMapper;
import com.springapp.mvc.contacts.dao.LinkMapper;
import com.springapp.mvc.contacts.dao.UserMapper;
import com.springapp.mvc.contacts.domain.Department;
import com.springapp.mvc.contacts.domain.Group;
import com.springapp.mvc.contacts.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Lion on 14-2-9.
 */
@Service
@Transactional
public class ContactsService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private LinkMapper linkMapper;

    // 根据 字符串 模糊搜索 用户列表
    public List<User> fuzzySelectUserByString(String str) {
        return userMapper.fuzzySelectUserListByEnglishString(str);
    }

    // 根据 用户id 找 收藏联系人列表
    public List<User> searchCollectedContactsListByUserId(int userId) {
        List<Integer> collectedContactsIdList = linkMapper.selectCollectedContactsIdListByUserId(userId);
        List<User> collectedContactsList = new ArrayList<User>();
        for (int id : collectedContactsIdList) {
            User collectedContacts = userMapper.selectUserById(id);
            collectedContactsList.add(collectedContacts);
        }
        return collectedContactsList;
    }

    // 根据 成员id 找 部门联系人列表
    public List<User> searchDepartmentContactsListByUserId(int userId) {
        return null;
    }

    // 根据 成员id和联系人id 增加收藏联系人
    public void insertCollectedContacts(int userId, int collectedContactsId) {
        HashMap<String, Integer> userId_collectedContactsId = new HashMap<String, Integer>();
        userId_collectedContactsId.put("user_id", userId);
        userId_collectedContactsId.put("collectedcontacts_id", collectedContactsId);
        linkMapper.insertUserIdCollectedContactsIdLink(userId_collectedContactsId);
    }

    // 根据 成员id和联系人id 删除收藏联系人
    public void deleteCollectedContacts(int userId, int collectedContactsId) {
        Map<String, Integer> userId_collectedContactsId = new HashMap<String, Integer>();
        userId_collectedContactsId.put("user_id", userId);
        userId_collectedContactsId.put("collectedcontacts_id", collectedContactsId);
        linkMapper.deleteUserIdCollectedContactsIdLink(userId_collectedContactsId);
    }

    // 判断 成员和联系人 是否为 收藏联系人关系
    public boolean isCollectedContacts(int userId, int collectedContactsId) {
        return false;
    }

    // 得到 所有部门
    public List<Department> selectAllDepartment() {
        return departmentMapper.selectAllDepartment();
    }

    // 更新 成员信息
    public void updateUserInfo(User user) {

    }

    // 根据 成员id 找 部门列表
    public List<Department> searchDepartmentListByUserId(int userId) {
        return null;
    }

    // 根据 部门id 找 组列表
    public List<Group> serchGroupListByDepartmentId(int departmentId) {
        return null;
    }

    // 根据 部门id 找 部门成员列表
    public List<User> searchUserListByDepartmentId(int DepartmentId) {
        return null;
    }

    // 根据 组id 找 部门成员列表
    public List<User> searchUserListByGroupId(int GroupId) {
        return null;
    }


    //待删
    public Department selectDepartmentById(int departmentId) {
        return null;
    }

    public User selectUserById(int userId) {
        return null;
    }

    public List<User> selectAllUser() {
        return null;
    }


//    @Autowired
//    private DepartmentMapper departmentMapper;
//
//    public Department selectDepartmentById(int id) {
//        return departmentMapper.selectDepartmentById(id);
//    }
//
//    public Department selectDepartmentByName(String name) {
//        return departmentMapper.selectDepartmentByName(name);
//    }
//
//    public List<Department> selectAllDepartment() {
//        return departmentMapper.selectAllDepartment();
//    }

}
