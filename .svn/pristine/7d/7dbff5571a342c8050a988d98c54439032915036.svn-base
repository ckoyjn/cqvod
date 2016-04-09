package com.guanglumedia.cms.watchrecode.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.watchrecode.entity.CMSWatchRecode;
import com.guanglumedia.cms.watchrecode.dao.CMSWatchRecodeDao;
@Service
public class CMSWatchRecodeService {
    @Autowired
    private CMSWatchRecodeDao cMSWatchRecodeDao;
    public PagedModelList<CMSWatchRecode> getCMSWatchRecodeList(int pageNo,int pageRow,CMSWatchRecode cmsWatchRecode){
        List<CMSWatchRecode> list = cMSWatchRecodeDao.getCMSWatchRecodeList(cmsWatchRecode, new RowBounds((pageNo-1)*pageRow, pageRow));
        int count = cMSWatchRecodeDao.getCMSWatchRecodeListCount(cmsWatchRecode);
        PagedModelList<CMSWatchRecode> page = new PagedModelList<CMSWatchRecode>(pageNo, pageRow, count);
        page.addModels(list);
        return page;
    }
}
