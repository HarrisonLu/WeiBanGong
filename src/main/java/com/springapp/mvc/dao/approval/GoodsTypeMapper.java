package com.springapp.mvc.dao.approval;

import com.springapp.mvc.domain.approval.GoodsType;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lion on 14-6-27.
 */
@Repository
public interface GoodsTypeMapper {
    // 得到所有物品类型
    public List<GoodsType> getAllGoodsType();

    // 根据 物品类型id 找 物品类型
    public GoodsType selectGoodsTypeByGoodsTypeId(int goodsTypeId);
}
