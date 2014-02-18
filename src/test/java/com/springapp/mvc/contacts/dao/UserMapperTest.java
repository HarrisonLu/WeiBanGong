package com.springapp.mvc.contacts.dao;

import com.springapp.mvc.BaseTest;
import com.springapp.mvc.contacts.domain.User;
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
public class UserMapperTest extends BaseTest{

    @Autowired
    private UserMapper userMapper;

    @Test
    public void selectUserBaseInfoByIdTest() throws Exception {
        User user = userMapper.selectUserBaseInfoById(1);
//        System.out.println(user.getDepartmentList().size());
//        System.out.println(user.getGroupList().size());
//        printTest.printUserInfo(user);
    }

    @Test
    public void selectUserDetailsByIdTest() throws Exception {
        User user = userMapper.selectUserDetailsById(1);
//        System.out.println(user.getDepartmentList().size());
//        System.out.println(user.getGroupList().size());
//        printTest.printUserInfo(user);
    }

    @Test
    public void fuzzySelectUserListByEnglishStringTest() throws Exception{
        List<User> userList = userMapper.fuzzySelectUserBaseInfoListByEnglishString("l");
        System.out.println(userList.size());
        for (User user : userList){
            printTest.printUserInfo(user);
        }
    }
}
