package com.guanglumedia.api.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.api.service.MovieRestService;
import com.guanglumedia.api.utils.ControllerUtils;
import com.guanglumedia.rest.BaseController;

@Controller
@RequestMapping("movie")
public class MovieController extends BaseController {
    @Autowired
    private MovieRestService service;

    @RequestMapping("detail")
    @ResponseBody
    public void detail(HttpServletRequest request,HttpServletResponse response){
    	JSONObject resp = new JSONObject();
    	PrintWriter out = null;
    	try{
    		JSONObject jsonObject=ControllerUtils.getJSONObj(request);
    		resp = service.getMovieDetail(jsonObject); 
    		resp.put("errCode", 0);
    		resp.put("msg", "请求成功");
    		response.setCharacterEncoding("gbk"); //设置编码格式  
    		response.setContentType("application/json");   //设置数据格式 
    		out = response.getWriter(); //获取写入对象
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		resp.put("errCode", -1);
    		resp.put("msg", "系统错误");
    	}finally{
    		out.print(resp.toString()); //将json数据写入流中  
    		out.flush();  
    	}
    }
    
    @RequestMapping("preview")
    @ResponseBody
    public void preview(HttpServletRequest request, HttpServletResponse response){
    	JSONObject resp = new JSONObject();
    	PrintWriter out = null;
    	try{
    		resp.put("list", service.getPreviews());
    		resp.put("errCode", 0);
    		resp.put("msg", "请求成功");
    		response.setCharacterEncoding("gbk"); //设置编码格式  
    		response.setContentType("application/json");   //设置数据格式 
    		out = response.getWriter(); //获取写入对象
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		resp.put("errCode", -1);
    		resp.put("msg", "系统错误");
    	}finally{
    		out.print(resp.toString()); //将json数据写入流中  
    		out.flush();  
    	}
    }
    
	@RequestMapping("sameCategory")
	@ResponseBody
	public Map<String,Object> sameCategory(HttpServletRequest request){
		Map<String,Object> response =new HashMap<String,Object>();
		try {
			JSONObject jsonObject=ControllerUtils.getJSONObj(request);
			int num =jsonObject.getInt("num");
			response.put("list", service.getRandomMovieByCategoryId(jsonObject,num));
		} catch (Exception e) {
			logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
		}
		return makeSuccessResponse(response);
	}
}