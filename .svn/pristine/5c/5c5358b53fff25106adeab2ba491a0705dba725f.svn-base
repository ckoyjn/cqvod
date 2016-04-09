package com.guanglumedia.api.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.api.service.UserRestService;
import com.guanglumedia.api.utils.ControllerUtils;
import com.guanglumedia.api.utils.EpgResult;
import com.guanglumedia.api.utils.IMP;
import com.guanglumedia.rest.BaseController;

@Controller
@RequestMapping("user")
public class UserController extends BaseController {
    @Autowired
    private UserRestService service;

    @RequestMapping("rating")
    @ResponseBody
    public Map<String, Object> rating(HttpServletRequest request){
    	Map<String, Object> response = new HashMap<String, Object>();
    	try{
    		JSONObject jsonObject=ControllerUtils.getJSONObj(request);
    		if(checkUser(jsonObject)){
        		if(service.addScore(jsonObject)>0){
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
    
    @RequestMapping("order")
    @ResponseBody
    public Map<String, Object> order(HttpServletRequest request){
    	Map<String, Object> response = new HashMap<String, Object>();
    	try{
    		JSONObject jsonObject=ControllerUtils.getJSONObj(request);
   			response.put("pageBean", service.selectUserOrder(jsonObject));
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
    	}
        return makeSuccessResponse(response);
    }
    
    @RequestMapping("balance")
    @ResponseBody
    public Map<String, Object> balance(HttpServletRequest request){
        Map<String, Object> response = new HashMap<String, Object>();
        try{
            JSONObject jsonObject=ControllerUtils.getJSONObj(request);
            String smartcardid = jsonObject.getString("smartcardid");
            logger.info("smartcardid:"+smartcardid);
           IMP imp = new IMP();
           EpgResult epg = imp.querySoap("I", smartcardid);
           double balance = (double)epg.getBalance()/100;
           double oweTotalFee = (double)epg.getOweTotalFee()/100;
           response.put("type", epg.getResult());
           response.put("balance", balance);
           response.put("oweTotalFee", oweTotalFee);
        }catch(Exception e){
            logger.error("系统错误",e);
            return makeFailedResponse("系统错误", response);
        }
        return makeSuccessResponse(response);
    }
    
    @RequestMapping("praise")
    @ResponseBody
    public Map<String, Object> praise(HttpServletRequest request){
        Map<String, Object> response = new HashMap<String, Object>();
        try{
        	JSONObject jsonObject=ControllerUtils.getJSONObj(request);
        	if(checkUser(jsonObject)){
        		if(service.addPraise(jsonObject)>0){
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
    
    
    
}
