package com.guanglumedia.api.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guanglumedia.api.dao.MorespecialRestDao;

@Service
public class MorespecialRestService {
    @Autowired
    private MorespecialRestDao dao;
    public Map<String,Object> getMorespecial(Map<String,Object> par) {
        Map<String,Object> list=new HashMap<String, Object>();
        List<Map<String,Object>> specialList=new ArrayList<Map<String,Object>>();
        Map<String,Object> morespecial=dao.getMorespecial(par);
        if(morespecial!=null&&!"".equals(morespecial))
        {
           String[] specialids=morespecial.get("specialids").toString().split(",");
           for(String id:specialids)
           {
               Map<String,Object> special=dao.getSpecial(id);
               if(special!=null&&!"".equals(special))
               {
                   specialList.add(special);
               }
           }
           list.put("list", specialList);
        list.put("identify", morespecial.get("identify"));
        list.put("imgurl", morespecial.get("imgurl"));
        list.put("isRecommend", morespecial.get("isRecommend"));
        }
        return list;
    }

}
