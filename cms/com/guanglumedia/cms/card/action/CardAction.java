package com.guanglumedia.cms.card.action;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.cms.card.entity.CardEpk;
import com.guanglumedia.cms.card.service.CardService;
import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.Feedback;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.util.ExportExcelUtils;

@Controller
@RequestMapping(value="/cms/card")
public class CardAction extends BaseAction{
    @Autowired
    private  CardService cardService;
    @RequestMapping(value="findcardepklist")
    
    public String findCardepk(CardEpk cardEpk,HttpServletRequest request, Model model){
        PagedModelList<Map<String,Object>> pagedModelList=cardService.findcardepklist(cardEpk,getPageNo(request),getPageRow(request));
        model.addAttribute("pml", pagedModelList);
        model.addAttribute("cardEpk", cardEpk);
        return "card/Listcardepk";
    }
    
    @RequestMapping(value="tomodifycardepk")
    public String addCardepk(@RequestParam("id")int id,@RequestParam("Edit")String edit,HttpServletRequest request, Model model){
        model.addAttribute("Edit", edit);
        model.addAttribute("CardepkID",id);
        return "card/Modifyepk";
    }
    
    @RequestMapping(value="addCardepk")
    @ResponseBody
    public Feedback addCardEpk(CardEpk cardEpk,HttpServletRequest request, Model model){
        int result=-1;
        String message="添加失败";
        try{
           result=this.cardService.addCardEpk(cardEpk);
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
  //观影码使用信息
    @RequestMapping(value="finduseinfolist")
    public String findUserInfoList(CardEpk cardEpk,HttpServletRequest request, Model model){
        PagedModelList<Map<String,Object>> pagedModelList = cardService.finduseinfolist(cardEpk,getPageNo(request),getPageRow(request));
        model.addAttribute("pml", pagedModelList);
        model.addAttribute("cardEpk", cardEpk);
        
        return "card/ListUseinfo";
    }
    //激活观景码insertIntoEvcn
    @RequestMapping(value="insertIntoEvcn")
    @ResponseBody
    public Feedback insertIntoEvcn(CardEpk cardEpk,HttpServletRequest request, Model model){
        int result=-1;
        String message="添加失败";
        try{
           result=this.cardService.insertIntoEvcn(cardEpk);
        }catch (Exception e){
            e.printStackTrace();
            message=e.getMessage();
        }
        
        if(result>0){
            return Feedback.success("激活成功");
        }else{
            return Feedback.fail(message);
        }
    }
    //导出观影码
    @RequestMapping(value = "exportcardepk")
    @ResponseBody
    public String exportcardepk(CardEpk cardEpk, HttpServletResponse respond, HttpServletRequest request,Model model) {
        try {
            List<Map<String, Object>> list = cardService.exportcardepk(cardEpk);
            if (list != null && list.size() > 0) {
                respond.setContentType("octets/stream");
                OutputStream out = respond.getOutputStream();
                respond.addHeader("Content-Disposition", "attachment;filename=movieCodes.xls");
                ExportExcelUtils.exportcardepk(out, list);
                out.close();
            } else {
                respond.setCharacterEncoding("utf-8");
                respond.setContentType("text/plain");
                PrintWriter writer = respond.getWriter();
                 writer.print("没有可导出的数据");
                writer.close();
            }

        } catch (Exception e) {

            e.printStackTrace();
        } finally {
            return findCardepk( cardEpk,request, model);
        }
    }
}
