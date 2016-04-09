package com.guanglumedia.cms.actsrecommend.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guanglumedia.cms.actsrecommend.dao.ActsrecommendDao;
import com.guanglumedia.cms.actsrecommend.entity.Actsrecommend;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.special.entity.Special;

/**
 * 活动推荐的服务类
 * @author caokai
 */
@Service
public class ActsrecommendService {
	@Autowired
	private ActsrecommendDao actsrecommenddao;
	
	public PagedModelList<Actsrecommend> findActsrecommendList(int pageNo,int pageRow,Map<String,Object> map){
        List<Actsrecommend> actsrecommendList = actsrecommenddao.findActsrecommendList(new RowBounds((pageNo-1)*pageRow, pageRow),map);
        int count = actsrecommenddao.findCount(map);
        PagedModelList<Actsrecommend> page = new PagedModelList<Actsrecommend>(pageNo,pageRow,count);
        page.addModels(actsrecommendList);
        return page;
    }
	
	public Actsrecommend getActsrecommendById(int id) {
		return actsrecommenddao.getActsrecommendById(id);
	}
	
	public int updateActsrecommend(Actsrecommend Actsrecommend) {
		return actsrecommenddao.updateActsrecommend(Actsrecommend);
	}
	
	public int addActsrecommend(Actsrecommend Actsrecommend) {
		return actsrecommenddao.addActsrecommend(Actsrecommend);
	}
	
	public int delActsrecommend(int id) {
		return actsrecommenddao.delActsrecommend(id);
	}
	
	public List<Actsrecommend> findAllActsrecommendList() {
		return actsrecommenddao.findAllActsrecommend();
	}
}
