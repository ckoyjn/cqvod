package com.guanglumedia.common.listener;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import org.apache.log4j.Logger;

import com.guanglumedia.common.util.StringUtils;

public class DistrictCache {
	private static final Logger LOGGER = Logger.getLogger(DistrictCache.class);

  public static void reload(List<District> districts){
	List<District> areaPro = new ArrayList<District>();
	List<District> areaCity = new ArrayList<District>();
	List<District> areaDist = new ArrayList<District>();
	for (District district : districts) {
		if (1 == district.getLevel())
			areaPro.add(district);
		else if (2 == district.getLevel())
			areaCity.add(district);
		else if (3 == district.getLevel()) {
			areaDist.add(district);
		}
    }
	Cache cache = getCache();
	Element ele = cache.get("districty_key_privince");
	if (ele == null) {
		ele = new Element("districty_key_privince", areaPro);
		cache.put(ele);
    } else {
    	@SuppressWarnings("unchecked")
		List<District> nodes = (List<District>)ele.getObjectValue();
    	if (!areaPro.containsAll(nodes)) {
    		ele = new Element("districty_key_privince", areaPro);
    		cache.put(ele);
    	}
    }
	ele = cache.get("district_key_city");
	if (ele == null) {
		ele = new Element("district_key_city", areaCity);
		cache.put(ele);
    } else {
    	@SuppressWarnings("unchecked")
		List<District> nodes = (List<District>)ele.getObjectValue();
    	if (!areaCity.containsAll(nodes)) {
    		ele = new Element("district_key_city", areaCity);
    		cache.put(ele);
    	}
    }
	ele = cache.get("district_key_district");
		if (ele == null) {
			ele = new Element("district_key_district", areaDist);
			cache.put(ele);
    } else {
    	@SuppressWarnings("unchecked")
		List<District> nodes = (List<District>)ele.getObjectValue();
    	if (!areaDist.containsAll(nodes)) {
    		ele = new Element("district_key_district", areaDist);
    		cache.put(ele);
    	}
    }
		LOGGER.info("地区城市内容更新");
  }

  public static List<District> getProvinces(){
	  Element element = getElement("districty_key_privince");
	  if (element == null) {
		  return null;
	  }
	  @SuppressWarnings("unchecked")
	  List<District> nodes = (List<District>)element.getObjectValue();
	  return nodes;
  }

  public static List<District> getCitys(int proId){
	  Element element = getElement("district_key_city");
	  if (element == null) {
		  return null;
	  }
	  @SuppressWarnings("unchecked")
	  List<District> nodes = (List<District>)element.getObjectValue();
	  List<District> citys = new ArrayList<District>();
	  for (District dis : nodes) {
		  if (proId == dis.getUpid()) {
			  citys.add(dis);
		  }
	  }
	  return citys;
  }

  public static List<District> getDistricts(int cityId){
	  Element element = getElement("district_key_district");
	  if (element == null) {
		  return null;
	  }
	  @SuppressWarnings("unchecked")
	  List<District> nodes = (List<District>)element.getObjectValue();
	  List<District> citys = new ArrayList<District>();
	  for (District dis : nodes) {
		  if (cityId == dis.getUpid()) {
			  citys.add(dis);
		  }
    }
	return citys;
  }

  public static District getCityByAreaCode(String areaCode){
	  if (StringUtils.isEmpty(areaCode)) return null;
	  Element element = getElement("district_key_city");
	  if (element == null) {
		  return null;
	  }
	  @SuppressWarnings("unchecked")
	  List<District> nodes = (List<District>)element.getObjectValue();
	  for (District dis : nodes) {
		  if (areaCode.equals(dis.getAreacode())) {
			  return dis;
		  }
	  }
	  return null;
  }

  public static String getCityNameByAreaCode(String areaCode){
	  District dis = getCityByAreaCode(areaCode);
	  if (dis == null)
		  return areaCode;
	  return dis.getName();
  }

  public static Map<String, String> getProvincesStr() {
	  List<District> districts = getProvinces();
	  Map<String,String> map = new HashMap<String,String>();
	  if (districts == null) return map;
	  for (District district : districts) {
		  map.put(String.valueOf(district.getId()), district.getName());
	  }
	  return map;
  }

  private static Element getElement(String cacheKey) {
	  return getCache().get(cacheKey);
  }

  private static Cache getCache() {
	  CacheManager manager = CacheManager.getInstance();
	  return manager.getCache("sysCache");
  }
}