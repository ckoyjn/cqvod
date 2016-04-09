package com.guanglumedia.api.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.api.service.OrderRestService;
import com.guanglumedia.api.utils.ControllerUtils;
import com.guanglumedia.rest.BaseController;

@Controller
@RequestMapping("order")
public class OrderController extends BaseController {
    @Autowired
    private OrderRestService service;

    @RequestMapping("add")
    @ResponseBody
    public Map<String, Object> addOrder(HttpServletRequest request){
    	Map<String, Object> response = new HashMap<String, Object>();
    	try{
    		JSONObject jsonObject=ControllerUtils.getJSONObj(request);
    		if(!service.addOrder(jsonObject)){
    			logger.error("新增订单出错"+jsonObject.toString());
    			return makeFailedResponse("新增订单出错", response);
    		}
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
    	}
        return makeSuccessResponse(response);
    }
    
    @RequestMapping("verifycode")
    @ResponseBody
    public Map<String, Object> verifycode(HttpServletRequest request){
    	Map<String, Object> response = new HashMap<String, Object>();
    	try{
    		JSONObject jsonObject=ControllerUtils.getJSONObj(request);
    		int result = service.verifycode(jsonObject);
    		logger.info("-------------------verifycode-------------------");
    		logger.info("-------------------"+jsonObject.toString()+"-------------------");
    		response.put("result", result);
    		switch(result){
    		case -1:
    			logger.error("电子券已被充入过");
    			break;
    		case -2:
    			logger.error("电子券不在有效期内");
    			break;
    		case -3:
    			logger.error("电子券金额不足");
    			break;
    		case -4:
    			logger.error("更新电子券状态出错");
    			break;
    		case -5:
    			logger.error("boss充值失败");
    			break;
    		case -6:
    			logger.error("电子券不存在");
    		default:
    			break;
    		}
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
    	}
        return makeSuccessResponse(response);
    }
    
    @RequestMapping("verifycodeR")
    @ResponseBody
    public Map<String, Object> verifycodeR(HttpServletRequest request){
    	Map<String, Object> response = new HashMap<String, Object>();
    	try{
    		JSONObject jsonObject=ControllerUtils.getJSONObj(request);
    		int result = service.verifycodeR(jsonObject);
    		logger.info("-------------------verifycodeR-------------------");
    		logger.info("-------------------"+jsonObject.toString()+"-------------------");
    		response.put("result", result);
    		switch(result){
    		case -1:
    			logger.error("卡号与电子券号不对应无法退回");
    			break;
    		case -2:
    			logger.error("电子券未充入，无法退回");
    			break;
    		case -3:
    			logger.error("电子券已使用，无法退回");
    			break;
    		case -4:
    			logger.error("boss撤回充值出错");
    			break;
    		case -5:
    			logger.error("电子券不存在");
    		default:
    			break;
    		}
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
    	}
        return makeSuccessResponse(response);
    }
}
