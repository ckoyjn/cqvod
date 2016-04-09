package com.guanglumedia.cms.rollingnews.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.cms.category.entity.Category;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.rollingnews.action.RollingnewsAction;
import com.guanglumedia.cms.rollingnews.dao.RollingnewsDao;
import com.guanglumedia.cms.rollingnews.entity.Rollingnews;

/**
 * 滚动信息服务类
 * @author CaoKai
 */
@Service
public class RollingnewsService {
	Logger log = LoggerFactory.getLogger(RollingnewsService.class);//获取日志对象
    @Autowired
    private RollingnewsDao rollingnewsDao;//声明滚动信息数据访问对象
    
    /**
     * 查询滚动信息的列表
     * @param pageNo 页码
     * @param pageRow 每页显示的条数
     * @param map 总记录数
     * @return PagedModelList<Map<String, Object>> 返回类型
     * @throws UnsupportedEncodingException
     */
    @Transactional
    public PagedModelList<Map<String, Object>> findRollnewsList(int pageNo, int pageRow, Map<String, Object> map) throws UnsupportedEncodingException {
    	log.info("RollingnewsService----findRollnewsList-------");
    	for(int i = 0; i < map.size(); i++){
    		log.info("map.size()-------" + map.get(i));
    	}
        List<Map<String, Object>> list = this.rollingnewsDao.findRollingnewsList(new RowBounds((pageNo - 1) * pageRow, pageRow),map);
        int count = this.rollingnewsDao.findCount();
        PagedModelList<Map<String, Object>> pml = new PagedModelList<Map<String, Object>>(pageNo, pageRow, count);
        pml.addModels(list);
        return pml;
    }
     
	public  int addRollingnews(Map<String, Object> map) {
		return rollingnewsDao.addRollingnews(map);
	}
	
	public Rollingnews getRollingnewsById(int id){
        return rollingnewsDao.getRollingnewsById(id);
    }
	
	
	public int updateRollingnews(Rollingnews rollingnews){
        return rollingnewsDao.updateRollingnews(rollingnews);
    }
	
	public int delRollingnews(int id) {
        return rollingnewsDao.delRollingnews(id);
    }
}
