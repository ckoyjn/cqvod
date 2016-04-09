package com.guanglumedia.cms.watchrecode.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.watchrecode.entity.CMSWatchRecode;
import com.guanglumedia.cms.watchrecode.service.CMSWatchRecodeService;
@Controller
@RequestMapping("/cms/watchrecode")
public class CMSWatchRecodeAction extends BaseAction {
    @Autowired
    CMSWatchRecodeService cMSWatchRecodeService;
    
    @RequestMapping(value="watchrecodelist")
    public String getCMSWatchRecodeList(CMSWatchRecode watchRecode,HttpServletRequest request, Model model){
        PagedModelList<CMSWatchRecode> pml = cMSWatchRecodeService.getCMSWatchRecodeList(this.getPageNo(request), this.getPageRow(request), watchRecode);
        model.addAttribute("pml", pml);
        model.addAttribute("watchRecode", watchRecode);
        return "watchrecode/watchrecodelist";
    }
}
