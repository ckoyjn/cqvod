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

import com.guanglumedia.api.service.CategoryRestService;
import com.guanglumedia.api.utils.ControllerUtils;
import com.guanglumedia.rest.BaseController;

@Controller
@RequestMapping("category")
public class CategoryController extends BaseController {
    @Autowired
    private CategoryRestService service;

    @RequestMapping("list")
    @ResponseBody
    public Map<String, Object> list(HttpServletRequest request){
    	Map<String, Object> response = new HashMap<String, Object>();
    	try{
  			response.put("list", service.getAllCategory());
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
    	}
        return makeSuccessResponse(response);
    }
    
    @RequestMapping("listGBK")
    @ResponseBody
    public void list(HttpServletRequest request, HttpServletResponse response){
    	JSONObject resp = new JSONObject();
    	PrintWriter out = null;
    	try{
    		 
    		resp.put("list", service.getAllCategory());
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
    
    @RequestMapping("movie")
    @ResponseBody
    public Map<String, Object> movie(HttpServletRequest request){
    	Map<String, Object> response = new HashMap<String, Object>();
    	try{
    		JSONObject jsonObject = ControllerUtils.getJSONObj(request);
    		int categoryid = jsonObject.getInt("categoryid");
    		int pageNo = jsonObject.getInt("pageNo");
    		int pageRow = jsonObject.getInt("pageRow");
            response.put("pageBean", service.getCategoryMovie(categoryid, pageNo, pageRow));
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
    	}
        return makeSuccessResponse(response);
    }
    
    @RequestMapping("hot")
    @ResponseBody
    public Map<String, Object> getHotMovie(HttpServletRequest request){
        Map<String, Object> response = new HashMap<String, Object>();
        try{
            JSONObject jsonObject = ControllerUtils.getJSONObj(request);
            int pageNo = jsonObject.getInt("pageNo");
            int pageRow = jsonObject.getInt("pageRow");
            response.put("pageBean", service.getHotMovie( pageNo, pageRow));
        }catch(Exception e){
            logger.error("系统错误",e);
            return makeFailedResponse("系统错误", response);
        }
        return makeSuccessResponse(response);
    }
}
