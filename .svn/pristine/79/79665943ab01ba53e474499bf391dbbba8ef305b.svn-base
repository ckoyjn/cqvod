package com.guanglumedia.cms.morespecial.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

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
	
	public PagedModelList<Morespecial> findAllMorespecialList(Morespecial morespecial, int pageNo,int pageRow) throws UnsupportedEncodingException {
	    if (morespecial.getSpecialNames() != null) {
            String specialNames = new String(morespecial.getSpecialNames().getBytes("ISO-8859-1"), "utf-8");
            morespecial.setSpecialNames(specialNames);
        }
		List<Morespecial>            list  = this.morespecialdao.findMorespecialList(morespecial, new RowBounds((pageNo - 1) * pageRow, pageRow));
		int                          count = this.morespecialdao.findCount(morespecial);
		PagedModelList<Morespecial>  pml   = new PagedModelList<Morespecial>(pageNo, pageRow, count);
		pml.addModels(list);
		return pml;
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
