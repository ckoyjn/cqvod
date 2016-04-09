package com.guanglumedia.api.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.api.service.ActsrecommandRestService;
import com.guanglumedia.rest.BaseController;

@Controller
@RequestMapping("actsrecommand")
public class ActsrecommandController extends BaseController {
    @Autowired
    private ActsrecommandRestService service;

    @RequestMapping("list")
    @ResponseBody
    public Map<String, Object> list(HttpServletRequest request){
    	Map<String, Object> response = new HashMap<String, Object>();
    	Map<String,Object> pageBean=new HashMap<String, Object>();
    	try{
    	    pageBean.put("recordList", service.getAllActsrecommand());
    	    pageBean.put("totalCount", service.findCount());
    	    response.put("pageBean", pageBean);
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
    	}
        return makeSuccessResponse(response);
    }
}
