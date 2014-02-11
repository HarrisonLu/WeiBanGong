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
 * Created by Lion on 14-2-9.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class ContactsOperateServiceTest {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private DepartmentMapper departmentMapper;

    @Autowired
    private ContactsOperateService contactsOperateService;

    //录入成员
    @Test
    public void testInsertUser() {
        User user = new User();
        user.setPassword("12345678_abcd");
        user.setChineseName("卢煌");
        user.setEnglishName("luhuang");
        user.setEmail("luhuang12@qq.com");
        user.setPositionTitle("newHand");
        user.setWeChatNum("88886666444");
        user.setQqNum("1212121212");
        user.setPhoneNum("13888888888");

        assertNull(userMapper.selectUserByName("luhuang"));
        contactsOperateService.insertUser(user);
        assertNotNull(userMapper.selectUserByName("luhuang"));

        User user1 = userMapper.selectUserByName("luhuang");
        assertEquals(user1.getPassword(), "12345678_abcd");
        assertEquals(user1.getEmail(), "luhuang@qq.com");
    }

    @Test
    public void testSelectAllUser() {
        List<User> users = contactsOperateService.selectAllUser();
        for (User user : users) {
            assertNotNull(user.getEmail());
            for (Department department : user.getDepartments()) {
                assertNotNull(department.getName());
            }
        }
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
        contactsOperateService.insertUser(user);

        assertNotNull(userMapper.selectUserByName("luhuang"));
        contactsOperateService.deleteUser(1);
        assertNull(userMapper.selectUserByName("luhuang"));
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
        contactsOperateService.insertUser(user);

        user.setPassword("12345678_dbca");
        user.setChineseName("奋进");
        user.setEnglishName("fenjin");
        user.setEmail("shifenjin@qq.com");
        user.setPositionTitle("engineer");
        user.setWeChatNum("fenjiang");
        user.setQqNum("170843737");
        user.setPhoneNum("13999999999");
        contactsOperateService.updateUserInfo(user);

        User user_1 = userMapper.selectUserByName("fenjin");
        assertEquals("shifenjin@qq.com", user_1.getEmail());

        contactsOperateService.deleteUser(1);

    }

    //增加部门
    @Test
    public void TestAddDepartment() {
        Department department = new Department();
        department.setId(1);
        department.setName("Technology");

        assertNull(departmentMapper.selectDepartmentByName("Technology"));
        contactsOperateService.insertDepartment(department);
        assertNotNull(departmentMapper.selectDepartmentByName("Technology"));

        Department department_1 = departmentMapper.selectDepartmentByName("Technology");
        assertEquals("Technology", department_1.getName());

        contactsOperateService.deleteDepartment(1);

    }

    //删除部门
    @Test
    public void TestDeleteDepartment() {
        Department department = new Department();
        department.setId(1);
        department.setName("Technology");
        contactsOperateService.insertDepartment(department);

        assertNotNull(departmentMapper.selectDepartmentByName("Technology"));
        contactsOperateService.deleteDepartment(1);
        assertNull(departmentMapper.selectDepartmentByName("Technology"));
    }

    //更新部门
    @Test
    public void TestUpdateDepartment() {
        Department department = new Department();
        department.setId(1);
        department.setName("Technology");
        contactsOperateService.insertDepartment(department);

        department.setName("Sales");
        contactsOperateService.updateDepartment(department);

        Department department_1 = departmentMapper.selectDepartmentByName("Sales");
        assertEquals(1, department_1.getId());

        contactsOperateService.deleteDepartment(1);
    }
}
