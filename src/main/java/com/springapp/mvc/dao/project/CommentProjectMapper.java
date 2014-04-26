package com.springapp.mvc.dao.project;

import com.springapp.mvc.domain.project.CommentProject;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lion on 14-4-20.
 */
@Repository
public interface CommentProjectMapper {

    // 插入 项目评论
    public void insertProjectComment(CommentProject commentProject);

    // 根据 项目id 找 项目评论列表
    public List<CommentProject> selectProjectCommentListByProjectId(int projectId);

    // 删除 项目所有评论
    public void deleteAllProjectCommentByProjectId(int projectId);
}
