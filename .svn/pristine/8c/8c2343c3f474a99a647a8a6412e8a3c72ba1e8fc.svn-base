package com.guanglumedia.rest;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

public abstract class BaseController {
	protected Logger logger = Logger.getLogger("REST");
	
    protected Map<String, Object> makeResponse(int errCode, String msg, Map<String, Object> response){
        if(response == null){
            response = new HashMap<String, Object>();
        }
        response.put("errCode", errCode);
        response.put("msg", msg);
        return response;
    }
    
    protected Map<String, Object> makeSuccessResponse(Map<String, Object> response){
        return makeResponse(0, "请求成功", response);
    }
    
    protected Map<String, Object> makeFailedResponse(String msg, Map<String, Object> response) {
        return makeResponse(-2, msg, response);
    }
    
    protected Map<String, Object> makeNotLoginResponse(Map<String, Object> response) {
        return makeResponse(-1, "智能卡号不正确，请检查智能卡正常插入", response);
    }
    
    protected Map<String, Object> makeNotAuthCodeResponse(Map<String, Object> response) {
        return makeResponse(-1, "验证码过期，需要重新发送验证码", response);
    }
    
    protected boolean checkUser(JSONObject jsonobject) {
		String smartcardid = jsonobject.getString("smartcardid");
		if(smartcardid==null){
			return false;
		}
		return true;
	}
    
}
