package com.springapp.mvc.dao.approval;

import com.springapp.mvc.domain.approval.CommentApproval;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by lion on 14-6-27.
 */
@Repository
public interface CommentApprovalMapper {
    // 插入 审批评论
    public Integer insertCommentApproval(CommentApproval commentApproval);
    // 删除 审批评论
    public Integer deleteCommentApproval(int commentApprovalId);
    // 根据 审批id 得到 审批评论列表
    public List<CommentApproval> selectCommentApprovalListByApprovalId(Map<String, Integer> map);
}
