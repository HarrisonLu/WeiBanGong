package com.springapp.mvc;

import com.springapp.mvc.contacts.domain.User;
import com.springapp.mvc.contacts.service.ContactService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class ContactServiceTest {

    @Autowired
    private ContactService contactService;

    @Test
    public void testInsertUser() {
        User user = new User();
        user.setChineseName("卢煌");
        user.setEnglishName("luhuang");
        System.out.println(user.getChineseName());
        contactService.insertUser(user);
    }

}
