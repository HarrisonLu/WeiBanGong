package com.springapp.mvc.contacts.service;

import com.springapp.mvc.PrintTest;
import com.springapp.mvc.contacts.domain.User;
import junit.framework.TestCase;
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
public class ContactsServiceTest extends TestCase {

    @Autowired
    private ContactsService contactsService;

    private PrintTest printTest = new PrintTest();

    @Test
    public void fuzzySelectUserByStringTest() throws Exception {
        List<User> userList = contactsService.fuzzySelectUserByString("luhuan");
        for (User user : userList) {
            //printTest.printUserInfo(user);
        }
    }

    @Test
    public void searchCollectedContactsListByUserIdTest() throws Exception {
        List<User> collectedContactsList = contactsService.searchCollectedContactsListByUserId(1);
        for (User user : collectedContactsList) {
            //printTest.printUserInfo(user);
        }
    }

    @Test
    public void insertCollectedContactsTest() throws Exception {
        //contactsService.insertCollectedContacts(2, 3);
    }

    @Test
    public void deleteCollectedContacts() throws Exception {
        //contactsService.deleteCollectedContacts(1, 3);
    }
}
