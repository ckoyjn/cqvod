package com.guanglumedia.cms.extbooth.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.extbooth.dao.ExtboothDao;
import com.guanglumedia.cms.extbooth.entity.Extbooth;
import com.guanglumedia.cms.morespecial.entity.Morespecial;
import com.guanglumedia.cms.special.entity.Special;

/**
 * 专题扩展的服务类
 * @author caokai
 */
@Service
public class ExtboothService {
	@Autowired
	private ExtboothDao extboothdao;
	
	/**
	 * 查询扩展专题列表
	 * @param pageNo 页码
	 * @param pageRow 每页显示的记录数
	 * @param map 请求的参数集合
	 * @return PagedModelList<Extbooth> 返回扩展专题类型的列表
	 */
	public PagedModelList<Extbooth> findExtboothList(int pageNo,int pageRow,Map<String,Object> map){
        List<Extbooth> extboothList = extboothdao.findExtboothList(new RowBounds((pageNo-1)*pageRow, pageRow),map);
        int count = extboothdao.findCount(map);
        PagedModelList<Extbooth> page = new PagedModelList<Extbooth>(pageNo,pageRow,count);
        page.addModels(extboothList);
        return page;
    }
	
	public Extbooth getExtboothById(int id) {
		return extboothdao.getExtboothById(id);
	}
	
	public int updateExtbooth(Extbooth extbooth) {
		return extboothdao.updateExtbooth(extbooth);
	}
	
	public int addExtbooth(Extbooth extbooth) {
		return extboothdao.addExtbooth(extbooth);
	}
	
	public int delExtbooth(int id) {
		return extboothdao.delExtbooth(id);
	}
	
	public List<Extbooth> findAllExtboothList() {
		return extboothdao.findAllExtbooth();
	}
}
