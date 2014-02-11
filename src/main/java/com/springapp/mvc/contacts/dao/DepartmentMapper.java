package com.springapp.mvc.contacts.dao;

import com.springapp.mvc.contacts.domain.Department;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartmentMapper {

    // 插入部门
    public void insertDepartment(Department department);

    // 修改部门
    public void updateDepartment(Department department);

    // 删除部门
    public void deleteDepartment(int id);

    // 根据id搜索部门
    public Department selectDepartmentById(int id);

    // 根据名字搜索部门
    public Department selectDepartmentByName(String name);

    // 搜索所有部门
    public List<Department> selectAllDepartment();

}
