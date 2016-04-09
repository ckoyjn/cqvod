package com.guanglumedia.api.utils;

import java.util.HashMap;
import java.util.Map;

import com.guanglumedia.cms.common.PagedModelList;


public class FormatPageBeanUtils {
	public static Map<String,Object> format(PagedModelList<?> obj){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pageId", obj.getPageId());
		map.put("pageSize", obj.getPageSize());
		map.put("pageCount", obj.getPageCount());
		map.put("totalCount", obj.getTotalCount());
		map.put("recordList", obj.getPagedModelList());
		return map;
	}
}
