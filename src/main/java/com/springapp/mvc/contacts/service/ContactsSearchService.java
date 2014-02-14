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

    // 根据字符串模糊搜索User列表
    public List<User> fuzzySelectUserByString(String str) {
        return userMapper.fuzzySelectUserByEnglishString(str);
    }

    public List<User> selectAllUser() {
        return userMapper.selectAllUser();
    }

    public List<User> selectFrequentContacts(int userId){
        List<Integer> frequentContactsIdList = userMapper.selectFrequentContactsIdByUserId(userId);
        List<User> frequentContactsList = new ArrayList<User>();
        for (int id : frequentContactsIdList){
            User frequentContacts = userMapper.selectUserById(id);
            frequentContactsList.add(frequentContacts);
        }
        return frequentContactsList;
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
