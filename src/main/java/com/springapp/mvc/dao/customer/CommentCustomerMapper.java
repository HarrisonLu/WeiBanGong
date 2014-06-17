package com.springapp.mvc.dao.customer;

import com.springapp.mvc.domain.customer.CommentCustomer;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Lion on 14-3-6.
 */
@Repository
public interface CommentCustomerMapper {

    // 插入 客户评论
    public Integer insertCommentCustomer(CommentCustomer commentCustomer);

    // 根据 客户id 找 评论列表
    public List<CommentCustomer> selectCommentCustomerListByCustomerId(Map<String, Integer> map);
}
