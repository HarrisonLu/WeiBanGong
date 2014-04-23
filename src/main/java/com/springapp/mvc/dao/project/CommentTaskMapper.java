package com.springapp.mvc.dao.project;

import com.springapp.mvc.domain.project.CommentTask;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lion on 14-4-20.
 */
@Repository
public interface CommentTaskMapper {

    // 插入 任务评论
    public void insertCommentTask(CommentTask commentTask);

    // 根据 任务id 找 任务评论列表
    public List<CommentTask> selectCommentTaskListByTaskId(int taskId);

    // 删除 任务所有评论
    public void deleteAllTaskCommentByTaskId(int taskId);
}