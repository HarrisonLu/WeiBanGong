package com.springapp.mvc.contacts.service;

import com.springapp.mvc.contacts.dao.UserMapper;
import com.springapp.mvc.contacts.domain.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ContactService {

    @Autowired
    private UserMapper userMapper;

    public void insertUser(UserInfo userInfo) {
        userMapper.insertUser(userInfo);
    }

    public UserInfo findUserByUsername(String userName) {
        return userMapper.findUserByUsername(userName);
    }

}
