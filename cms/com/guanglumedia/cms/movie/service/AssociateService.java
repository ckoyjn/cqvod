package com.guanglumedia.cms.movie.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.movie.dao.AssociateDao;
import com.guanglumedia.cms.movie.entity.Associate;
import com.guanglumedia.cms.movie.entity.Movie;
import com.guanglumedia.cms.movie.entity.PreView;

@Service
public class AssociateService {
	
	@Autowired
	private AssociateDao associateDao;

	public PagedModelList<Associate> findAllAssociateList(Associate associate,int pageNo, int pageRow) {
		List<Associate> associates = associateDao.findAssociateList(associate,new RowBounds((pageNo-1)*pageRow, pageRow));
		int totalCount = associateDao.findCount(associate);
		PagedModelList<Associate> pml = new PagedModelList<Associate>(pageNo, pageRow, totalCount);
		pml.addModels(associates);
		return pml;
	}

	public Associate getAssociateById(int movieid, int previewid) {
		return associateDao.getAssociateById(movieid,previewid);
	}

	public List<Movie> findAllMovieList() {
		return associateDao.findAllMovieList();
	}

	public List<PreView> findAllPreViewList() {
		return associateDao.findAllPreViewList();
	}

	public int addAssociate(Associate associate) {
		return associateDao.addAssociate(associate);
	}

	public int updateAssociate(Map<String, Object> map) {
		return associateDao.updateAssociate(map);
	}

	public int delAssociate(Map<String, Object> map) {
		return associateDao.delAssociate(map);
	}


}
