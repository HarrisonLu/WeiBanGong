package com.springapp.mvc;

import com.springapp.mvc.contacts.domain.Department;
import com.springapp.mvc.contacts.domain.Group;
import com.springapp.mvc.contacts.domain.User;

/**
 * Created by Lion on 14-2-17.
 */
public class PrintTest {

    public void printUserInfo(User user) {
        System.out.print("成员信息：");
        System.out.print(user.getChineseName() + "  ");
        System.out.print(user.getEnglishName() + "  ");

        System.out.println();

        if (user.getDepartmentList() != null){
            System.out.print("所属部门：");
            for (Department department : user.getDepartmentList()){
                System.out.print(department.getName() + "  ");
            }
        }
        System.out.println();

        if (user.getGroupList() != null){
            System.out.print("所属组：");
            for (Group group : user.getGroupList()){
                System.out.print(group.getDepartmentName() + " - " + group.getName() + "  ");
            }
        }
        System.out.println();

        System.out.println();
    }
    public void printUserDetails(User user){
        System.out.print("成员信息：");
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

        if (user.getDepartmentList() != null){
            System.out.print("所属部门：");
            for (Department department : user.getDepartmentList()){
                System.out.print(department.getName() + "  ");
            }
        }
        System.out.println();

        if (user.getGroupList() != null){
            System.out.print("所属组：");
            for (Group group : user.getGroupList()){
                System.out.print(group.getDepartmentName() + " - " + group.getName() + "  ");
            }
        }
        System.out.println();

        System.out.println();
    }
    public void printDepartmentInfo(Department department){
        System.out.print("部门信息：");
        System.out.print(department.getId() + "  ");
        System.out.print(department.getName() + "  ");
        System.out.println();

        if (department.getUserList() != null){
            System.out.print("部门成员：");
            for (User user : department.getUserList()){
                System.out.print(user.getChineseName() + " ");
                System.out.print(user.getEnglishName() + " ");
                System.out.print("  ");
            }
        }
        System.out.println();

        if (department.getGroupList() != null){
            System.out.print("部门组：");
            for (Group group : department.getGroupList()){
                System.out.print(group.getName() + "  ");
            }
        }
        System.out.println();

        System.out.println();
    }
    public void printGroupInfo(Group group){
        System.out.print("组信息：");
        System.out.print(group.getId() + "  ");
        System.out.print(group.getName() + "  ");
        System.out.print(group.getDepartmentName() + "  ");
        System.out.println();

        if (group.getUserList() != null){
            System.out.print("组成员：");
            for (User user : group.getUserList()){
                System.out.print(user.getChineseName() + " ");
                System.out.print(user.getEnglishName() + " ");
                System.out.print("  ");
            }
        }
        System.out.println();

        System.out.println();
    }

}
