package com.springapp.mvc.dao.customer;

import com.springapp.mvc.domain.customer.CommentCustomer;
import org.springframework.stereotype.Repository;

/**
 * Created by Lion on 14-3-6.
 */
@Repository
public interface CommentCustomerMapper {

    // 插入 评论
    public void insertCommentCustomer(CommentCustomer commentCustomer);

}
