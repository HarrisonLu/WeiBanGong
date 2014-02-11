package com.springapp.mvc.contacts.dao;

import com.springapp.mvc.contacts.domain.Department;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartmentMapper {

    //插入部门
    public void insertDepartment(Department department);

    public Department selectDepartmentById(int id);
    public Department selectDepartmentByName(String name);
    public List<Department> selectAllDepartment();

    //修改部门
    public void updateDepartment(Department department);

    //删除部门
    public void deleteDepartment(int id);



}
