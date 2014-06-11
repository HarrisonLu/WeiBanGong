package com.springapp.mvc.dao.contacts;

import com.springapp.mvc.domain.contacts.Department;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartmentMapper {

    // 插入 部门
    public Integer insertDepartment(Department department);

    /// 修改 部门
    public void updateDepartment(Department department);

    /// 删除 部门
    public Integer deleteDepartmentById(int departmentId);

    // 得到 所有部门基本信息
    public List<Department> selectAllDepartmentBaseInfo();

    // 根据 部门id 找 部门详细信息
    public Department selectDepartmentDetailsByDepartmentId(int departmentId);

}
