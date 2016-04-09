package com.guanglumedia.api.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.api.service.RecommendService;
import com.guanglumedia.rest.BaseController;

@Controller
@RequestMapping("recommend")
public class RecommendController extends BaseController{
	
	@Autowired
	private RecommendService service;
	
	@RequestMapping("list")
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest request){
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			//将service的结果存在响应对象中
			response.put("list", service.findRecommend());
		} catch (Exception e) {
			logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
		}
		return makeSuccessResponse(response);
	}
	
	@RequestMapping("subject")
	@ResponseBody
	public Map<String, Object> subject(HttpServletRequest request){
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			response.put("subject", service.findRecommendSubject());
		} catch (Exception e) {
			logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
		}
		return makeSuccessResponse(response);
	}
	
	@RequestMapping("activity")
	@ResponseBody
	public Map<String, Object> activity(HttpServletRequest request){
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			//将service的结果存在响应对象中
			response.put("activity", service.findActivity());
		} catch (Exception e) {
			logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
		}
		return makeSuccessResponse(response);
	}
}
