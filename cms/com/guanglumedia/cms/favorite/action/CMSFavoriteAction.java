package com.guanglumedia.cms.favorite.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.favorite.entity.CMSFavorite;
import com.guanglumedia.cms.favorite.service.CMSFavoriteService;
@Controller
@RequestMapping("/cms/favorite")
public class CMSFavoriteAction extends BaseAction {
    @Autowired
    CMSFavoriteService cMSFavoriteService; 
    
    @RequestMapping(value="favoritelist")
    public String getFavoriteList(CMSFavorite f,HttpServletRequest request, Model model){
        PagedModelList<CMSFavorite> pml = cMSFavoriteService.getFavoriteList(this.getPageNo(request), this.getPageRow(request), f);
        model.addAttribute("pml", pml);
        model.addAttribute("f", f);
        return "favorite/favoritelist";
    }
}
