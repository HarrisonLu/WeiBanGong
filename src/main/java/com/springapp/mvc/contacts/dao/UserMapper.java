package com.springapp.mvc.contacts.dao;

import com.springapp.mvc.contacts.domain.UserInfo;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {

    public void insertUser(UserInfo userInfo);

    public UserInfo findUserByUsername(String userName);

    public void updateUser(UserInfo userInfo);

}
