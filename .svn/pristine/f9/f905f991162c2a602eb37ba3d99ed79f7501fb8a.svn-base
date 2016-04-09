package com.guanglumedia.cms.dynamiccontent.action;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.Feedback;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.dynamiccontent.entity.Dynamiccontent;
import com.guanglumedia.cms.dynamiccontent.service.DynamiccontentService;
import com.guanglumedia.cms.pagerecommend.action.PagerecommendAction;
import com.guanglumedia.cms.pagerecommend.entity.Pagerecommend;

/**
 * 首页动态内容控制器
 * @author caokai
 */
@Controller
@RequestMapping(value="/cms/dynamiccontent")
public class DynamiccontentAction extends BaseAction {
	Logger log = LoggerFactory.getLogger(DynamiccontentAction.class);
	@Autowired
	private DynamiccontentService dynamiccontentservice;
	
	/**
	 * 查询首页动态内容列表
	 * @param  dynamiccontent				首页动态内容对象
	 * @param  request     					请求对象，客户端请求的数据到这个对象
	 * @param  model        				模型对象
	 * @return String       				返回string类型的结果
	 * @throws UnsupportedEncodingException 抛出不支持编码异常
	 */
	@RequestMapping(value="finddynamiccontentlist")
	public String findDynamiccontentList(Dynamiccontent dynamiccontent,HttpServletRequest request, Model model) throws UnsupportedEncodingException{
		log.info("finddynamiccontentlist----------");
		PagedModelList<Dynamiccontent> pagedModelList = dynamiccontentservice.findAllDynamiccontentList(dynamiccontent,getPageNo(request),getPageRow(request));
		model.addAttribute("pml", pagedModelList);
		model.addAttribute("Dynamiccontent", dynamiccontent);
		return "dynamiccontent/ListDynamiccontent"; 
	}
	
	/**
	 * 判断是修改、查看、还是添加的方法
	 * @param   id       首页动态内容id
	 * @param   edit	  是否是编辑
	 * @param   request  请求对象，客户端请求的数据到这个对象
	 * @param   model	  模型对象
	 * @return	String	  返回string类型的结果
	 */
	@RequestMapping(value="tomodifydynamiccontent")
	public String toModifyDynamiccontent(@RequestParam("id")int id,@RequestParam("Edit")String edit,HttpServletRequest request, Model model){
		log.info("tomodifydynamiccontent----------");
		if(id>0){
			Dynamiccontent dynamiccontent = dynamiccontentservice.getDynamiccontentById(id);
			model.addAttribute("dynamiccontent", dynamiccontent);
		}
		model.addAttribute("Edit", edit);
		model.addAttribute("DynamiccontentID",id);
		return "dynamiccontent/ModifyDynamiccontent";
	}
	
	/**
	 * 添加首页动态内容对象
	 * @param  dynamiccontent 首页动态内容对象
	 * @param  request        请求对象，客户端请求的数据到这个对象
	 * @param  model          模型对象
	 * @return Feedback       返回Feedback类型的结果
	 */
	@RequestMapping(value="adddynamiccontent")
    @ResponseBody
    public Feedback addDynamiccontent(Dynamiccontent dynamiccontent,HttpServletRequest request, Model model){
		log.info("adddynamiccontent----------");
        int    result  = -1;
        String message ="添加失败";
        try{
            result = dynamiccontentservice.addDynamiccontent(dynamiccontent);
        }catch (Exception e){
            e.printStackTrace();
            message = e.getMessage();
        }
        if(result > 0){
            return Feedback.success("添加成功");
        }else{
            return Feedback.fail(message);
        }
    }
	
	/**
	 * 修改的首页动态内容对象的属性
	 * @param dynamiccontent 首页动态内容对象
	 * @param request        请求对象，客户端请求的数据到这个对象
	 * @param model          模型对象
	 * @return               返回Feedback类型的结果
	 */
	@RequestMapping(value="modifydynamiccontent")
	@ResponseBody
	public Feedback modifyDynamiccontent(Dynamiccontent dynamiccontent,HttpServletRequest request, Model model){
		log.info("modifydynamiccontent----------");
	    int    result  = -1;
	    String message = "更新失败";
	    try{
	        result = dynamiccontentservice.updateDynamiccontent(dynamiccontent);
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
	 
	/**
	 * 根据首页动态内容对象的id来删除一条记录
	 * @param id	    首页动态内容的id
	 * @param request 请求对象，客户端请求的数据到这个对象
	 * @param model   模型对象
	 * @return		    返回Feedback类型的结果
	 */
	@RequestMapping(value="deldynamiccontent")
	@ResponseBody
	public Feedback delDynamiccontent(@RequestParam("id")int id,HttpServletRequest request, Model model){
		log.info("deldynamiccontent----------");
		int    result  = -1;
		String message = "删除失败";
		try{
		    result = dynamiccontentservice.delDynamiccontent(id);
		}catch (Exception e){
		    e.printStackTrace();
		    message=e.getMessage();
		}
		if(result>0){
		    return Feedback.success("删除成功");
		    }else{
		        return Feedback.fail(message);
		}
	}
	
}
