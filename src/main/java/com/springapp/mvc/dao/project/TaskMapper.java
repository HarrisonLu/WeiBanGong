package com.springapp.mvc.dao.project;

import com.springapp.mvc.domain.project.Task;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Lion on 14-3-6.
 */
@Repository
public interface TaskMapper {

    // 根据 任务id 找 任务详细资料
    public Task selectTaskDetailsByTaskId(int taskId);

    // 根据 模块id 找 任务列表
    public List<Task> selectTaskListByModuleId(int moduleId);

    // 根据 成员id 和 模块id 找 任务列表
    public List<Task> getTaskListByUserIdAndModuleId(Map<String, Integer> map);

    // 插入 任务
    public void insertTask(Task task);

    // 更新 任务详细资料
    public void updateTaskDetail(Task task);

    // 判断 是否为 任务创建人
    public Integer isTaskCreater(Map<String, Integer> map);

    // 删除 任务详细资料
    public void deleteTaskDetailByTaskId(int taskId);
}
