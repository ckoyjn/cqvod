package com.guanglumedia.cms.morespecial.action;

import java.io.UnsupportedEncodingException;
import java.util.Map;

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
import com.guanglumedia.cms.morespecial.entity.Morespecial;
import com.guanglumedia.cms.morespecial.service.MorespecialService;

/**
 * 更多专题控制器类
 * @author caokai
 */
@Controller
@RequestMapping(value="/cms/morespecial")
public class MorespecialAction extends BaseAction {
	Logger log = LoggerFactory.getLogger(MorespecialAction.class);
	@Autowired
	private  MorespecialService  morespecialservice;
	
	/**
	 * 查询更多专题的列表
	 * @param  actrecommend 更多专题对象
	 * @param  request      请求对象，客户端请求的数据到这个对象
	 * @param  model        模型对象
	 * @return String       返回string类型的结果
	 * @throws UnsupportedEncodingException 抛出不支持编码异常
	 */
	  @RequestMapping(value="findmorespeciallist")
	    public String findMorespecialList(@RequestParam Map<String,Object> map, HttpServletRequest request, Model model){
	    	log.info("findmorespeciallist----");
	        PagedModelList<Morespecial> pagedModelList = morespecialservice.findAllMorespecialList(this.getPageNo(request), this.getPageRow(request),map);
	        model.addAttribute("pagedModelList", pagedModelList);
	        model.addAttribute("map", map);
	        return "morespecial/ListMorespecial";
	    }
	
	/**
	 * 判断是修改、查看、还是添加的方法
	 * @param  id      更多专题对象的id
	 * @param  edit    是否是编辑
	 * @param  request 请求对象，客户端请求的数据到这个对象
	 * @param  model   模型对象
	 * @return String  返回string类型的结果
	 */
	@RequestMapping(value="tomodifymorespecial")
	public String toModifyMorespecial(@RequestParam("id")int id,@RequestParam("Edit")String edit,HttpServletRequest request, Model model){
		log.info("tomodifymorespecial----------");
		if(id>0){
			Morespecial morespecial = morespecialservice.getMorespecialById(id);
			model.addAttribute("MorespecialInfo", morespecial);
		}
		model.addAttribute("Edit", edit);
		model.addAttribute("MorespecialID", id);
		return "morespecial/ModifyMorespecial";
	}
	
	
	
	 @RequestMapping(value="addmorespecial")
	 @ResponseBody
	 public Feedback addMorespecial(Morespecial morespecial,HttpServletRequest request, Model model){
		log.info("modifymorespecial----------");
        int    result  = -1;
        String message = "更新失败";
        try{
            result=this.morespecialservice.addMorespecial(morespecial);
        }catch (Exception e){
            e.printStackTrace();
            message = e.getMessage();
        }
        if(result>0){
            return Feedback.success("新增成功");
        }else{
            return Feedback.fail(message);
        }
	 }
	
	 /**
	  * 修改更多专题的属性
	  * @param  morespecial  跟多专题对象
	  * @param  request      请求对象，客户端请求的数据到这个对象
	  * @param  model        模型对象
	  * @return Feedback     若修改推荐活动成功，返回Feedback类型对象;否则，返回请求失败的信息
	  */
	 @RequestMapping(value="modifymorespecial")
	 @ResponseBody
	 public Feedback modifyMorespecial(Morespecial morespecial,HttpServletRequest request, Model model){
		log.info("modifymorespecial----------");
        int    result  = -1;
        String message = "更新失败";
        try{
            result=this.morespecialservice.updateMorespecial(morespecial);
        }catch (Exception e){
            e.printStackTrace();
            message = e.getMessage();
        }
        if(result>0){
            return Feedback.success("更新成功");
        }else{
            return Feedback.fail(message);
        }
	 }
	 
	 /**
	  * 根据ID删除更多专题的一条记录
	  *	@param  id           活动更多专题的id
	  * @param  request      请求对象，客户端请求的数据到这个对象
	  * @param  model        模型对象
	  * @return Feedback     若修改推荐活动成功，返回Feedback类型对象;否则，返回请求失败的信息
	  */
	 @RequestMapping(value="delmorespecial")
	 @ResponseBody
	 public Feedback delMorespecial(@RequestParam("id")int id,HttpServletRequest request, Model model){
		log.info("delmorespecial----------");
        int    result  = -1;
        String message = "删除失败";
        try{
            result=this.morespecialservice.delMorespecial(id);
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
