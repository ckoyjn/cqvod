package com.guanglumedia.cms.bosslog.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.guanglumedia.cms.bosslog.entity.Bosslog;

public interface BosslogDao {

	/**
     * 分页查询对账数据列表
     * @param rowBounds
     * @return
     */
    List<Bosslog> getBosslogList(Bosslog bl,RowBounds rowBounds);
    int getBosslogCount();
    
    /**
     * 总金额
     * @return
     */
    Map<String,Object> getCount(Bosslog bl);
//    int getAmountCount();
}
