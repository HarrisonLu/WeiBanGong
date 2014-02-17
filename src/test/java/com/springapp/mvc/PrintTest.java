package com.springapp.mvc;

import com.springapp.mvc.contacts.domain.User;

/**
 * Created by Lion on 14-2-17.
 */
public class PrintTest {

    public void printUserInfo(User user){
        System.out.print(user.getId() + "  ");
        System.out.print(user.getPassword() + "  ");
        System.out.print(user.getChineseName() + "  ");
        System.out.print(user.getChineseNamePinyin() + "  ");
        System.out.print(user.getEnglishName() + "  ");
        System.out.print(user.getEmail() + "  ");
        System.out.print(user.getStatus() + "  ");
        System.out.print(user.getPosition() + "  ");
        System.out.print(user.getPositionLevel() + "  ");
        System.out.print(user.getWechatNum() + "  ");
        System.out.print(user.getQqNum() + "  ");
        System.out.print(user.getTelephoneNum() + "  ");
        System.out.print(user.getMobilePhoneNum() + "  ");
        System.out.println();
    }

}
