package com.guanglumedia.cms.bosslog.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.guanglumedia.cms.bosslog.entity.Bosslog;
import com.guanglumedia.cms.bosslog.service.BosslogService;
import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.PagedModelList;

@Controller
@RequestMapping(value="/cms/bosslog")
public class BosslogAction extends BaseAction {
	
	@Autowired
	private BosslogService bosslogService;
	
	@RequestMapping(value="bossloglist")
	public String getBosslogList(Bosslog bl,HttpServletRequest request, Model model){
		PagedModelList<Bosslog> pml = bosslogService.getBosslogList(this.getPageNo(request), this.getPageRow(request),bl);
		Map<String,Object> d=bosslogService.getCount(bl);
		model.addAttribute("pml", pml);
	    model.addAttribute("bl", bl);
	    model.addAttribute("orderCount",d.get("orderCount"));
	    model.addAttribute("SucceedCount",d.get("SucceedCount"));
	    model.addAttribute("DefeatedCount",d.get("DefeatedCount"));
	    return "bosslog/bossloglist";
	}
	
}
