package com.guanglumedia.cms.favorite.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.favorite.entity.CMSFavorite;

@Repository
public interface CMSFavoriteDao {
    
    List<CMSFavorite> getFavoriteList(CMSFavorite favorite,RowBounds rowBounds);
    int getFavoriteListCount(CMSFavorite favorite);
}
