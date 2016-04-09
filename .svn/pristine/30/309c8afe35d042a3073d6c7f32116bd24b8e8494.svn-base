package com.guanglumedia.api.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.api.service.ExtboothRestService;
import com.guanglumedia.api.service.PageRestService;
import com.guanglumedia.rest.BaseController;

@Controller
@RequestMapping("page")
public class PageController extends BaseController {
    @Autowired
    private PageRestService service;

    @RequestMapping("rollingnews/list")
    @ResponseBody
    // 获取首页滚动信息
    public Map<String, Object> rollingnewsList(HttpServletRequest request) {
        Map<String, Object> response = new HashMap<String, Object>();
        Map<String, Object> pageBean = new HashMap<String, Object>();
        try {
            pageBean.put("recordList", service.getRollingnewsList());
            pageBean.put("totalCount", service.findRollingnewsCount());
            response.put("pageBean", pageBean);
        } catch (Exception e) {
            logger.error("系统错误", e);
            return makeFailedResponse("系统错误", response);
        }
        return makeSuccessResponse(response);
    }

    @RequestMapping("dynamiccontent/list")
    @ResponseBody
    // 获取首页动态讯息
    public Map<String, Object> dynamiccontentList(HttpServletRequest request) {
        Map<String, Object> response = new HashMap<String, Object>();
        Map<String, Object> pageBean = new HashMap<String, Object>();
        try {
            pageBean.put("recordList", service.getDynamiccontentList());
            pageBean.put("totalCount", service.findDynamiccontentCount());
            response.put("pageBean", pageBean);
        } catch (Exception e) {
            logger.error("系统错误", e);
            return makeFailedResponse("系统错误", response);
        }
        return makeSuccessResponse(response);
    }

    @RequestMapping("recommend/list")
    @ResponseBody
    // 获取首页广告活动推荐
    public Map<String, Object> RecommendList(HttpServletRequest request) {
        Map<String, Object> response = new HashMap<String, Object>();
        Map<String, Object> pageBean = new HashMap<String, Object>();
        try {
            pageBean.put("recordList", service.getRecommendList());
            pageBean.put("totalCount", service.findRecommendCount());
            response.put("pageBean", pageBean);
        } catch (Exception e) {
            logger.error("系统错误", e);
            return makeFailedResponse("系统错误", response);
        }
        return makeSuccessResponse(response);
    }
}
