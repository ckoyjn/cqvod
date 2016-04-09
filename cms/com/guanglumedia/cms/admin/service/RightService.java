package com.guanglumedia.cms.admin.service;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.cms.admin.dao.RightDao;
import com.guanglumedia.cms.admin.entity.Right;
import com.guanglumedia.cms.common.PagedModelList;

@Service
public class RightService {
	@Autowired
	private RightDao rightdao;
	@Transactional
	public PagedModelList<Right> findAllRightList(Right right, int pageNo,int pageRow) throws UnsupportedEncodingException {
	    if (right.getRightName() != null) {
            String rightName = new String(right.getRightName().getBytes("ISO-8859-1"), "utf-8");
            right.setRightName(rightName);
        }
	    if (right.getRightAction() != null) {
            String rightAction = new String(right.getRightAction().getBytes("ISO-8859-1"), "utf-8");
            right.setRightAction(rightAction);
        }
		List<Right> list = this.rightdao.findRightList(right, new RowBounds((pageNo - 1) * pageRow, pageRow));
		int count=this.rightdao.findCount();
		PagedModelList<Right> pml = new PagedModelList<Right>(pageNo, pageRow, count);
		pml.addModels(list);
		return pml;
	}
	public Right getRightById(int id) {
		return rightdao.getRightById(id);
	}
	public int UpdateRight(Right right) {
		return rightdao.updateRight(right);
	}
	public int AddRight(Right right) {
		return rightdao.addRight(right);
	}
	public int DelRight(int id) {
		return rightdao.delRight(id);
	}
	public Set<Integer> findAllRightByRoleId(int id) {
		return rightdao.findAllRgihtByRoleId(id);
	}
	public List<Right> findRightList() {
		return rightdao.findAllRightList();
	}
	public int hasRightName(String rightName, int id) {
		return rightdao.hasRightName(rightName, id);
	}

}
