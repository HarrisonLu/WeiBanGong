package com.springapp.mvc.dao.admin;

import com.springapp.mvc.domain.admin.Admin;
import com.springapp.mvc.domain.admin.Company;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * Created by lion on 14-6-8.
 */
@Repository
public interface AdminMapper {
    // 根据 账号和密码 判断 管理员是否存在
    public Integer hasAccountWithAdmin(Map<String, String> map);
    // 根据 账号和密码 找 管理员详细资料
    public Admin selectAdminDetailByAccountNumAndPassword(Map<String, String> map);
    // 插入 管理员
    public Integer insertAdmin(Admin admin);
    // 更新 管理员 详细信息
    public Integer updateAdminDetail(Admin admin);
}
