package com.guanglumedia.cms.actsrecommend.action;

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

import com.guanglumedia.cms.actsrecommend.entity.Actsrecommend;
import com.guanglumedia.cms.actsrecommend.service.ActsrecommendService;
import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.Feedback;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.pagerecommend.action.PagerecommendAction;
import com.guanglumedia.cms.pagerecommend.entity.Pagerecommend;
import com.guanglumedia.cms.special.entity.Special;

/**
 * 活动推荐控制器类
 * @author caokai
 */
@Controller
@RequestMapping(value="/cms/actsrecommend")
public class ActsrecommendAction extends BaseAction {
	Logger log = LoggerFactory.getLogger(ActsrecommendAction.class);
	@Autowired
	private ActsrecommendService actsrecommendservice;
	
	/**
	 * 查询活动推荐列表
	 * @param  actrecommend                 活动推荐对象
	 * @param  request                      请求对象，客户端请求的数据到这个对象
	 * @param  model                        模型对象
	 * @return String                       返回string类型的结果
	 * @throws UnsupportedEncodingException 抛出不支持编码异常
	 */
    @RequestMapping(value="findactsrecommendlist")
    public String findActsrecommendList(@RequestParam Map<String,Object> map, HttpServletRequest request, Model model){
    	log.info("findActsrecommendList------");
        PagedModelList<Actsrecommend> pml = actsrecommendservice.findActsrecommendList(this.getPageNo(request), this.getPageRow(request),map);
        model.addAttribute("pml", pml);
        model.addAttribute("map", map);
        return "actsrecommend/ListActsrecommend";
    }
	
	/**
	 * 判断是修改、查看、还是添加的方法
	 * @param  id      活动推荐对象的id
	 * @param  edit    是否是编辑
	 * @param  request 请求对象，客户端请求的数据到这个对象
	 * @param  model   模型对象
	 * @return String  返回string类型的结果
	 */
	@RequestMapping(value="tomodifyactsrecommend")
	public String toModifyActsrecommend(@RequestParam("id")int id,@RequestParam("Edit")String edit,HttpServletRequest request, Model model){
		log.info("tomodifyactsrecommend----------");
		if(id>0){
			Actsrecommend actsrecommend = actsrecommendservice.getActsrecommendById(id);
			model.addAttribute("ActsrecommendInfo", actsrecommend);
		}
		model.addAttribute("Edit", edit);
		model.addAttribute("ActsrecommendID", id);
		return "actsrecommend/ModifyActsrecommend";
	}
	
	/**
	 * 添加活动推荐对象
	 * @param  pagerecommend 活动推荐对象
	 * @param  request       请求对象，客户端请求的数据到这个对象
	 * @param  model         模型对象
	 * @return Feedback      返回Feedback类型的结果
	 */
	@RequestMapping(value="addactsrecommend")
    @ResponseBody
    public Feedback addActsrecommend(Actsrecommend actsrecommend,HttpServletRequest request, Model model){
		log.info("addactsrecommend----------");
        int    result  = -1;
        String message = "添加失败";
        try{
            result = actsrecommendservice.addActsrecommend(actsrecommend);
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
	  * 修改活动推荐的属性
	  * @param  actrecommend 活动推荐对象
	  * @param  request      请求对象，客户端请求的数据到这个对象
	  * @param  model        模型对象
	  * @return Feedback     若修改推荐活动成功，返回Feedback类型对象;否则，返回请求失败的信息
	  */
	 @RequestMapping(value="modifyactrecommend")
	 @ResponseBody
	 public Feedback ModifyActrecommend(Actsrecommend actrecommend,HttpServletRequest request, Model model){
		log.info("modifyactrecommend----------");
        int    result  = -1;
        String message = "更新失败";
        try{
            result=this.actsrecommendservice.updateActsrecommend(actrecommend);
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
	  * 根据ID删除活动推荐的一条记录
	  *	@param  id           活动推荐对象的id
	  * @param  request      请求对象，客户端请求的数据到这个对象
	  * @param  model        模型对象
	  * @return Feedback     若修改推荐活动成功，返回Feedback类型对象;否则，返回请求失败的信息
	  */
	 @RequestMapping(value="delactsrecommend")
	 @ResponseBody
	 public Feedback delActsrecommend(@RequestParam("id")int id,HttpServletRequest request, Model model){
		log.info("delactrecommend----------");
        int result     = -1;
        String message = "删除失败";
        try{
            result=this.actsrecommendservice.delActsrecommend(id);
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
