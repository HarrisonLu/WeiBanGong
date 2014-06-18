package com.springapp.mvc.dao.admin;

import com.springapp.mvc.domain.admin.Company;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * Created by lion on 14-6-8.
 */
@Repository
public interface CompanyMapper {
    // 插入 公司
    public Integer insertCompany(Company company);
    // 判断 是否设置员工账号后缀
    public Integer hasUserAccountPostfix(int companyId);
    // 设置 员工账号后缀
    public void setUserAccountPostfix(Company company);
}
