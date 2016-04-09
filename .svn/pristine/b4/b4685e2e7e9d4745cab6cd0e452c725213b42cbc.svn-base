package com.guanglumedia.cms.analysis.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guanglumedia.api.utils.DateUtil;
import com.guanglumedia.cms.analysis.dao.AnalysisDao;
import com.guanglumedia.cms.analysis.entity.AccessCategory;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.common.util.StringUtils;

@Service
public class AnalysisService {
	@Autowired
	private AnalysisDao analysisdao;
	public List<AccessCategory> findAllAccessCategoryList(AccessCategory accesscategory){
		if(StringUtils.isEmpty(accesscategory.getStarttime())||StringUtils.isEmpty(accesscategory.getEndtime())){
			accesscategory.setEndtime(getCurrentDate());
			accesscategory.setStarttime(getCurrentStringDatePremonth());
		}
		accesscategory.setEndtime(accesscategory.getEndtime()+" 23:59:59");
		//查询用户操作统计数据
		List<AccessCategory> action = this.analysisdao.findAllAccessCategoryList(accesscategory);
		//获取新增用户量
		AccessCategory addUseres = this.analysisdao.findNewUserAccessCategory(accesscategory);
		addUseres.setName("新增用户量");
		addUseres.setAction("NewUser");
		action.add(addUseres);
		//获取累计用户量
		AccessCategory allUseres = this.analysisdao.findAllUserAccessCategory(accesscategory);
		allUseres.setName("累计用户量");
		allUseres.setAction("AllUser");
		action.add(allUseres);
		//获取使用用户量
		AccessCategory useUseres = this.analysisdao.findUseUserAccessCategory(accesscategory);
		useUseres.setName("使用用户量");
		useUseres.setAction("UseUser");
		action.add(useUseres);
		//获取点播用户量
		AccessCategory demandUseres = this.analysisdao.findDemandUserAccessCategory(accesscategory);
		demandUseres.setName("点播用户量");
		demandUseres.setAction("DemandUser");
		action.add(demandUseres);
		accesscategory.setEndtime(accesscategory.getEndtime().substring(0, 10));
		return action;
	}
	public PagedModelList<AccessCategory> findAccessDateList(AccessCategory accesscategory,int pageNo,int pageRow) {
		accesscategory.setEndtime(accesscategory.getEndtime()+" 23:59:59");
		List<AccessCategory> list = this.analysisdao.findAccessDate(accesscategory, new RowBounds((pageNo - 1) * pageRow, pageRow));
		int count=this.analysisdao.findCount(accesscategory);
		PagedModelList<AccessCategory> pml = new PagedModelList<AccessCategory>(pageNo, pageRow, count);
		pml.addModels(list);
		accesscategory.setEndtime(accesscategory.getEndtime().substring(0, 10));
		return pml;
	}
	 public static String getCurrentDate() {
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 return sdf.format(new Date());
	 }
	private static String getCurrentStringDatePremonth(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar=Calendar.getInstance();
		calendar.add(Calendar.MONTH, -1);
		return sdf.format(calendar.getTime());
	}
	public JSONArray getRegGraphData(AccessCategory accesscategory) {
		accesscategory.setEndtime(accesscategory.getEndtime()+" 23:59:59");
		JSONArray result=new JSONArray();
		List<AccessCategory> list =new ArrayList<AccessCategory>();
		if("1".equals(accesscategory.getShowtype())||accesscategory.getShowtype()==null)
			list = this.analysisdao.getRegGraphData(accesscategory);
		else
			list = this.analysisdao.getRegGraphDataDist(accesscategory);
		for(AccessCategory ac:list){
			JSONArray array=new JSONArray();
			array.add(ac.getRecordTime());
			array.add(ac.getCounter());
			result.add(array);
		}
		accesscategory.setEndtime(accesscategory.getEndtime().substring(0, 10));
		return result;
	}
	
	/**
	 * 用户量图表数据
	 * @param accesscategory
	 * @return
	 */
	public JSONArray getRegGraphData4User(AccessCategory accesscategory) {
		JSONArray result=new JSONArray();
		List<AccessCategory> list = new ArrayList<AccessCategory>();
		
		if("1".equals(accesscategory.getShowtype())||accesscategory.getShowtype()==null)//为空或者1是按日显示
			list = getDataByDay(accesscategory,"1");
		else
			list = getDataByDay(accesscategory,"2");
		for(AccessCategory ac:list){
			JSONArray array=new JSONArray();
			array.add(ac.getRecordTime());
			array.add(ac.getCounter());
			result.add(array);
		}
		return result;
	}
	
	
	/**
	 * 用户量按日查询图表数据
	 */
	private List<AccessCategory> getDataByDay(AccessCategory accesscategory,String type){
		List<AccessCategory> list =new ArrayList<AccessCategory>();
		String action = accesscategory.getAction();
		String pattern = null;
		if("1".equals(type)){
			pattern = "yyyy-MM-dd";
		}else{
			pattern = "yyyy-MM";
		}
		
		Date starttime = DateUtil.parseDate(accesscategory.getStarttime(), pattern);
		Date endtime = DateUtil.parseDate(accesscategory.getEndtime(), pattern);
		Date dotime = starttime;
		while(dotime.getTime() <= endtime.getTime()){
			AccessCategory ac = new AccessCategory();
			ac.setStarttime(DateUtil.parseDate(dotime, "yyyy-MM-dd")+" 00:00:00");
			if("1".equals(type)){
				ac.setEndtime(DateUtil.parseDate(dotime,pattern)+" 23:59:59");
			}else{
				ac.setEndtime(DateUtil.parseDate(dotime,pattern)+"-"+DateUtil.getMonthMaxDay(dotime)+" 23:59:59");
			}
			if("NewUser".equals(action)){//新增用户量
				ac = this.analysisdao.findNewUserAccessCategory(ac);//查询出一天的用户量
			}else if("AllUser".equals(action)){
				ac = this.analysisdao.findAllUserAccessCategory(ac);
			}else if("UseUser".equals(action)){
				ac = this.analysisdao.findUseUserAccessCategory(ac);
			}else if("DemandUser".equals(action)){
				ac = this.analysisdao.findDemandUserAccessCategory(ac);
			}
			ac.setRecordTime(DateUtil.parseDate(dotime, pattern));//设置日期
			
			if("1".equals(type)){
				dotime = DateUtil.addDay(dotime, 1);
			}else{
				dotime = DateUtil.addMonth(dotime, 1);
			}
			list.add(ac);
		}
		return list;
	}
	
	
    public List<Map<String, Object>> exportAnalysis(AccessCategory accesscategory) {
        if(StringUtils.isEmpty(accesscategory.getStarttime())||StringUtils.isEmpty(accesscategory.getEndtime())){
            accesscategory.setEndtime(getCurrentDate());
            accesscategory.setStarttime(getCurrentStringDatePremonth());
        }
        List<Map<String, Object>> action  = this.analysisdao.exportAccessCategoryList(accesscategory);
        
        //获取新增用户量
        Map<String, Object> map1 = new HashMap<String, Object>();
		AccessCategory addUseres = this.analysisdao.findNewUserAccessCategory(accesscategory);
  		map1.put("desc", "新增用户量");
  		map1.put("action", "NewUser");
  		map1.put("counter", addUseres.getCounter());
  		map1.put("maxtime", addUseres.getMaxtime());
  		action.add(map1);
  		//获取累计用户量
  		Map<String, Object> map2 = new HashMap<String, Object>();
  		AccessCategory allUseres = this.analysisdao.findAllUserAccessCategory(accesscategory);
  		map2.put("desc", "累计用户量");
  		map2.put("action", "AllUser");
  		map2.put("counter", allUseres.getCounter());
  		map2.put("maxtime", allUseres.getMaxtime());
  		action.add(map2);
  		//获取使用用户量
  		Map<String, Object> map3 = new HashMap<String, Object>();
  		AccessCategory useUseres = this.analysisdao.findUseUserAccessCategory(accesscategory);
  		map3.put("desc", "使用用户量");
  		map3.put("action", "UseUser");
  		map3.put("counter", useUseres.getCounter());
  		map3.put("maxtime", useUseres.getMaxtime());
  		action.add(map3);
  		//获取点播用户量
  		Map<String, Object> map4 = new HashMap<String, Object>();
  		AccessCategory demandUseres = this.analysisdao.findDemandUserAccessCategory(accesscategory);
  		map4.put("desc", "点播用户量");
  		map4.put("action", "DemandUser");
  		map4.put("counter", demandUseres.getCounter());
  		map4.put("maxtime", demandUseres.getMaxtime());
  		action.add(map4);
        return action;
    }
}
