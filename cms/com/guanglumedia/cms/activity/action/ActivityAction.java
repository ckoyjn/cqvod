package com.guanglumedia.cms.activity.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.cms.activity.entity.Activity;
import com.guanglumedia.cms.activity.service.ActivityService;
import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.Feedback;
import com.guanglumedia.cms.common.PagedModelList;

@Controller
@RequestMapping("/cms/activity")
public class ActivityAction extends BaseAction{
    @Autowired
    private ActivityService activityService;
    
    @RequestMapping(value="activitylist")
    public String getCategoryList(HttpServletRequest request, Model model){
        PagedModelList<Activity> pml = activityService.getActivityList(this.getPageNo(request), this.getPageRow(request));
        model.addAttribute("pml", pml);
        return "activity/activitylist";
    }
    
    @RequestMapping(value="tomodifyactivity")
    public String toModifyActivity(@RequestParam("id")int id,@RequestParam("Edit")String edit,HttpServletRequest request, Model model){
        if(id>0) {
            Activity activity = activityService.getActivityById(id);
            model.addAttribute("activity", activity);
        }
        model.addAttribute("Edit", edit);
        model.addAttribute("activityid",id);
        return "activity/activitymodify";
    }
    
    @RequestMapping(value="modifyactivity")
    @ResponseBody
    public Feedback modifyactivity(Activity activity,HttpServletRequest request, Model model){
        int result=-1;
        String message="更新失败";
        try{
            result=this.activityService.updateActivity(activity);
        }catch (Exception e){
            e.printStackTrace();
            message=e.getMessage();
        }
        if(result>0){
            return Feedback.success("更新成功");
        }else{
            return Feedback.fail(message);
        }
    }
    
    @RequestMapping(value="delactivity")
    @ResponseBody
    public Feedback delactivity(@RequestParam("id")int[] ids,HttpServletRequest request, Model model){
        int result=-1;
        String message="删除失败";
        try{
            result=this.activityService.deleteActivityByIds(ids);
        }catch (Exception e){
            e.printStackTrace();
            message=e.getMessage();
        }
        if(result>0){
            return Feedback.success("删除成功4444");
        }else{
            return Feedback.fail(message);
        }
    }
    
    @RequestMapping(value="addactivity")
    @ResponseBody
    public Feedback insertActivity(Activity activity,HttpServletRequest request, Model model){
        int result=-1;
        String message="添加失败";
        try{
            result=this.activityService.insertActivity(activity);
        }catch (Exception e){
            e.printStackTrace();
            message=e.getMessage();
        }
        if(result>0){
            return Feedback.success("添加成功");
        }else{
            return Feedback.fail(message);
        }
    }
    
    @RequestMapping(value={"updateCheckOrderby"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
	public void updateCheckOrderby(@Param("rank")String orderby,HttpServletRequest request, HttpServletResponse response){
	    int result = activityService.HasOrderby(orderby);
		writeAjaxResult(response, result>0?"false":"true");
	}
	@RequestMapping(value={"checkOrderby"})
	@ResponseBody
	public boolean CheckOrderby(@Param("rank")String orderby,HttpServletRequest request, HttpServletResponse response){
		int result = activityService.HasOrderby(orderby);
		return !(result>0);
	}
}
