package com.springapp.mvc.contacts.service;

import com.springapp.mvc.contacts.dao.UserMapper;
import com.springapp.mvc.contacts.domain.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ContactService {

    @Autowired
    private UserMapper userMapper;

    @Transactional
    public void insertUser(UserInfo userInfo) {
        userMapper.insertUser(userInfo);
    }

    @Transactional
    public UserInfo findUserByUsername(String userName) {
        return userMapper.findUserByUsername(userName);
    }

}
