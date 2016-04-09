package com.guanglumedia.cms.movie.service;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.api.dao.RecommendDao;
import com.guanglumedia.api.utils.DateUtil;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.movie.dao.AssociateDao;
import com.guanglumedia.cms.movie.dao.MovieDao;
import com.guanglumedia.cms.movie.entity.Movie;
import com.guanglumedia.cms.special.service.SpecialService;

@Service
public class MovieService {
	@Autowired
	private MovieDao moviedao;
	
	@Autowired
	private RecommendDao recommendDao;
	
	@Autowired
	private SpecialService specialService;
	
	@Autowired
	private PublishService publishService;
	
	@Autowired
	private AssociateDao associateDao;

	public PagedModelList<Movie> findAllMovieList(Movie movie, int pageNo,int pageRow) throws UnsupportedEncodingException {
	   
		List<Movie> list = this.moviedao.findMovieList(movie, new RowBounds((pageNo - 1) * pageRow, pageRow));
		int count=this.moviedao.findCount(movie);
		PagedModelList<Movie> pml = new PagedModelList<Movie>(pageNo, pageRow, count);
		pml.addModels(list);
		return pml;
	}

	public Movie getMovieById(int id) {
		return moviedao.getMovieById(id);
	}

	public int UpdateMovie(Movie movie) {
		return moviedao.updateMovie(movie);
	}

	public int AddMovie(Movie  movie) throws UnsupportedEncodingException {
	   
		return moviedao.addMovie(movie);
	}

	@Transactional
	public int DelMovie(int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("movieid", id);
		if(getMovieById(id).getStatus().equals("1")){			
			if(specialService.delSpecialMovie(id)>0&&recommendDao.delrecommend(id)>0){//&&injectService.DelInjectByMovieId(id)>0){
//				publishService.delPublishByMovieId(id);
				associateDao.delAssociate(map);
				return moviedao.delMovie(id);
			}else{
				return -1;
			}
		}
		return moviedao.delMovie(id);
	}

	public List<Movie> findAllMovieList() {
		return moviedao.findAllMovie();
	}
	
    public String findPrice(String vodID){
        return moviedao.findPrice(vodID);
    }
    
    public int findRank(String rank,String string) {
		return moviedao.findRank(rank,string);
	}

    public int checkMediaID(String mediaID,String id) {
        return moviedao.checkMediaID(mediaID, id);
    }

	public int checkRelation(String id) {
		String now = DateUtil.getCurrentDateTime();
		if(moviedao.findRecommend(id)>0){
			/*首页推荐*/
			return -1;
		}else if(moviedao.findOrder(id,now)>0){
			/*订单*/
			return -2;
		}
		return 0; 
	}

	public List<String> getExistsIdentifies() {
		return this.moviedao.getExistsIdentifies();
	}
	
}
