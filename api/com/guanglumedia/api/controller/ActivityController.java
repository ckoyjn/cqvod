package com.guanglumedia.api.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;



import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.api.service.ActivityRestService;
import com.guanglumedia.api.utils.ControllerUtils;
import com.guanglumedia.rest.BaseController;

@Controller
@RequestMapping("activity")
public class ActivityController extends BaseController {
    @Autowired
    private ActivityRestService service;

    @RequestMapping("list")
    @ResponseBody
    public Map<String, Object> list(HttpServletRequest request){
    	Map<String, Object> response = new HashMap<String, Object>();
    	try{
    		JSONObject jsonObject = ControllerUtils.getJSONObj(request);
    		int pageNo = jsonObject.getInt("pageNo");
    		int pageRow = jsonObject.getInt("pageRow");
            response.put("pageBean", service.getAllActivity(pageNo, pageRow));
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
    	}
        return makeSuccessResponse(response);
    }
}
