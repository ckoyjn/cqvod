package com.guanglumedia.cms.special.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.Feedback;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.special.entity.Special;
import com.guanglumedia.cms.special.service.SpecialService;

@Controller
@RequestMapping(value="/cms/special")
public class SpecialAction extends BaseAction {
    @Autowired
    private SpecialService specialService;
    
    @RequestMapping(value="speciallist")
    public String getSpecialList(@RequestParam Map<String,Object> map, HttpServletRequest request, Model model){
        PagedModelList<Special> pml = specialService.getSpecialList(this.getPageNo(request), this.getPageRow(request),map);
        model.addAttribute("pml", pml);
        model.addAttribute("map", map);
        return "special/speciallist";
    }
    
    @RequestMapping(value="tomodifyspecial")
    public String toModifySpecial(@RequestParam("id")int id,@RequestParam("Edit")String edit,HttpServletRequest request, Model model){
        if(id>0) {
            Special special = specialService.getSpecialById(id);
            model.addAttribute("special", special);
        }
        List<Map<String,Object>> movies=specialService.getAllMovies();
        model.addAttribute("movies", movies);
        model.addAttribute("Edit", edit);
        model.addAttribute("specialid",id);
        return "special/specialmodify";
    }
    
    @RequestMapping(value="specialmovielist")
    public String getMoviesBySpecialId(@RequestParam("id")int id, HttpServletRequest request, Model model) {
        List<Map<String,Object>> list = this.specialService.getMoviesBySpecialId(id);
        model.addAttribute("list", list);
        model.addAttribute("specialid", id);
        return "special/specialmovielist";
    }
    
    @RequestMapping(value="specialmoviemodify")
    public String getOnlineMoviesBySpecialId(@RequestParam("id")int id,HttpServletRequest request, Model model){
        PagedModelList<Map<String,Object>> pml = specialService.getOnlineMoviesBySpecialId(id,this.getPageNo(request), this.getPageRow(request));
        model.addAttribute("pml", pml);
        model.addAttribute("specialid", id);
        return "special/specialmoviemodify";
    }
    
    @RequestMapping(value="addspecial")
    @ResponseBody
    public Feedback addSpecial(@RequestParam Map<String,Object> map,HttpServletRequest request, Model model){
        int result=-1;
        String message="添加失败";
        try{
        	if(this.specialService.HasSpecialName((String)map.get("name"),0+"")<=0){
                result=this.specialService.addSpecial(map);        		
        	}else{
        		message="专题名称已经存在";
        	}
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
    
    @RequestMapping(value="addmovie")
    @ResponseBody
    public Feedback addMovies(@RequestParam("specialid")int specialid,@RequestParam("movieid")int [] movieid,HttpServletRequest request, Model model){
        int result=-1;
        String message="添加失败";
        try{
            result=this.specialService.insertSpecialMovies(specialid, movieid);
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
    
    @RequestMapping(value="delspecial")
    @ResponseBody
    public Feedback DelMovie(@RequestParam("id")int id,HttpServletRequest request, Model model){
        int result=-1;
        String message="删除失败";
        try{
            result=this.specialService.delSpecial(id);
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
    
    @RequestMapping(value="delspecialmovie")
    @ResponseBody
    public Feedback delSpecialMovie(@RequestParam("id")int id,@RequestParam("specialId")int sid,HttpServletRequest request, Model model){
        int result=-1;
        String message="删除失败";
        try{
//            result=this.specialService.delSpecialMovieById(sid,id);
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
    
    @RequestMapping(value="modifyspecial")
    @ResponseBody
    public Feedback ModifyMovie(Special special,HttpServletRequest request, Model model){
        int result=-1;
        String message="更新失败";
        try{
        	if(this.specialService.HasSpecialName(special.getName(),special.getId())<=0){
                result=this.specialService.updateSpecial(special); 		
        	}else{
        		message="专题名称已经存在";
        	}
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
}
