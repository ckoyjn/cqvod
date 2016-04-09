package com.guanglumedia.cms.movie.service;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.movie.dao.PublishDao;
import com.guanglumedia.cms.movie.entity.Publish;

@Service
public class PublishService {
	@Autowired
	private PublishDao Publishdao;

	@Transactional
	public PagedModelList<Publish> findAllPublishList(Publish publish, int pageNo,int pageRow) throws UnsupportedEncodingException {
	  /*  if (publish.getVideoname() != null) {
            String videoname = new String(publish.getVideoname().getBytes("ISO-8859-1"), "utf-8");
            publish.setVideoname(videoname);
        }
        if (publish.getUrl() != null) {
            String url = new String(publish.getUrl().getBytes("ISO-8859-1"), "utf-8");
            publish.setUrl(url);
        }*/
	    if(!StringUtils.isEmpty(publish.getVideoname())){
	        publish.setVideoname(new String(publish.getVideoname().getBytes("ISO-8859-1"), "UTF-8"));
	    }
	    if(!StringUtils.isEmpty(publish.getUrl())){
	        publish.setUrl(new String(publish.getUrl().getBytes("ISO-8859-1"), "UTF-8"));
	    }
		List<Publish> list = this.Publishdao.findPublishList(publish, new RowBounds((pageNo - 1) * pageRow, pageRow));
		int count=this.Publishdao.findCount(publish);
		PagedModelList<Publish> pml = new PagedModelList<Publish>(pageNo, pageRow, count);
		pml.addModels(list);
		return pml;
	}

	public Publish getPublishById(int id) {
		return Publishdao.getPublishById(id);
	}

	public int delPublishByMovieId(int id) {
		return Publishdao.delPublishByMovieId(id);	
	}
}
