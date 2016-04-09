package com.guanglumedia.api.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.guanglumedia.api.dao.OrderRestDao;
import com.guanglumedia.api.entity.EpgEvcn;

@Service
public class OrderRestService {
    @Autowired
    private OrderRestDao dao;
    
    @Transactional
    public boolean addOrder(JSONObject object)
    {
    	if(object.get("evcnid")==null){
    		object.put("type", 0);
    	}else{
    		object.put("type", 1);
    	}
		return dao.addOrder(object)>0;
    }

	public int verifycode(JSONObject jsonObject) {
		
		String evcnid=jsonObject.getString("evcnid");
		EpgEvcn evcn = dao.getEvcn(evcnid);
		if(evcn==null){
			/*电子券不存在*/
			return -6;
		}
		if("1".equals(evcn.getEvcnOrderStatus())){
			/*电子券已被充入过*/
			return -1;
		}
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		String now = df.format(new Date());
		if(now.compareTo(evcn.getEpkDateStart())<0||now.compareTo(evcn.getEpkDateEnd())>0){
			/*电子券不在有效期内*/
			return -2;
		}
		
		double price = jsonObject.getDouble("price");
		if(price>Double.parseDouble(evcn.getEpkPerval())){
			/*电子券金额不足*/
			return -3;
		}
		
		/*更新电子券信息*/
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("smartcardid", jsonObject.get("smartcardid"));
		map.put("pid", jsonObject.get("pid"));
		map.put("evcnOrderStatus", "1");
		map.put("evcnid", jsonObject.get("evcnid"));
		if(dao.updateEvcn(map)<1){
			/*更新电子券状态出错*/
			return -4;
		}
		
		/*调用boss充值接口*/
		int errCode=0;
		String msg="";
		if(errCode!=0){
			/*boss充值失败*/
			map.put("smartcardid", "");
			map.put("pid", "");
			map.put("evcnOrderStatus", "0");
			map.put("evcnid", jsonObject.get("evcnid"));
			dao.updateEvcn(map);
			return -5;
		}
		
		/*登记boss交互信息*/
		Map<String,Object> bosslog = new HashMap<String, Object>();
		bosslog.put("smartcardid",jsonObject.get("smartcardid"));
		bosslog.put("evcnid",evcnid);
		bosslog.put("amount",price);
		bosslog.put("errcode",errCode);
		bosslog.put("msg",msg);
		bosslog.put("type",0);
		dao.addBossLog(bosslog);
		
		return 0;
	}

	public int verifycodeR(JSONObject jsonObject) {
		String evcnid=jsonObject.getString("evcnid");
		String smartcardid=jsonObject.getString("smartcardid");
		double price = jsonObject.getDouble("price");
		
		EpgEvcn evcn = dao.getEvcn(evcnid);
		if(evcn==null){
			/*电子券不存在*/
			return -5;
		}
		if(!smartcardid.equals(evcn.getUserid())){
			/*卡号与电子券号不对应无法退回*/
			return -1;
		}
		
		if(!"1".equals(evcn.getEvcnOrderStatus())){
			/*电子券未充入，无法退回*/
			return -2;
		}
		
		if("1".equals(evcn.getOperateStatus())){
			/*电子券已使用，无法退回*/
			return -3;
		}
		
		
		/*调用boss充值撤回接口*/
		int errCode=0;
		String msg="";
		if(errCode!=0){
			/*boss充值撤回失败*/
			return -4;
		}
		
		/*更新电子券状态*/
		Map<String,Object>	map = new HashMap<String,Object>();
		map.put("smartcardid", "");
		map.put("pid", "");
		map.put("evcnOrderStatus", "0");
		map.put("evcnid", jsonObject.get("evcnid"));
		dao.updateEvcn(map);
		
		/*登记boss交互信息*/
		Map<String,Object> bosslog = new HashMap<String, Object>();
		bosslog.put("smartcardid",jsonObject.get("smartcardid"));
		bosslog.put("evcnid",evcnid);
		bosslog.put("amount",price);
		bosslog.put("errcode",errCode);
		bosslog.put("msg",msg);
		bosslog.put("type",1);
		dao.addBossLog(bosslog);
		return 0;
	}

	public boolean addOrderOuter(Map<String, Object> map) {
		map.put("type", 0);
		return dao.addOrderOuter(map)>0;
	}
	
	public boolean addPlayRecord(Map<String, Object> map) {
		return dao.addPlayRecord(map)>0;
	}
	
	public int getProgrameId(String vodid) throws Exception{
	    String [] mediaid =  vodid.split("-");
	    return dao.getProgrameId(mediaid[0]);
	}
	
	public int getPreviewId(String vodid) throws Exception{
	    String [] mediaid =  vodid.split("-");
	    return dao.getPreviewId(mediaid[0]);
	}
	
	public int addwatchrecord(Map<String, Object> map){
	    return dao.addwatchrecord(map);
	}
}
