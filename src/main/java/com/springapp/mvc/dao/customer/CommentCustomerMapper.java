package com.springapp.mvc.dao.customer;

import com.springapp.mvc.domain.customer.CommentCustomer;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Lion on 14-3-6.
 */
@Repository
public interface CommentCustomerMapper {

    // 插入 评论
    public void insertCommentCustomer(CommentCustomer commentCustomer);

    // 根据 客户id 找 评论列表
    public List<CommentCustomer> selectCommentCustomerListByCustomerId(int customerId);
}
