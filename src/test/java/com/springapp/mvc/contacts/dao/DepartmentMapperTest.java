package com.springapp.mvc.contacts.dao;

import com.springapp.mvc.BaseTest;
import com.springapp.mvc.contacts.domain.Department;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by Lion on 14-2-18.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class DepartmentMapperTest extends BaseTest{

    @Autowired
    private DepartmentMapper departmentMapper;

    @Test
    public void selectAllDepartmentBaseInfoTest() throws Exception {
        List<Department> departmentList = departmentMapper.selectAllDepartmentBaseInfo();
        for (Department department : departmentList){
            printTest.printDepartmentInfo(department);
        }
    }
}
