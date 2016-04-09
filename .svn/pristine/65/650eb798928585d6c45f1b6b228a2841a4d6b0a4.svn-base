package com.guanglumedia.api.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.api.service.FavoriteRestService;
import com.guanglumedia.api.utils.ControllerUtils;
import com.guanglumedia.rest.BaseController;

@Controller
@RequestMapping("favorite")
public class FavoriteController extends BaseController {
    @Autowired
    private FavoriteRestService service;

    @RequestMapping("add")
    @ResponseBody
    public Map<String, Object> add(HttpServletRequest request){
    	Map<String, Object> response = new HashMap<String, Object>();
    	try{
    		JSONObject jsonObject = ControllerUtils.getJSONObj(request);
    		if(checkUser(jsonObject)){
    			if(service.addFavorite(jsonObject)){
                	response.put("result", 0);
                }else{
                	response.put("result", -1);
                }
    		}else{
    			return makeNotLoginResponse(response);
    		}
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
    	}
        return makeSuccessResponse(response);
    }
    
    @RequestMapping("delete")
    @ResponseBody
    public Map<String, Object> delete(HttpServletRequest request){
    	Map<String, Object> response = new HashMap<String, Object>();
    	try{
    		JSONObject jsonObject = ControllerUtils.getJSONObj(request);
    		if(checkUser(jsonObject)){
	            if(service.delFavoriteByIdPid(jsonObject)){
	            	response.put("result", 0);
	            }else{
	            	response.put("result", -1);
	            }
            }else{
            	return makeNotLoginResponse(response);
            }
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
    	}
        return makeSuccessResponse(response);
    }
    
    @RequestMapping("list")
    @ResponseBody
    public Map<String, Object> list(HttpServletRequest request){
    	Map<String, Object> response = new HashMap<String, Object>();
    	try{
    		JSONObject jsonObject = ControllerUtils.getJSONObj(request);
    		int pageNo = jsonObject.getInt("pageNo");
    		int pageRow = jsonObject.getInt("pageRow");
            response.put("pageBean", service.getFavorite(jsonObject, pageNo, pageRow));
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
    	}
        return makeSuccessResponse(response);
    }
}
