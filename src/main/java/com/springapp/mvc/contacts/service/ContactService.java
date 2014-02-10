package com.springapp.mvc.contacts.service;

import com.springapp.mvc.contacts.dao.UserMapper;
import com.springapp.mvc.contacts.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ContactService {

    @Autowired
    private UserMapper userMapper;

    //录入个人信息
    public void insertUser(User user) {
        userMapper.insertUser(user);
    }


    public User findUserByChineseName(String chineseName) {
        return userMapper.findUserByChineseName(chineseName);
    }

}
