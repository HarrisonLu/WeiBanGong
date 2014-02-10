package com.springapp.mvc.contacts.dao;

import com.springapp.mvc.contacts.domain.Department;
import com.springapp.mvc.contacts.domain.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
    //插入User
    public void insertUser(User user);

    //删除User
    void deleteUser(User user);

    //修改User
    public void updateUser(User user);

    //根据chineseName找user
    public User findUserByChineseName(String chineseName);

    //根据englishName找user
    public User findUserByEnglishName(String englishName);

    //插入部门
    public void insertDepartment(Department department);

    //删除部门
    public void deleteDepartment(Department department);

    //修改部门
    public void updateDepartment(Department department);

    //根据name找user
    public Department findDepartmentByName(String name);
}
