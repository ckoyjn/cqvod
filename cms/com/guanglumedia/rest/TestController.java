package com.guanglumedia.rest;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.api.utils.ControllerUtils;
import com.guanglumedia.cms.card.service.CardService;

@Controller
@RequestMapping("comment")
public class TestController extends BaseController {
    @Autowired
    private  CardService cardService;
    @RequestMapping("list")
    @ResponseBody
    public Map<String, Object> list(HttpServletRequest request) throws Exception {
    	JSONObject jsonObject = ControllerUtils.getJSONObj(request);
        Map<String, Object> response = new HashMap<String, Object>();
        response.put("pageBean", jsonObject.get("data"));
        return makeSuccessResponse(response);
    }
    
}
