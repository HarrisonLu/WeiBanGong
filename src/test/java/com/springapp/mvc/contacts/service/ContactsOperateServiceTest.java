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

    private TestData testData;

    public ContactsOperateServiceTest(){
        testData = new TestData();
    }

    // 增加常用联系人测试
    @Test
    public void insertFrequentContactsTest(){

        HashMap<String, Integer> map = new HashMap<String, Integer>();
        map.put("user_id", testData.getUser_1().getId());
        map.put("frequentcontacts_id", testData.getUser_2().getId());

        contactsOperateService.insertUser(testData.getUser_1());
        contactsOperateService.insertUser(testData.getUser_2());

        contactsOperateService.addFrequentContacts(map);
        //assertEquals(1, contactsOperateService.getFrequentContacts(1).size());
        contactsOperateService.deleteFrequentContacts(map);

        contactsOperateService.deleteUser(testData.getUser_1().getId());
        contactsOperateService.deleteUser(testData.getUser_2().getId());
    }

    // 删除常用联系人测试
    @Test
    public void deleteFrequentContactsTest(){

    }

    // 根据 用户id 找 常用联系人测试
    @Test
    public void getFrequentContacts(){
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        map.put("user_id", testData.getUser_1().getId());
        map.put("frequentcontacts_id", testData.getUser_2().getId());

        contactsOperateService.insertUser(testData.getUser_1());
        contactsOperateService.insertUser(testData.getUser_2());

        contactsOperateService.addFrequentContacts(map);
        assertEquals(1, contactsOperateService.getFrequentContacts(1).size());
        contactsOperateService.deleteFrequentContacts(map);

        contactsOperateService.deleteUser(testData.getUser_1().getId());
        contactsOperateService.deleteUser(testData.getUser_2().getId());
    }

    // 增加部门测试
    @Test
    public void addDepartmentTest() {
        assertNull(departmentMapper.selectDepartmentByName("Technology"));
        contactsOperateService.insertDepartment(testData.getDepartment_1());
        assertNotNull(departmentMapper.selectDepartmentByName("Technology"));

        Department department_1 = departmentMapper.selectDepartmentByName("Technology");
        assertEquals("Technology", department_1.getName());

        contactsOperateService.deleteDepartment(testData.getDepartment_1().getId());
    }

    // 删除部门测试
    @Test
    public void deleteDepartmentTest() {
        contactsOperateService.insertDepartment(testData.getDepartment_1());

        assertNotNull(departmentMapper.selectDepartmentByName("Technology"));
        contactsOperateService.deleteDepartment(testData.getDepartment_1().getId());
        assertNull(departmentMapper.selectDepartmentByName("Technology"));
    }

    // 更新部门测试
    @Test
    public void updateDepartmentTest() {
        contactsOperateService.insertDepartment(testData.getDepartment_1());

        testData.getDepartment_1().setName("Sales");
        contactsOperateService.updateDepartment(testData.getDepartment_1());

        Department department_1 = departmentMapper.selectDepartmentByName("Sales");
        assertEquals(testData.getDepartment_1().getId(), department_1.getId());

        contactsOperateService.deleteDepartment(testData.getDepartment_1().getId());
    }

    // 录入成员测试
    @Test
    public void insertUserTest() {
        assertNull(userMapper.selectUserByEnglishName("luhuang"));
        contactsOperateService.insertUser(testData.getUser_1());
        assertNotNull(userMapper.selectUserByEnglishName("luhuang"));

        testData.printUserInfo(userMapper.selectUserByEnglishName("luhuang"));

        contactsOperateService.deleteUser(testData.getUser_1().getId());
    }

    // 删除成员测试
    @Test
    public void deleteUserTest() {
        contactsOperateService.insertUser(testData.getUser_1());

        assertNotNull(userMapper.selectUserByEnglishName("luhuang"));
        contactsOperateService.deleteUser(testData.getUser_1().getId());
        assertNull(userMapper.selectUserByEnglishName("luhuang"));
    }

    // 更新成员信息测试
    @Test
    public void updateUserInfoTest() {
        contactsOperateService.insertUser(testData.getUser_1());

        testData.getUser_1().setPassword("12345678_dbca");
        testData.getUser_1().setChineseName("烧猪");
        testData.getUser_1().setEnglishName("shaozhu");
        testData.getUser_1().setEmail("shaozhu@qq.com");
        testData.getUser_1().setPositionTitle("shadiao");
        testData.getUser_1().setWeChatNum("shaozhulalala");
        testData.getUser_1().setQqNum("434343434");
        testData.getUser_1().setPhoneNum("13999993399");
        contactsOperateService.updateUserInfo(testData.getUser_1());

        User user_1 = userMapper.selectUserByEnglishName("shaozhu");
        assertEquals("shaozhu@qq.com", user_1.getEmail());

        contactsOperateService.deleteUser(testData.getUser_1().getId());
    }

    // 插入User和Department关联测试
    @Test
    public void insertUserDepartmentLinkTest() {
        contactsOperateService.insertUser(testData.getUser_1());
        contactsOperateService.insertDepartment(testData.getDepartment_1());

        HashMap<String, Integer> map = new HashMap<String, Integer>();
        map.put("user_id", testData.getUser_1().getId());
        map.put("department_id", testData.getDepartment_1().getId());
        contactsOperateService.insertUserDepartmentLink(map);
        contactsOperateService.deleteUserDepartmentLink(map);

        contactsOperateService.deleteUser(testData.getUser_1().getId());
        contactsOperateService.deleteDepartment(testData.getDepartment_1().getId());
    }

    // 删除User和Department关联测试
}
