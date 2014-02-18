package com.springapp.mvc.contacts.service;

import com.springapp.mvc.BaseTest;
import com.springapp.mvc.PrintTest;
import com.springapp.mvc.contacts.domain.Department;
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
//        List<User> userList = contactsService.fuzzySelectUserBaseInfoListByEnglishString("l");
//        for (User user : userList) {
//            printTest.printUserInfo(user);
//        }
    }

    @Test
    public void selectCollectedContactsBaseInfoListByUserIdTest() throws Exception {
//        List<User> collectedContactsList = contactsService.selectCollectedContactsBaseInfoListByUserId(1);
//        for (User user : collectedContactsList) {
//            printTest.printUserInfo(user);
//        }
    }

    @Test
    public void insertCollectedContactsTest() throws Exception {
        //contactsService.insertCollectedContacts(2, 3);
    }

    @Test
    public void deleteCollectedContactsTest() throws Exception {
        //contactsService.deleteCollectedContacts(1, 3);
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
//        User user = contactsService.selectUserDetailsById(1);
//        printTest.printUserInfo(user);
    }

}
