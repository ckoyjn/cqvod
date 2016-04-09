package com.guanglumedia.api.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;





import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.api.service.OrderRestService;
import com.guanglumedia.rest.BaseController;

@Controller
@RequestMapping("outer")
public class OuterController extends BaseController {
	@Autowired
	private OrderRestService service;
	Logger logger = Logger.getLogger(OuterController.class);

    @RequestMapping("record")
    @ResponseBody
    public Map<String, Object> record(HttpServletRequest request){
        logger.info("订购播放回调开始。。。。。。。。。。。。。。");
    	Map<String, Object> response = new HashMap<String, Object>();
    	
    	try{
    		String userid = request.getParameter("userid");
    		String vodId  = request.getParameter("vodId");
    		String price  = request.getParameter("price");
    		String type   = request.getParameter("type");
    		 logger.info(userid+"|||"+vodId+"|||"+price+"|||"+type);
    		/*新增订单*/
    		if("order".equals(type)){
    			Map<String, Object> map = new HashMap<String, Object>();
    			map.put("smartcardid", userid);
    			String [] mediaid = vodId.split("-");
    			map.put("mediaid", mediaid[0]);
    			map.put("price", price);
    			if(!service.addOrderOuter(map)){
    				logger.error("新增订单错误");
    	    		return makeFailedResponse("新增订单错误", response);
    			}
    		}else if("play".equals(type)){
    			/*播放记录*/
    			Map<String, Object> map = new HashMap<String, Object>();
    			map.put("smartcardid", userid);
    			map.put("mediaid", vodId);
    			
    			int programeId;
                try {
                    programeId = service.getProgrameId(vodId);
                    map.put("programeId", programeId);
                    map.put("pid", programeId);
                    map.put("action", 10);
                    service.addPlayRecord(map);
                    service.addwatchrecord(map);
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                    int previewid = service.getPreviewId(vodId);
                    map.put("previewid", previewid);
                    map.put("action", 17);
                    service.addPlayRecord(map);
                }
    			
    		}
    	}catch(Exception e){
    		logger.error("系统错误",e);
    		return makeFailedResponse("系统错误", response);
    	}
        return makeSuccessResponse(response);
    }
}
