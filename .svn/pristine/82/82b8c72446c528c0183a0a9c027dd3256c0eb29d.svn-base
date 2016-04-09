package com.guanglumedia.util;

import java.io.File;
import java.io.FileWriter;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

public class ADIUtils {
	public static String ModifyXMLFile(String adifile,String operateType,Map<String,String> value) {
		File adi = new File(adifile);
        try {
            SAXReader saxReader = new SAXReader();
            Document document = saxReader.read(new File(ADIUtils.class.getResource("/").getPath()+"model_adi.xml"));
            String asset_name = value.get("Asset_Name");
            String description = value.get("Description");
            String creation_data = value.get("Creation_Date");
            String provider_ID = value.get("Provider_ID");
            String asset_ID = value.get("Asset_ID");
            
            Element pack = (Element) document.selectNodes("/ADI/Metadata/AMS").get(0);
    		pack.attribute("Asset_Name").setText(asset_name.replaceAll(" ", ""));
    		pack.attribute("Description").setText(description);
    		pack.attribute("Creation_Date").setText(creation_data);//格式为yyyy-MM-dd
    		pack.attribute("Provider_ID").setText(provider_ID);
    		pack.attribute("Asset_ID").setText(asset_ID);
    		Element title = (Element) document.selectNodes("/ADI/Asset/Metadata/AMS").get(0);
    		title.attribute("Asset_Name").setText(asset_name);
    		title.attribute("Description").setText(description);
    		title.attribute("Creation_Date").setText(creation_data);//格式为yyyy-MM-dd
    		title.attribute("Provider_ID").setText(provider_ID);
    		title.attribute("Asset_ID").setText(asset_ID);
    		
    		//节目信息
    		List program_data = document.selectNodes("/ADI/Asset/Metadata/App_Data");
//    		((Element)program_data.get(0)).attribute("Value").setText(value.get("Title"));//节目标题
//    		((Element)program_data.get(1)).attribute("Value").setText(value.get("Title_FG"));//外语标题
//    		((Element)program_data.get(2)).attribute("Value").setText(value.get("TitleSearchCode"));//节目搜索码：数字字母
//    		((Element)program_data.get(3)).attribute("Value").setText(value.get("Summary_Medium"));//节目简介
//    		((Element)program_data.get(5)).attribute("Value").setText(value.get("SupplyLang"));//节目语种
//    		((Element)program_data.get(8)).attribute("Value").setText(value.get("DirectorName"));//导演
//    		((Element)program_data.get(11)).attribute("Value").setText(value.get("Actors_Display"));//主演
//    		((Element)program_data.get(16)).attribute("Value").setText(value.get("IsSitcom"));//资产类型
//    		((Element)program_data.get(18)).attribute("Value").setText(value.get("IsRecommend"));//是否推荐
//    		((Element)program_data.get(19)).attribute("Value").setText(value.get("Suggested_Price"));//参考价格
//    		((Element)program_data.get(20)).attribute("Value").setText(value.get("National"));//节目产地
//    		((Element)program_data.get(22)).attribute("Value").setText(value.get("NewFlag"));//节目是否有new
    		for (int i = 0; i < program_data.size(); i++) {
    			String dataName = ((Element)program_data.get(i)).attribute("Name").getText();
    			Set<String> key = value.keySet();
    			for (String keyName : key) {
					if(dataName.equals(keyName)){
						((Element)program_data.get(i)).attribute("Value").setText(value.get(keyName));
						break;
					}
				}
			}
    		
    		
    		Element asset = (Element) document.selectNodes("/ADI/Asset").get(0);
    		
    		//修改操作:直接删除
    		if("modify".equals(operateType)){
    			Element mediu = (Element) asset.selectNodes("Asset").get(0);
    			asset.remove(mediu);
    		}else{
    			//删除操作：在package上添加verb="delete"
    			if("delete".equalsIgnoreCase(operateType)){
    				pack.addAttribute("Verb", "DELETE");
    			}
    			Element video = (Element) asset.selectNodes("Asset/Metadata/AMS").get(0);
    			video.attribute("Asset_Name").setText(asset_name+"("+value.get("CodeFormat")+")");
    			video.attribute("Description").setText(description);
    			video.attribute("Creation_Date").setText(creation_data);//格式为yyyy-MM-dd
    			video.attribute("Provider_ID").setText(provider_ID);
    			video.attribute("Asset_ID").setText(asset_ID+"m");
    			video.attribute("Asset_Class").setText(value.get("Asset_Class"));
    			
    			//资源信息
    			List video_data = asset.selectNodes("Asset/Metadata/App_Data");
//        		((Element)video_data.get(0)).attribute("Value").setText(value.get("Run_Time"));//片长
//        		((Element)video_data.get(1)).attribute("Value").setText(value.get("HDContent"));//类型：高清
//        		((Element)video_data.get(2)).attribute("Value").setText(value.get("Bit_Rate"));//码率
//        		((Element)video_data.get(4)).attribute("Value").setText(value.get("CodeFormat"));//文件编码格式
//        		((Element)video_data.get(5)).attribute("Value").setText(value.get("Encryption"));//是否加密
    			for (int i = 0; i < video_data.size(); i++) {
        			String dataName = ((Element)video_data.get(i)).attribute("Name").getText();
        			Set<String> key = value.keySet();
        			for (String keyName : key) {
    					if(dataName.equals(keyName)){
    						((Element)video_data.get(i)).attribute("Value").setText(value.get(keyName));
    						break;
    					}
    				}
    			}
    			
    			Element url = (Element) asset.selectNodes("Asset/Content").get(0);
    			url.attribute("Value").setText(value.get("url"));
    		}
    		
            try {
                XMLWriter writer = new XMLWriter(new FileWriter(adi));
                writer.write(document);
                writer.close();
                System.out.println("adi文件地址："+adi.getAbsolutePath());
                return adi.getAbsolutePath();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
	}
	
//	public static void main(String[] args) {
//		Map<String,String> value = new HashMap<String, String>();
//		value.put("Asset_Class", "movie");
//		value.put("Asset_Name", "捉妖记");
//		value.put("Creation_Date","2015-09-08");
//		value.put("Provider_ID", "www.sofa.com");
//		value.put("Asset_ID", "sofa1234567809876543");
//		value.put("url", "/test/safdj.avi");
//		value.put("Run_Time", "120");
//		value.put("TitleSearchCode", "120,gost");
//		Date currentDate = new Date();
//		System.out.println(currentDate.getTime());
//		System.out.println(new Date().getTime());
//		System.out.println(ADIUtils.ModifyXMLFile("create_adi_"+currentDate.getTime()+".xml","inject",value));
//	}

}
