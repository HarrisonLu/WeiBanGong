package com.springapp.mvc;

import com.springapp.mvc.contacts.domain.Department;
import com.springapp.mvc.contacts.domain.User;
import com.springapp.mvc.contacts.service.ContactService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class ContactServiceTest {

    @Autowired
    private ContactService contactService;

    @Test
    public void test() {
        User user = new User();
        user.setEmail("aaaaa@qq.com");
        user.setPassword("123456");
        user.setChineseName("奋进");
        contactService.insertUser(user);
        System.out.println(user.getId());
    }


    @Test
    public void test1() {
        List<User> users = contactService.selectAllUser();
        for (int i = 0; i < users.size(); ++i) {
            User user = users.get(i);
            System.out.print(user.getId() + ", " + user.getChineseName() + ": ");
            for (Department department : user.getDepartments()) {
                System.out.print(department.getName() + " ");
            }
            System.out.println();
        }
    }

    @Test
    public void test2() {
        List<User> users = contactService.selectUserByUsername("luhuang");
        for (int i = 0; i < users.size(); ++i) {
            User user = users.get(i);
            System.out.println(user.getId() + user.getChineseName());
        }
    }

    @Test
    public void test3() {
        Department department = new Department();
        department.setName("开发组");
        contactService.insertDepartment(department);
        System.out.println(department.getId());
    }

    @Test
    public void test4() {
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", 1);
        map.put("departmentId", 3);
        contactService.insertDepartmentLink(map);
    }

    @Test
    public void test5() {
        User user = contactService.selectUserById(3);
        System.out.println(user.getEmail());
        for (Department department : user.getDepartments()) {
            System.out.println(department.getName());
        }
    }

    @Test
    public void test6() {
        Department department = contactService.selectDepartmentById(1);
        System.out.println(department.getName());
        for (User user : department.getUsers()) {
            System.out.println(user.getEmail() + ", " + user.getChineseName());
        }
    }

    @Test
    public void test7() {
        List<Department> departments = contactService.selectAllDepartment();
        for (Department department : departments) {
            System.out.println(department.getName());
        }
    }


}
