package com.guanglumedia.cms.special.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.special.entity.Special;
@Repository
public interface SpecialDao {
    /**
     * 添加专题
     * @param special
     * @return
     */
    int addSpecial(Map<String,Object> map);
    /**
     * 删除专题by id
     * @param id
     * @return
     */
    int delSpecial(@Param("id")int  id);
    /**
     * 根据专题id删除相应的special_movie记录
     * @param id
     * @return
     */
    int delSpecialMovie(@Param("id")String id,@Param("movieIDs")String movieIDs);
    /**
     * 获取专题信息
     * @param id
     * @return
     */
    Special getSpecialById(int id);
    /**
     * 更新专题信息
     * @param special
     * @return
     */
    int updateSpecial(Special special);
    int getCount(Map<String,Object> map);
    /**
     * 分页获取专题列表
     * @param rowBounds
     * @return
     */
    List<Special> getSpecialList(RowBounds rowBounds,Map<String,Object> map);
    /**
     * 根据specialid获取对应影片列表
     * @param id
     * @return
     */
    List<Map<String,Object>> getMoviesBySpecialId(int id);
    /**
     * 获取上线的节目列表且不包含当前专题中已经有的节目
     * @param id
     * @return
     */
    List<Map<String,Object>> getOnlineMoviesBySpecialId(int id,RowBounds rowBounds);
    int getMovieCountBySpecialId(int id);
    /**
     * 新增专题节目
     * @param list
     * @return
     */
    int insertSpecialMovies(List<Map<String,Object>> list);
    /**
     * 根据专题id和影片id删除
     * @param string
     * @param movieids
     * @return
     */
    int upSpecialMovie(@Param("id")String string,@Param("movieIDs")String movieids);
    /**
     * 获取所有上线的影片
     * @return
     */
    
    List<Map<String, Object>> getAllMovies();
    
	int HasSpecialName(@Param("specialName")String specialName, @Param("id")String id);
	
	List<Special> findSpecial();
}
