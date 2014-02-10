package com.springapp.mvc.contacts.service;

import com.springapp.mvc.contacts.dao.UserMapper;
import com.springapp.mvc.contacts.domain.Department;
import com.springapp.mvc.contacts.domain.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

/**
 * Created by Lion on 14-2-9.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class ContactsOperateServiceTest {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ContactsOperateService contactsOperateService;

    //录入成员
    @Test
    public void testInsertUser() {
        User user = new User();
        user.setId(1);
        user.setPassword("12345678_abcd");
        user.setChineseName("卢煌");
        user.setEnglishName("luhuang");
        user.setEmail("luhuang@qq.com");
        user.setPositionTitle("newHand");
        user.setWeChatNum("88886666444");
        user.setQqNum("1212121212");
        user.setPhoneNum("13888888888");

        assertNull(userMapper.findUserByEnglishName("luhuang"));
        contactsOperateService.addUser(user);
        assertNotNull(userMapper.findUserByEnglishName("luhuang"));

        User user1 = userMapper.findUserByEnglishName("luhuang");
        assertEquals(user1.getPassword(), "12345678_abcd");
        assertEquals(user1.getEmail(), "luhuang@qq.com");

        contactsOperateService.deleteUser(user);
    }

    //删除成员
    @Test
    public void testDeleteUser() {
        User user = new User();
        user.setId(1);
        user.setPassword("12345678_abcd");
        user.setChineseName("卢煌");
        user.setEnglishName("luhuang");
        user.setEmail("luhuang@qq.com");
        user.setPositionTitle("newHand");
        user.setWeChatNum("88886666444");
        user.setQqNum("1212121212");
        user.setPhoneNum("13888888888");
        contactsOperateService.addUser(user);

        assertNotNull(userMapper.findUserByEnglishName("luhuang"));
        contactsOperateService.deleteUser(user);
        assertNull(userMapper.findUserByEnglishName("luhuang"));

    }

    //更新成员信息
    @Test
    public void TestUpdateUserInfo() {
        User user = new User();
        user.setId(1);
        user.setPassword("12345678_abcd");
        user.setChineseName("卢煌");
        user.setEnglishName("luhuang");
        user.setEmail("luhuang@qq.com");
        user.setPositionTitle("newHand");
        user.setWeChatNum("88886666444");
        user.setQqNum("1212121212");
        user.setPhoneNum("13888888888");
        contactsOperateService.addUser(user);

        user.setPassword("12345678_dbca");
        user.setChineseName("奋进");
        user.setEnglishName("fenjin");
        user.setEmail("shifenjin@qq.com");
        user.setPositionTitle("engineer");
        user.setWeChatNum("fenjiang");
        user.setQqNum("170843737");
        user.setPhoneNum("13999999999");
        contactsOperateService.updateUserInfo(user);

        User user_1 = userMapper.findUserByEnglishName("fenjin");
        assertEquals("shifenjin@qq.com", user_1.getEmail());

        contactsOperateService.deleteUser(user_1);

    }

    //增加部门
    @Test
    public void TestAddDepartment() {
        Department department = new Department();
        department.setId(1);
        department.setName("Technology");

        assertNull(userMapper.findDepartmentByName("Technology"));
        contactsOperateService.addDepartment(department);
        assertNotNull(userMapper.findDepartmentByName("Technology"));

        Department department_1 = userMapper.findDepartmentByName("Technology");
        assertEquals("Technology", department_1.getName());

        contactsOperateService.deleteDepartment(department_1);

    }

    //删除部门
    @Test
    public void TestDeleteDepartment() {
        Department department = new Department();
        department.setId(1);
        department.setName("Technology");
        contactsOperateService.addDepartment(department);

        assertNotNull(userMapper.findDepartmentByName("Technology"));
        contactsOperateService.deleteDepartment(department);
        assertNull(userMapper.findDepartmentByName("Technology"));
    }

    //更新部门
    @Test
    public void TestUpdateDepartment() {
        Department department = new Department();
        department.setId(1);
        department.setName("Technology");
        contactsOperateService.addDepartment(department);

        department.setName("Sales");
        contactsOperateService.updateDepartment(department);

        Department department_1 = userMapper.findDepartmentByName("Sales");
        assertEquals(1, department_1.getId());

        contactsOperateService.deleteDepartment(department_1);
    }
}
