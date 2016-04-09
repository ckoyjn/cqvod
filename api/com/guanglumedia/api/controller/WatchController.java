package com.guanglumedia.api.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.api.service.WatchRestService;
import com.guanglumedia.api.utils.ControllerUtils;
import com.guanglumedia.rest.BaseController;

@Controller
@RequestMapping("user/watch")
public class WatchController extends BaseController {

	@Autowired
	private WatchRestService watchRestService;

	@RequestMapping("record")
	@ResponseBody
	public Map<String, Object> record(HttpServletRequest request) {
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			JSONObject jsonObject = ControllerUtils.getJSONObj(request);
			if (checkUser(jsonObject)) {
				if (watchRestService.addWatchRecord(jsonObject)) {
					response.put("result", 0);
				} else {
					response.put("result", -1);
				}
			} else {
				return makeNotLoginResponse(response);
			}
		} catch (Exception e) {
			logger.error("系统错误", e);
			return makeFailedResponse("系统错误", response);
		}
		return makeSuccessResponse(response);
	}
	
	@RequestMapping("history")
	@ResponseBody
	public Map<String,Object> history(HttpServletRequest request){
		Map<String, Object> response = new HashMap<String, Object>();
    	try{
    		JSONObject jsonObject = ControllerUtils.getJSONObj(request);
    		String smartcardid = jsonObject.getString("smartcardid");
    		int pageNo = jsonObject.getInt("pageNo");
    		int pageRow = jsonObject.getInt("pageRow");
            response.put("pageBean", watchRestService.getwatchRecordByUserId(smartcardid, pageNo, pageRow));
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
    	}
        return makeSuccessResponse(response);
	}
}
