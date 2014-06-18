package com.springapp.mvc.dao.admin;

import com.springapp.mvc.domain.admin.Administrator;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * Created by lion on 14-6-8.
 */
@Repository
public interface AdministratorMapper {
    // 根据 账号和密码 判断 管理员是否存在
    public Integer hasAccountWithAdmin(Map<String, String> map);
    // 根据 账号和密码 找 管理员详细资料
    public Administrator selectAdminDetailByAccountNumAndPassword(Map<String, String> map);
    // 插入 管理员
    public Integer insertAdmin(Administrator administrator);
    // 更新 管理员 详细信息
    public Integer updateAdminDetail(Administrator administrator);
    // 修改 管理员 密码
    public void updateAdminPassword(Administrator administrator);
}
