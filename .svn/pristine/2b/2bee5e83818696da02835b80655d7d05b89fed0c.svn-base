package com.guanglumedia.cms.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.order.entity.Order;
import com.guanglumedia.cms.order.entity.PurRelation;

@Repository
public interface OrderDao {
    public List<Map<String, Object>> findOrderList(Order order, RowBounds rowBounds);

    public int findCount();

    public List<Map<String, Object>> findAllProductId();

    public List<Map<String, Object>> findAllMediaId();
    
    public int addOrder(Order order);
    
    public List<Map<String,Object>> exportOrder(Order order);
    
    public List<Map<String,Object>> findPurRelationList(PurRelation purRelation);
    
    public Map<String, Object> findTotalPay(PurRelation purRelation);
    
    public Map<String, Object> findTotalSum(PurRelation purRelation);

    public List<Map<String, Object>> findPurRelationList(PurRelation purRelation, RowBounds rowBounds);

    public List<Map<String, Object>> findPurRelationDetail(PurRelation purRelation, RowBounds rowBounds);

	public Map<String, Object> findFreeTotal(PurRelation purRelation);

	public Map<String, Object> findNotFreeTotal(PurRelation purRelation);
    
}
