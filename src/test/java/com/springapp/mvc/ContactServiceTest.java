package com.springapp.mvc;

import com.springapp.mvc.contacts.domain.UserInfo;
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
        UserInfo userInfo = new UserInfo();
        userInfo.setChineseName("11111");
        userInfo.setEnglishName("22222");
        System.out.println(userInfo.getChineseName());
        contactService.insertUser(userInfo);
    }

}
