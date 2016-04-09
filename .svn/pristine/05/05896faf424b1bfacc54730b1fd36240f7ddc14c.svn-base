package com.guanglumedia.api.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.api.service.ExtboothRestService;
import com.guanglumedia.api.service.MorespecialRestService;
import com.guanglumedia.rest.BaseController;

@Controller
@RequestMapping("morespecial")
public class MorespecialController extends BaseController {
    @Autowired
    private MorespecialRestService service;

    @RequestMapping("list")
    @ResponseBody
    public Map<String, Object> list(@RequestBody Map<String, Object> par){
    	Map<String, Object> response = new HashMap<String, Object>();
    	try{
    	    response=service.getMorespecial(par);
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
    	}
        return makeSuccessResponse(response);
    }
}
