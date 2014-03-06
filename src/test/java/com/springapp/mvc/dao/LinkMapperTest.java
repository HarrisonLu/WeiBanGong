package com.springapp.mvc.dao;

import com.springapp.mvc.BaseTest;
import com.springapp.mvc.domain.contacts.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by Lion on 14-2-18.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class LinkMapperTest extends BaseTest{

    @Autowired
    private LinkMapper linkMapper;

    @Test
    public void selectCollectedContactsBaseInfoListByUserIdTest() throws Exception {
        List<User> userList = linkMapper.selectCollectedContactsBaseInfoListByUserId(1);
        System.out.println(userList.size());
        for (User user : userList){
            printTest.printUserInfo(user);
        }
    }


}
