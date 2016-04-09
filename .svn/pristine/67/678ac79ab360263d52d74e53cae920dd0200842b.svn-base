package com.guanglumedia.cms.movie.action;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.movie.entity.Publish;
import com.guanglumedia.cms.movie.service.PublishService;

@Controller
@RequestMapping(value="/cms/publish")
public class PublishAction extends BaseAction{
	@Autowired
	private PublishService publishservice;
		
	@RequestMapping(value="findpublishlist")
	public String FindPublicList(Publish publish,HttpServletRequest request, Model model) throws UnsupportedEncodingException{
		PagedModelList<Publish> pagedModelList = this.publishservice.findAllPublishList(publish,getPageNo(request),getPageRow(request));
		model.addAttribute("pml", pagedModelList);
		model.addAttribute("Publish", publish);
		return "publish/ListPublish";
	}
	
	
	@RequestMapping(value="tomodifypublish")
	public String ToModifyPublish(@RequestParam("id")int id,@RequestParam("Edit")String edit,HttpServletRequest request, Model model){
		Publish publish=publishservice.getPublishById(id);
		model.addAttribute("publish",publish);
		model.addAttribute("Edit", edit);
		model.addAttribute("PublishID",id);
		return "publish/ModifyPublish";
	}

}
