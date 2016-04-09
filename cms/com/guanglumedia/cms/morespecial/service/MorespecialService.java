package com.guanglumedia.cms.morespecial.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.morespecial.dao.MorespecialDao;
import com.guanglumedia.cms.morespecial.entity.Morespecial;

/**
 * 更多专题的服务类
 * @author caokai
 */
@Service
public class MorespecialService {
	@Autowired
	private MorespecialDao morespecialdao;
	
	public PagedModelList<Morespecial> findAllMorespecialList(int pageNo,int pageRow,Map<String,Object> map)  {
		List<Morespecial> specialList = morespecialdao.getMorespecialList(new RowBounds((pageNo-1)*pageRow, pageRow),map);
        int count = morespecialdao.findCount(map);
        PagedModelList<Morespecial> page = new PagedModelList<Morespecial>(pageNo,pageRow,count);
        page.addModels(specialList);
        return page;
	}
	
	public Morespecial getMorespecialById(int id) {
		return morespecialdao.getMorespecialById(id);
	}
	
	public int updateMorespecial(Morespecial morespecial) {
		return morespecialdao.updateMorespecial(morespecial);
	}
	
	public int addMorespecial(Morespecial morespecial) {
		return morespecialdao.addMorespecial(morespecial);
	}
	
	public int delMorespecial(int id) {
		return morespecialdao.delMorespecial(id);
	}
	
	public List<Morespecial> findAllMorespecialList() {
		return morespecialdao.findAllMorespecial();
	}
}
