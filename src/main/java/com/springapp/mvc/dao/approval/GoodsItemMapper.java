package com.springapp.mvc.dao.approval;

import com.springapp.mvc.domain.approval.GoodsItem;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by lion on 14-6-27.
 */
@Repository
public interface GoodsItemMapper {
    // 插入 物品清单
    public Integer insertGoodsItem(GoodsItem goodsItem);

    // 删除 物品清单
    public Integer deleteGoodsItem(int goodsItemId);

    // 根据 审批id 删除 所有物品清单
    public Integer deleteAllGoodsItemByApprovalId(int approvalId);

    // 根据 审批id 找 物品清单列表
    public List<GoodsItem> selectGoodsItemByApprovalId(Map<String, Integer> map);
}
