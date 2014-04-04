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
}
