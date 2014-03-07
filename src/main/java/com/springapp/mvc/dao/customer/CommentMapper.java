package com.springapp.mvc.dao.customer;

import com.springapp.mvc.domain.customer.Comment;

import java.util.List;

/**
 * Created by Lion on 14-3-6.
 */
public interface CommentMapper {

    // 插入 评论
    public void insertComment(Comment comment);


}
