package com.guanglumedia.cms.special.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.special.dao.SpecialDao;
import com.guanglumedia.cms.special.entity.Special;

@Service
public class SpecialService {
    @Autowired
    private SpecialDao specialDao;
    
    public int addSpecial(Map<String,Object> map) {
        return specialDao.addSpecial(map);
    }
    
    public int delSpecial(int id) {
        return specialDao.delSpecial(id);
    }
    
    public Special getSpecialById(int id){
        return specialDao.getSpecialById(id);
    }
    
    public int updateSpecial(Special special){
        return specialDao.updateSpecial(special);
    }
    /**
     * 专题列表
     * @param pageNo页码
     * @param pageRow每页记录数
     * @return
     */
    public PagedModelList<Special> getSpecialList(int pageNo,int pageRow,Map<String,Object> map){
        List<Special> specialList = specialDao.getSpecialList(new RowBounds((pageNo-1)*pageRow, pageRow),map);
        int count = specialDao.getCount(map);
        PagedModelList<Special> page = new PagedModelList<Special>(pageNo,pageRow,count);
        page.addModels(specialList);
        return page;
    }
    /**
     * 根据专题id查找该专题包含的电影
     * @param id
     * @return
     */
    public List<Map<String,Object>> getMoviesBySpecialId(int id) {
        return specialDao.getMoviesBySpecialId(id);
    }
    /**
     * 根据专题id查找可以被添加的电影列表（已添加的不能再添加到同一专题）
     * @param id
     * @return
     */
    public PagedModelList<Map<String,Object>> getOnlineMoviesBySpecialId(int id,int pageNo,int pageRow) {
        List<Map<String,Object>> list = specialDao.getOnlineMoviesBySpecialId(id,new RowBounds((pageNo-1)*pageRow, pageRow));
        int count = specialDao.getMovieCountBySpecialId(id);
        PagedModelList<Map<String,Object>> page = new PagedModelList<Map<String,Object>>(pageNo,pageRow,count);
        page.addModels(list);
        return page;
    }
    
    public int insertSpecialMovies(int specialid,int [] movieid){
        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
        for(int i=0;i<movieid.length;i++){
            Map<String,Object> map = new HashMap<String, Object>();
            map.put("specialid", specialid);
            map.put("movieid", movieid[i]);
            list.add(map);
        }
        if(list.size()<=0) return 0;
        return specialDao.insertSpecialMovies(list);
    }
    
    public int delSpecialMovieById( int sid,int movieid){
    	Special s=getSpecialById(sid);
    	String[] mids=s.getMovieIDs().split(",");
    	for (int i=0;i<mids.length;i++) {
			if(movieid==Integer.parseInt(mids[i])){
				mids[i]=null;
			}
		}
    	StringBuilder movieIds=new StringBuilder();
    	for (int i=0;i<mids.length;i++) {
    		if(!mids[i].isEmpty()){
	    		movieIds.append(mids[i]);
		    		if(i!=mids.length-1){
		    			movieIds.append(",");
		    		}
    		}
		}
    	System.out.println(movieIds);
        return specialDao.delSpecialMovie(sid+"",movieIds.toString());
    }

    public List<Map<String, Object>> getAllMovies() {
        return specialDao.getAllMovies();
    }

	public int HasSpecialName(String specialName, String id) {
		return specialDao.HasSpecialName(specialName,id);
	}

	public int delSpecialMovie(int id) {
		List<Special> specialList=new ArrayList<Special>();
		StringBuilder movieIds;
		try {
			boolean b = false;
			for (Special special : specialDao.findSpecial()) {
				System.out.println(special.getMovieIDs());
				//包含影片Id则返回true
				if(special.getMovieIDs().contains(id+"")){
					specialList.add(special);
					b=true;
				}
			}
			if(!b){
				return 0;
			}
			
				for (Special s : specialList) {
					movieIds=new StringBuilder();
					String[] mids=s.getMovieIDs().split(",");
					if(mids.length==1){
						//如果长度等于1 就直接删除表中专题数据
						return specialDao.delSpecial(Integer.parseInt(s.getId()));
					}
					for (int i=0;i<mids.length;i++) {
						if(id==Integer.parseInt(mids[i])){
							mids[i]=null;
						}
					}
					for (int i=0;i<mids.length;i++) {
						if(mids[i]!=null){
				    		movieIds.append(mids[i]);
					    		if(i!=mids.length-1){
					    			movieIds.append(",");
					    		}
						}
					}
					System.out.println(movieIds);
					specialDao.upSpecialMovie(s.getId(),movieIds.toString());
			}
			return 1;
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return 0;
		}
	}
}
