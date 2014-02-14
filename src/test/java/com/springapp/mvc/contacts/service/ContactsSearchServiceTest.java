package com.springapp.mvc.contacts.service;

import com.springapp.mvc.contacts.dao.DepartmentMapper;
import com.springapp.mvc.contacts.dao.UserMapper;
import com.springapp.mvc.contacts.domain.Department;
import com.springapp.mvc.contacts.domain.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;

/**
 * Created by Lion on 14-2-9.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class ContactsSearchServiceTest {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private DepartmentMapper departmentMapper;

    @Autowired
    private ContactsSearchService contactsSearchService;

    @Test
    public void testSelectUserById() {
        User user = contactsSearchService.selectUserById(1);
        System.out.println(user.getEmail() + ", " + user.getEnglishName());
        List<Department> departments = user.getDepartments();
        for (Department department : departments) {
            System.out.println(department.getName());
        }
    }

    @Test
    public void testSelectAllUser() {
        List<User> users = contactsSearchService.selectAllUser();
        for (User user : users) {
            System.out.print(user.getEmail() + ", " + user.getChineseName());
            for (Department department : user.getDepartments()) {
                System.out.print(" " + department.getName());
            }
            System.out.println();
        }
    }

    @Test
    public void testSelectAllDepartment() {
        List<Department> departments = contactsSearchService.selectAllDepartment();
        for (Department department : departments) {
            System.out.println(department.getName());
        }
    }

    @Test
    public void selectFrequentContacts(){
        List<User> users = contactsSearchService.selectFrequentContacts(1);
        for (User user : users) {
            System.out.println(user.getEmail());
        }
    }
}
