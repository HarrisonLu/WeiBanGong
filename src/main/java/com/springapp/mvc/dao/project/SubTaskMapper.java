package com.springapp.mvc.dao.project;

import com.springapp.mvc.domain.project.SubTask;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lion on 14-4-20.
 */
@Repository
public interface SubTaskMapper {

    // 插入 拆分任务
    public void insertSubTask(SubTask subTask);

    // 删除 拆分任务
    public void deleteSubTask(int subTaskId);

    // 更新 拆分任务 开启状态
    public void updateSubTaskState(SubTask subTask);

    // 删除 任务所有拆分任务
    public void deleteAllSubTaskByTaskId(int taskId);

    // 根据 拆分任务id 找 拆分任务
    public SubTask selectSubTaskBySubTaskId(int subTaskId);

    // 根据 任务id 找 拆分任务 列表
    public List<SubTask> selectSubTaskListByTaskId(int taskId);
}
