package com.springapp.mvc.dao.project;

import com.springapp.mvc.domain.project.CommentTask;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by lion on 14-4-20.
 */
@Repository
public interface CommentTaskMapper {

    // 插入 任务评论
    public Integer insertCommentTask(CommentTask commentTask);

    // 根据 任务id 找 任务评论列表
    public List<CommentTask> selectCommentTaskListByTaskId(Map<String, Integer> map);

    // 删除 任务所有评论
    public Integer deleteAllTaskCommentByTaskId(int taskId);
}
