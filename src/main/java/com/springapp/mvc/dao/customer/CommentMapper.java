package com.springapp.mvc.dao.customer;

import com.springapp.mvc.domain.customer.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Lion on 14-3-6.
 */
@Repository
public interface CommentMapper {

    // 插入 评论
    public void insertComment(Comment comment);

}
