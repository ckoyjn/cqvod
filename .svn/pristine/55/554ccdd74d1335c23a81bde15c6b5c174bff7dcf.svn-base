package com.guanglumedia.cms.movie.service;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.movie.dao.AssociateDao;
import com.guanglumedia.cms.movie.dao.PreviewDao;
import com.guanglumedia.cms.movie.entity.PreView;

@Service
public class PreviewService {
	@Autowired
	private PreviewDao previewdao;
	@Autowired
	private AssociateDao associateDao;
	
	public PagedModelList<PreView> findAllPreViewList(PreView preView, int pageNo,int pageRow) throws UnsupportedEncodingException {
	    if (preView.getName() != null) {
            String name = new String(preView.getName().getBytes("ISO-8859-1"), "utf-8");
            preView.setName(name);
        }
        if (preView.getDirector()!= null) {
            String director = new String(preView.getDirector().getBytes("ISO-8859-1"), "utf-8");
            preView.setDirector(director);
        }
        if (preView.getActor()!= null) {
            String actor = new String(preView.getActor().getBytes("ISO-8859-1"), "utf-8");
            preView.setActor(actor);
        }
		List<PreView> list = this.previewdao.findPreViewList(preView, new RowBounds((pageNo - 1) * pageRow, pageRow));
		int count=this.previewdao.findCount(preView);
		PagedModelList<PreView> pml = new PagedModelList<PreView>(pageNo, pageRow, count);
		pml.addModels(list);
		return pml;
	}

	public PreView getPreViewById(int id) {
		return previewdao.getPreViewById(id);
	}

	public int UpdatePreView(PreView preView) {
		return previewdao.updatePreView(preView);
	}

	public int AddPreView(PreView  preView) {
		return previewdao.addPreView(preView);
	}

	@Transactional
	public int DelPreView(int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("previewid", id);
		associateDao.delAssociate(map);
		return previewdao.delPreView(id);
	}

	public List<PreView> findAllPreViewList() {
		return previewdao.findAllPreView();
	}

	public int findRank(String rank, String id) {
		return previewdao.findRank(rank,id);
	}

	public int checkMediaID(String mediaID, String id) {
		return previewdao.checkMediaID(mediaID,id);
	}
}
