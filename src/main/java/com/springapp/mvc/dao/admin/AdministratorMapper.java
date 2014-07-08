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

    // 根据 管理员id 找 管理员详细资料
    public Administrator selectAdminDetailsByAdminId(int adminId);


    // 权限 相关
    // 新建项目权限 相关
    // 插入 新建项目权限
    public Integer insertRightsForCreateProject(Map<String, Integer> map);

    // 删除 新建项目权限
    public Integer deleteRightsForCreateProject(int userId);

    // 判断 是否 拥有新建项目权限
    public Integer hasRightsForCreateProject(int userId);
}
