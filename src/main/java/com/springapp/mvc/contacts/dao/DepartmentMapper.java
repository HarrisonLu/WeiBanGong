package com.springapp.mvc.contacts.dao;

import com.springapp.mvc.contacts.domain.Department;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartmentMapper {

    // 插入 部门
    public void insertDepartment(Department department);

    // 修改 部门
    public void updateDepartment(Department department);

    // 删除 部门
    public void deleteDepartmentById(int departmentId);

    // 根据 部门名称 找 部门
    public Department selectDepartmentByName(String departmentName);

    // 得到所有部门
    public List<Department> selectAllDepartment();
}
