package com.guanglumedia.cms.watchrecode.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.watchrecode.entity.CMSWatchRecode;
@Repository
public interface CMSWatchRecodeDao {

    List<CMSWatchRecode> getCMSWatchRecodeList(CMSWatchRecode cmsWatchRecode,RowBounds rowBounds);
    
    int getCMSWatchRecodeListCount(CMSWatchRecode cmsWatchRecode);
}
