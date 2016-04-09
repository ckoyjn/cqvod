package com.guanglumedia.cms.order.service;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.api.utils.DateUtil;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.movie.dao.ProductDao;
import com.guanglumedia.cms.movie.entity.Product;
import com.guanglumedia.cms.order.dao.OrderDao;
import com.guanglumedia.cms.order.entity.Order;
import com.guanglumedia.cms.order.entity.PurRelation;
import com.guanglumedia.common.util.StringUtils;

@Service
public class OrderService {
    @Autowired
    private OrderDao orderDao;
    @Autowired
    private ProductDao productDao;
    @Transactional
    public PagedModelList<Map<String, Object>> findOrderList(Order order, int pageNo, int pageRow) throws UnsupportedEncodingException {
        if(order.getUserId()!=null)
        {
            order.setUserId(order.getUserId().trim());
        }
        List<Map<String, Object>> list = this.orderDao.findOrderList(order, new RowBounds((pageNo - 1) * pageRow, pageRow));
        int count = this.orderDao.findCount();
        PagedModelList<Map<String, Object>> pml = new PagedModelList<Map<String, Object>>(pageNo, pageRow, count);
        pml.addModels(list);
        return pml;
    }

    public List<Map<String, Object>> findAllProductId() {
        return orderDao.findAllProductId();
    }

    public List<Map<String, Object>> findAllMediaId() {
        return orderDao.findAllMediaId();
    }
    
    public int addOrder(Order order)
    {
        Product product = productDao.getProductById(Integer.parseInt(order.getProductId()));
        order.setPrice(product.getPrice());
        return orderDao.addOrder(order);
    }
    
    public List<Map<String,Object>> exportOrder(Order order)
    {
        return orderDao.exportOrder( order);
    }
    
    @Transactional
    public Map<String, Object> exportPurRelation(PurRelation purRelation) throws UnsupportedEncodingException {
        if(StringUtils.isEmpty(purRelation.getStarttime())||StringUtils.isEmpty(purRelation.getEndtime())){
            purRelation.setEndtime(DateUtil.getCurrentDate());
            purRelation.setStarttime(DateUtil.getCurrentStringDatePreweek());
        }
        Map<String, Object> map1 = this.orderDao.findTotalPay(purRelation);
        Map<String, Object> map2 = this.orderDao.findTotalSum(purRelation);
        Map<String, Object> map3 = this.orderDao.findFreeTotal(purRelation);//免费总数
        Map<String, Object> map4 = this.orderDao.findNotFreeTotal(purRelation);//付费总数
        List<Map<String, Object>> list = this.orderDao.findPurRelationList(purRelation);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pml", list);
        map.put("sum1", map1.get("totalpay"));
        map.put("sum2", map2.get("totalsum"));
        map.put("sum3", map3.get("totalpay"));
        map.put("sum4", map4.get("totalpay"));
        return map;
    }
    
    @Transactional
    public Map<String, Object> findPurRelationList(PurRelation purRelation, int pageNo, int pageRow) throws UnsupportedEncodingException {
        if(StringUtils.isEmpty(purRelation.getStarttime())||StringUtils.isEmpty(purRelation.getEndtime())){
            purRelation.setEndtime(DateUtil.getCurrentDate());
            purRelation.setStarttime(DateUtil.getCurrentStringDatePreweek());
        }
        Map<String, Object> map1 = this.orderDao.findTotalPay(purRelation);
        Map<String, Object> map2 = this.orderDao.findTotalSum(purRelation);
        Map<String, Object> map3 = this.orderDao.findFreeTotal(purRelation);//免费总数
        Map<String, Object> map4 = this.orderDao.findNotFreeTotal(purRelation);//付费总数
        List<Map<String, Object>> list = this.orderDao.findPurRelationList(purRelation, new RowBounds((pageNo - 1) * pageRow, pageRow));
        int count = this.orderDao.findCount();
        PagedModelList<Map<String, Object>> pml = new PagedModelList<Map<String, Object>>(pageNo, pageRow, count);
        pml.addModels(list);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pml", pml);
        map.put("sum1", map1.get("totalpay"));
        map.put("sum2", map2.get("totalsum"));
        map.put("sum3", map3.get("totalpay"));
        map.put("sum4", map4.get("totalpay"));
        return map;
    }
    
    public PagedModelList<Map<String, Object>> findPurRelationDetail(PurRelation purRelation, int pageNo, int pageRow) throws UnsupportedEncodingException {
        if(purRelation!=null && purRelation.getFilmName()!=null){
            purRelation.setFilmName(new String(purRelation.getFilmName().getBytes("ISO-8859-1"), "utf-8"));
        }
        List<Map<String, Object>> list = this.orderDao.findPurRelationDetail(purRelation, new RowBounds((pageNo - 1) * pageRow, pageRow));
        int count = this.orderDao.findCount();
        PagedModelList<Map<String, Object>> pml = new PagedModelList<Map<String, Object>>(pageNo, pageRow, count);
        pml.addModels(list);
        return pml;
    }
}
