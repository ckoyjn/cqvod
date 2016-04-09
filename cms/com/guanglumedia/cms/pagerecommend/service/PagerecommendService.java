package com.guanglumedia.cms.pagerecommend.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.pagerecommend.dao.PagerecommendDao;
import com.guanglumedia.cms.pagerecommend.entity.Pagerecommend;
import com.guanglumedia.cms.special.entity.Special;
/**
 * 首页广告推荐服务类
 * @author caokai
 */
@Service
public class PagerecommendService {
	@Autowired
	private PagerecommendDao pagerecommenddao;
	
//	public PagedModelList<Pagerecommend> findAllPagerecommendList(Pagerecommend pagerecommend, int pageNo,int pageRow) throws UnsupportedEncodingException {
//	    if (pagerecommend.getTitle() != null) {
//            String title = new String(pagerecommend.getTitle().getBytes("ISO-8859-1"), "utf-8");
//            pagerecommend.setTitle(title);
//        }
//        if (pagerecommend.getType()!= null) {
//            String type = new String(pagerecommend.getType().getBytes("ISO-8859-1"), "utf-8");
//            pagerecommend.setType(type);
//        }
//		List<Pagerecommend>           list  = this.pagerecommenddao.findPagerecommendList(pagerecommend, new RowBounds((pageNo - 1) * pageRow, pageRow));
//		int                           count = this.pagerecommenddao.findCount(pagerecommend);
//		PagedModelList<Pagerecommend> pml   = new PagedModelList<Pagerecommend>(pageNo, pageRow, count);
//		pml.addModels(list);
//		return pml;
//	}
	
	public PagedModelList<Pagerecommend> findPagerecommendList(int pageNo,int pageRow,Map<String,Object> map){
        List<Pagerecommend> pagerecommendList = pagerecommenddao.findPagerecommendList(new RowBounds((pageNo-1)*pageRow, pageRow),map);
        int count = pagerecommenddao.findCount(map);
        PagedModelList<Pagerecommend> page = new PagedModelList<Pagerecommend>(pageNo,pageRow,count);
        page.addModels(pagerecommendList);
        return page;
    }
	
	public Pagerecommend getPagerecommendById(int id) {
		return pagerecommenddao.getPagerecommendById(id);
	}
	
	public int updatePagerecommend(Pagerecommend pagerecommend) {
		return pagerecommenddao.updatePagerecommend(pagerecommend);
	}
	
	public int addPagerecommend(Pagerecommend pagerecommend) {
		return pagerecommenddao.addPagerecommend(pagerecommend);
	}
	
	public int delPagerecommend(int id) {
		return pagerecommenddao.delPagerecommend(id);
	}
}
