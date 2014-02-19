package com.springapp.mvc.contacts.service;

import com.springapp.mvc.BaseTest;
import com.springapp.mvc.PrintTest;
import com.springapp.mvc.contacts.domain.Department;
import com.springapp.mvc.contacts.domain.Group;
import com.springapp.mvc.contacts.domain.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by Lion on 14-2-16.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class ContactsServiceTest extends BaseTest {

    @Autowired
    private ContactsService contactsService;

    private PrintTest printTest = new PrintTest();

    @Test
    public void fuzzySelectUserBaseInfoListByEnglishStringTest() throws Exception {
        List<User> userList = contactsService.fuzzySelectUserBaseInfoListByEnglishString("l");
        System.out.println(userList.size());
        for (User user : userList) {
            printTest.printUserInfo(user);
        }
    }

    @Test
    public void selectCollectedContactsBaseInfoListByUserIdTest() throws Exception {
        List<User> collectedContactsList = contactsService.selectCollectedContactsBaseInfoListByUserId(1);
        for (User user : collectedContactsList) {
            printTest.printUserInfo(user);
        }
    }

    @Test
    public void searchGroupUserBaseInfoListByUserId() throws Exception{
        List<User> userList = contactsService.searchGroupUserBaseInfoListByUserId(3);
        for (User user : userList){
            printTest.printUserInfo(user);
        }
    }

    @Test
    public void insertCollectedContactsTest() throws Exception {
        contactsService.insertCollectedContacts(2, 3);
    }

    @Test
    public void deleteCollectedContactsTest() throws Exception {
        contactsService.deleteCollectedContacts(2, 3);
    }

    @Test
    public void isCollectedContactsTest() throws Exception{
        System.out.println(contactsService.isCollectedContacts(2, 1));
    }

    @Test
    public void selectAllDepartmentBaseInfoTest() throws Exception{
        List<Department> departmentList = contactsService.selectAllDepartmentBaseInfo();
        for (Department department : departmentList){
            printTest.printDepartmentInfo(department);
        }
    }

    @Test
    public void selectUserDetailsByIdTest() throws Exception {
        User user = contactsService.selectUserDetailsById(1);
        printTest.printUserDetails(user);
    }

    @Test
    public void updateUserInfoTest() throws Exception {
        User user = new User();
        user.setId(1);
        user.setTelephoneNum("88886666");
        user.setMobilePhoneNum("13430325317");
        user.setQqNum("623360317");
        user.setEmail("luhuang@qq.com");
        contactsService.updateUserInfo(user);
    }

    @Test
    public void selectDepartmentDetailsByDepartmentIdTest() throws Exception{
        Department department = contactsService.selectDepartmentDetailsByDepartmentId(1);
        System.out.println("User number: " + department.getUserList().size());
        System.out.println("Group number: " + department.getGroupList().size());
        printTest.printDepartmentInfo(department);
    }

    @Test
    public void selectGroupDetailsByGroupIdTest() throws Exception{
        Group group = contactsService.selectGroupDetailsByGroupId(1);
        System.out.println("User number: " + group.getUserList().size());
        printTest.printGroupInfo(group);

    }

}
