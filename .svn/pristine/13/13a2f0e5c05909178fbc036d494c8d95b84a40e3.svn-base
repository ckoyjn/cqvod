package com.guanglumedia.cms.recommend.action;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.Feedback;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.recommend.service.CmsRecommendService;

@Controller
@RequestMapping(value = "/cms/recommend")
public class RecommendAction extends BaseAction {
    @Autowired
    private CmsRecommendService recommendService;

    @RequestMapping(value = "findrecommendlist")
    public String FindRecommendList(@RequestParam Map<String, Object> map, HttpServletRequest request, Model model)
            throws UnsupportedEncodingException {
        PagedModelList<Map<String, Object>> pagedModelList = this.recommendService.findRecommendList(map, getPageNo(request),
                getPageRow(request));
        model.addAttribute("pml", pagedModelList);
        model.addAttribute("rec", map);
        return "recommend/ListRecommend";
    }

    @RequestMapping(value = "tomodifyrecommend")
    public String ToModifyRecommend(@RequestParam("id") int id, @RequestParam("objecttype") int objecttype,
            @RequestParam("Edit") String edit, HttpServletRequest request, Model model) throws UnsupportedEncodingException {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", id);
        map.put("objecttype", objecttype);
        if (id > 0) {
            Map<String, Object> mapRecommend = this.recommendService.getRecommendById(map);
            List<Map<String, Object>> movies = this.recommendService.findAllMovie();
            List<Map<String, Object>> specils = this.recommendService.findAllSpecil();
            model.addAttribute("movies", movies);
            model.addAttribute("specils", specils);
            model.addAttribute("rec", mapRecommend);
        }
        model.addAttribute("Edit", edit);
        model.addAttribute("RecommendID", id);
        return "recommend/ModifyRecommend";
    }

    @RequestMapping(value = "modifyrecommend")
    @ResponseBody
    public Feedback ModifyRecommend(@RequestParam Map<String, Object> map, HttpServletRequest request, Model model) {
        int result = -1;
        String message = "更新失败";
        try {
            result = this.recommendService.updateRecommend(map);
        } catch (Exception e) {
            e.printStackTrace();
            message = e.getMessage();
        }
        if (result > 0) {
            return Feedback.success("更新成功");
        } else {
            return Feedback.fail(message);
        }
    }

    @RequestMapping(value = "addrecommend")
    @ResponseBody
    public Feedback AddRecommend(@RequestParam Map<String, Object> map, HttpServletRequest request, Model model) {
        int result = -1;
        String message = "添加失败";
        try {
            result = this.recommendService.AddRecommend(map);
        } catch (Exception e) {
            e.printStackTrace();
            message = e.getMessage();
        }
        if (result > 0) {
            return Feedback.success("添加成功");
        } else {
            return Feedback.fail(message);
        }
    }

    @RequestMapping(value = "delrecommend")
    @ResponseBody
    public Feedback DelRecommend(@RequestParam("id") int id, HttpServletRequest request, Model model) {
        int result = -1;
        String message = "删除失败";
        try {
            result = this.recommendService.delRecommend(id);
        } catch (Exception e) {
            e.printStackTrace();
            message = e.getMessage();
        }
        if (result > 0) {
            return Feedback.success("删除成功");
        } else {
            return Feedback.fail(message);
        }
    }

    @RequestMapping(value = "findobjectnamebytype")
    @ResponseBody
    public String FindObjectNameByType(@RequestParam("ObjectType") int objecttype, HttpServletRequest request, Model model)
            throws UnsupportedEncodingException {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("objecttype", objecttype);
        List<Map<String, Object>> list = this.recommendService.findObjectNameByType(map);
        JSONObject json = new JSONObject();
        json.put("objectlist", list);
        return json.toJSONString();
    }


    @RequestMapping(value = "findobjectIdentify")
    @ResponseBody
    public Feedback FindobjectIdentify(@RequestParam Map<String,Object> map, HttpServletRequest request, Model model) {
        String Identify = "";
        Identify = this.recommendService.findobjectIdentify(map);
        return Feedback.success(Identify);
    }
}
