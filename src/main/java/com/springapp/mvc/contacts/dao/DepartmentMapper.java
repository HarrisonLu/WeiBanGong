package com.springapp.mvc.contacts.dao;

import com.springapp.mvc.contacts.domain.Department;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartmentMapper {

    public Department selectDepartmentById(int id);

    public List<Department> selectAllDepartment();

    public void insertDepartment(Department department);

    public void updateDepartment(Department department);

    public void deleteDepartment(int id);
}
