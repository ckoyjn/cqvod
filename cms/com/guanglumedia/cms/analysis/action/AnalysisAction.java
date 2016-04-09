package com.guanglumedia.cms.analysis.action;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.cms.analysis.entity.AccessCategory;
import com.guanglumedia.cms.analysis.service.AnalysisService;
import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.util.ExportExcelUtils;

import net.sf.json.JSONArray;

@Controller
@RequestMapping(value="/cms/analysis")
public class AnalysisAction extends BaseAction{
	@Autowired
	private AnalysisService analysisservice;
	
	@RequestMapping(value="toaccessanalysis")
	public String ToAccessAnalysis(AccessCategory accesscategory, HttpServletRequest request, Model model){
		List<AccessCategory> categories = analysisservice.findAllAccessCategoryList(accesscategory);
		model.addAttribute("categories", categories);
		model.addAttribute("access", accesscategory);
		return "analysis/AccessAnalysis";
	}
	
	@RequestMapping(value="showaccessdata")
	public String ShowAnalysis(AccessCategory accesscategory, HttpServletRequest request, Model model){
		PagedModelList<AccessCategory> categories = analysisservice.findAccessDateList(accesscategory,getPageNo(request),getPageRow(request));
		model.addAttribute("pml", categories);
		model.addAttribute("access", accesscategory);
		return "analysis/AccessData";
	}
	
	@RequestMapping(value={"showaccesschart"}, method={RequestMethod.GET})
	public String ShowAnalysisChart(AccessCategory accesscategory, HttpServletRequest request, Model model){
		JSONArray predata=this.analysisservice.getRegGraphData(accesscategory);
		model.addAttribute("predata",predata.toString());
		model.addAttribute("access", accesscategory);
		model.addAttribute("maxpredata", getMaxPredata(predata));
		return "analysis/AccessChart";
	}
	@RequestMapping(value={"getaccesschart"}, method={RequestMethod.GET})
	@ResponseBody
	public Map<String,Object> regStatistics(HttpServletRequest request, Model model,AccessCategory accesscategory){
		Map<String,Object> map = new HashMap<String, Object>();
		JSONArray data=this.analysisservice.getRegGraphData(accesscategory);
		map.put("data", data);
		map.put("maxdata", getMaxPredata(data));
		return map;
	}
	
	/**
	 * y轴最大值
	 * @param predata
	 * @return
	 */
	private Integer getMaxPredata(JSONArray predata){
		List<Integer> list = new ArrayList<Integer>();
		//获取最大值
		Iterator<JSONArray> it = predata.iterator();
		while(it.hasNext()){
			JSONArray result  = (JSONArray) it.next();
			list.add(result.getInt(1));
		}
		Object[] obj = list.toArray();
		Arrays.sort(obj);
		int maxdata = (Integer) obj[obj.length-1];
		return ((int) (maxdata*1.1)/10+1)*10;
	}
	
	/**
	 * 用户量图标显示
	 * @param accesscategory
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value={"showaccessuser"}, method={RequestMethod.GET})
	public String ShowAnalysisUser(AccessCategory accesscategory, HttpServletRequest request, Model model){
		JSONArray predata=this.analysisservice.getRegGraphData4User(accesscategory);
		model.addAttribute("predata",predata.toString());
		model.addAttribute("access", accesscategory);
		model.addAttribute("maxpredata", getMaxPredata(predata));
		return "analysis/AccessUser";
	}
	
	@RequestMapping(value={"getaccessuser"}, method={RequestMethod.GET})
	@ResponseBody
	public Map<String,Object> getAccessUser(HttpServletRequest request, Model model,AccessCategory accesscategory){
		Map<String,Object> map = new HashMap<String, Object>();
		JSONArray data=this.analysisservice.getRegGraphData4User(accesscategory);
		map.put("data", data);
		map.put("maxdata", getMaxPredata(data));
		return map;
	}
	
	
	 @RequestMapping(value = "exportAnalysis")
	    @ResponseBody
	    public String ExportAnalysis(AccessCategory accesscategory, HttpServletResponse respond, Model model) {
	        try {
	            List<Map<String, Object>> list = this.analysisservice.exportAnalysis(accesscategory);
	            if (list != null && list.size() > 0) {
	                respond.setContentType("octets/stream");
	                OutputStream out = respond.getOutputStream();
	                respond.addHeader("Content-Disposition", "attachment;filename=Analysis.xls");
	                ExportExcelUtils.exportAccessCategoryList(out, list,accesscategory);
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
	            return "";
	        }
	    }
}
