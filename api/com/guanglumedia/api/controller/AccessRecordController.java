package com.guanglumedia.api.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.api.service.AccessRecordService;
import com.guanglumedia.api.utils.ControllerUtils;
import com.guanglumedia.rest.BaseController;

@Controller
@RequestMapping("AccessRecord")
public class AccessRecordController extends BaseController{
	@Autowired
	AccessRecordService service;
	
	@RequestMapping("add")
	@ResponseBody
	public Map<String, Object> add(HttpServletRequest request){
		Map<String, Object> response = new HashMap<String, Object>();
    	try{
    		JSONObject jsonObject=ControllerUtils.getJSONObj(request);
    		if(!service.add(jsonObject)){
    			logger.error("新增用户操作记录出错"+jsonObject.toString());
    			return makeFailedResponse("新增用户操作记录出错", response);
    		}
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
    	}
        return makeSuccessResponse(response);
	}
}
