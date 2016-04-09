package com.guanglumedia.util;

import java.rmi.RemoteException;
import java.util.Properties;

import org.apache.log4j.Logger;

import com.guanglumedia.common.util.PropertiesUtils;
import com.huawei.dtvmw.mediaasset.soap.OperateResult;
import com.huawei.dtvmw.mediaasset.soap.WebPublish;
import com.huawei.dtvmw.mediaasset.soap.WebPublishProxy;

public class HwSoapUtils {
	
    static Logger logger = Logger.getLogger(HwSoapUtils.class);
	public static OperateResult sendAdiInfo(String adiFile){
		Properties prop=PropertiesUtils.getProperties("INJECT-CQ.properties");
		StringBuffer ftpPath = new StringBuffer();
		String ftpService = prop.getProperty("ftpService");
		String username = prop.getProperty("username");
		String password = prop.getProperty("password");
		String adiPath = prop.getProperty("adi_path");
		String endpoint = prop.getProperty("inject_url");
		
		ftpPath.append("ftp://").append(username).append(":").append(password).append("@").append(ftpService).append("/").append(adiPath).append("/");
		String ftp = ftpPath.toString();
		
		String provider_id = prop.getProperty("provider_id");
		logger.info(endpoint);
		logger.info("接口参数：ftp="+ftp+"----adifile:"+adiFile+"----providerid:"+provider_id);
		OperateResult or = null;
		try {
			WebPublishProxy wpp = new WebPublishProxy(endpoint);
			WebPublish wp = wpp.getWebPublish();
			or = wp.publish(ftp,adiFile,provider_id);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return or;
	}
}
