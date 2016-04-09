package com.guanglumedia.api.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;

import com.guanglumedia.api.service.SubjectService;
import com.guanglumedia.api.utils.ControllerUtils;
import com.guanglumedia.rest.BaseController;

@Controller
@RequestMapping("subject")
public class SubjectController extends BaseController {

	@Autowired
	private SubjectService service;
	
	@RequestMapping("movie")
	@ResponseBody
	public Map<String,Object> movie(HttpServletRequest request){
		Map<String, Object> response=new HashMap<String,Object>();
		try {
			JSONObject jsonObject=ControllerUtils.getJSONObj(request);
			response = service.findMovieBySubject(jsonObject);
		} catch (Exception e) {
			logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
		}
		return makeSuccessResponse(response);
	}
	
	@RequestMapping("getallsubject")
	@ResponseBody
	public Map<String,Object> getallsubject(HttpServletRequest request){
		Map<String, Object> response=new HashMap<String,Object>();
		try {
			response = service.findAllSubject();
		} catch (Exception e) {
			logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
		}
		return makeSuccessResponse(response);
	}
}
