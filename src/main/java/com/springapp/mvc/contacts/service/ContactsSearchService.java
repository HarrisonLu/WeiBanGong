package com.springapp.mvc.contacts.service;

import com.springapp.mvc.contacts.dao.LinkMapper;
import com.springapp.mvc.contacts.dao.UserMapper;
import com.springapp.mvc.contacts.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Lion on 14-2-9.
 */
@Service
@Transactional
public class ContactsSearchService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private LinkMapper linkMapper;

    // 根据 字符串 模糊搜索 用户列表
    public List<User> fuzzySelectUserByString(String str) {
        return userMapper.fuzzySelectUserListByEnglishString(str);
    }

    // 根据 用户id 找 收藏联系人列表
    public List<User> searchCollectedContactsListByUserId(int userId){
        List<Integer> collectedContactsIdList = linkMapper.selectCollectedContactsIdListByUserId(userId);
        List<User> collectedContactsList = new ArrayList<User>();
        for (int id : collectedContactsIdList){
            User collectedContacts = userMapper.selectUserById(id);
            collectedContactsList.add(collectedContacts);
        }
        return collectedContactsList;
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
