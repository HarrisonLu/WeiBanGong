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

    // 得到 所有部门基本信息
    public List<Department> selectAllDepartmentBaseInfo();
}
