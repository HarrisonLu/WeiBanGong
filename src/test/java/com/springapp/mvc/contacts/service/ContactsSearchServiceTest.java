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

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by Lion on 14-2-14.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class ContactsSearchServiceTest {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private DepartmentMapper departmentMapper;
    private ContactsOperateService contactsOperateService;

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

    private TestData testData;

    public ContactsSearchServiceTest(){
        testData = new TestData();
    }

    // 根据成员名字模糊搜索 测试
    @Test
    public void searchUserByNameTest(){
//        contactsOperateService.insertUser(testData.getUser_1());
//        contactsOperateService.insertUser(testData.getUser_2());
//        contactsOperateService.insertUser(testData.getUser_3());

        List<User> userList;
        userList = contactsSearchService.selectAllUser();
        testData.printUserInfo(userList.get(0));
//        assertEquals(3, userList.size());
//        testData.printUserInfo(userList.get(0));
//        assertEquals(testData.getUser_1().getId(), userList.get(0).getId());
//        assertEquals(testData.getUser_1().getEnglishName(),userList.get(0).getEnglishName());

//        userList = contactsSearchService.fuzzySelectUserByString(testData.fuzzyStr_fe);
//        assertEquals(1, userList.size());
//        assertEquals(testData.getUser_2().getEnglishName(),userList.get(0).getEnglishName());
//
//        userList = contactsSearchService.fuzzySelectUserByString(testData.fuzzyStr_s);
//        assertEquals(1, userList.size());
//        assertEquals(testData.getUser_3().getEnglishName(),userList.get(0).getEnglishName());
//
//        userList = contactsSearchService.fuzzySelectUserByString(testData.fuzzyStr_lalala);
//        assertEquals(0, userList.size());

//        contactsOperateService.deleteUser(testData.getUser_1().getId());
//        contactsOperateService.deleteUser(testData.getUser_2().getId());
//        contactsOperateService.deleteUser(testData.getUser_3().getId());
    }
}
