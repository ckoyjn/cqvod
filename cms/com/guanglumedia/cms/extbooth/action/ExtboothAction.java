package com.guanglumedia.cms.extbooth.action;

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
import com.guanglumedia.cms.extbooth.entity.Extbooth;
import com.guanglumedia.cms.extbooth.service.ExtboothService;

/**
 * 专题扩展控制器类
 * @author caokai
 */
@Controller
@RequestMapping(value="/cms/extbooth")
public class ExtboothAction extends BaseAction {
	Logger log = LoggerFactory.getLogger(ExtboothAction.class);
	@Autowired
	private  ExtboothService  extboothservice;
    @RequestMapping(value="findextboothlist")
    public String findExtboothList(@RequestParam Map<String,Object> map, HttpServletRequest request, Model model){
    	log.info("findExtboothList------");
        PagedModelList<Extbooth> pml = extboothservice.findExtboothList(this.getPageNo(request), this.getPageRow(request),map);
        model.addAttribute("pml", pml);
        model.addAttribute("map", map);
        return "extbooth/ListExtbooth";
    }
	
	/**
	 * 添加首页专题扩展对象
	 * @param  extbooth      首页专题扩展对象
	 * @param  request       请求对象，客户端请求的数据到这个对象
	 * @param  model         模型对象
	 * @return Feedback      返回Feedback类型的结果
	 */
	@RequestMapping(value="addextbooth")
    @ResponseBody
    public Feedback addExtbooth(Extbooth extbooth,HttpServletRequest request, Model model){
		log.info("addextbooth----------");
        int    result  = -1;
        String message = "添加失败";
        try{
            result = extboothservice.addExtbooth(extbooth);
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
	 * 修改专题扩展
	 * @param  id      专题扩展对象的id
	 * @param  edit    是否是编辑
	 * @param  request 请求对象，客户端请求的数据到这个对象
	 * @param  model   模型对象
	 * @return String  返回string类型的结果
	 */
	@RequestMapping(value="tomodifyextbooth")
	public String toModifyMorespecial(@RequestParam("id")int id,@RequestParam("Edit")String edit,HttpServletRequest request, Model model){
		log.info("tomodifyextbooth-----------");
		if(id>0){
			Extbooth extbooth = extboothservice.getExtboothById(id);
			model.addAttribute("ExtboothInfo", extbooth);
		}
		model.addAttribute("Edit", edit);
		model.addAttribute("ExtboothID", id);
		return "extbooth/ModifyExtbooth";
	}
	
	 /**
	  * 修改专题扩展的属性
	  * @param  morespecial  专题扩展对象
	  * @param  request      请求对象，客户端请求的数据到这个对象
	  * @param  model        模型对象
	  * @return Feedback     若修改专题扩展成功，返回Feedback类型对象;否则，返回请求失败的信息
	  */
	 @RequestMapping(value="modifyextbooth")
	 @ResponseBody
	 public Feedback modifyExtbooth(Extbooth extbooth,HttpServletRequest request, Model model){
		log.info("modifyextbooth-----------");
        int    result  = -1;
        String message = "更新失败";
        try{
            result=this.extboothservice.updateExtbooth(extbooth);
        }catch (Exception e){
            e.printStackTrace();
            message = e.getMessage();
        }
        if(result > 0){
            return Feedback.success("更新成功");
        }else{
            return Feedback.fail(message);
        }
	 }
	 
	 /**
	  * 根据ID删除专题扩展的一条记录
	  *	@param  id           专题扩展的id
	  * @param  request      请求对象，客户端请求的数据到这个对象
	  * @param  model        模型对象
	  * @return Feedback     若删除成功，返回Feedback类型对象;否则，返回请求失败的信息
	  */
	 @RequestMapping(value="delextbooth")
	 @ResponseBody
	 public Feedback delExtbooth(@RequestParam("id")int id,HttpServletRequest request, Model model){
		log.info("delextbooth-----------");
        int    result  = -1;
        String message = "删除失败";
        try{
            result=this.extboothservice.delExtbooth(id);
        }catch (Exception e){
            e.printStackTrace();
            message = e.getMessage();
        }
        if(result > 0){
            return Feedback.success("删除成功");
        }else{
            return Feedback.fail(message);
        }
	 }
}
