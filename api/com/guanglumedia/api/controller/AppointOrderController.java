package com.guanglumedia.api.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.ParseException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.rest.BaseController;

@Controller
@RequestMapping("AppointOrder")
public class AppointOrderController extends BaseController {
	

	@RequestMapping("sendOrder")
	@ResponseBody
	/**
	 * 打开订单页 获取价格
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public Map<String, Object> sendOrder(HttpServletRequest request) throws IOException, ServletException {
		//PrintWriter out = response.getWriter();
		Map<String,Object> response=new HashMap<String, Object>();
		//创建httpclient对象
		CloseableHttpClient client = HttpClients.createDefault();
		//创建method对象
		HttpPost httppost = new HttpPost("iPanel.eventFrame.comfirmUrl");
		//创建参数队列
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		formparams.add(new BasicNameValuePair("typeId",request.getParameter("typeId")));
		formparams.add(new BasicNameValuePair("vodId", request.getParameter("vodId")));
		formparams.add(new BasicNameValuePair("playType",request.getParameter("playType")));
		formparams.add(new BasicNameValuePair("baseFlag",request.getParameter("baseFlag")));
		formparams.add(new BasicNameValuePair("idType",request.getParameter("idType")));
		formparams.add(new BasicNameValuePair("appBackUrl",request.getParameter("appBackUrl")));
		
		UrlEncodedFormEntity entity;
		String mes= null;
		try {
			entity = new UrlEncodedFormEntity(formparams, "UTF-8");
			httppost.setEntity(entity);
			HttpResponse httpresponse = client.execute(httppost);
			HttpEntity httpEntity = httpresponse.getEntity();
			if (httpEntity != null) {
				mes = EntityUtils.toString(httpEntity);
				response.put("mes", mes);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}finally{
			client.close();
		}
		return makeSuccessResponse(response);
	}
	
	@RequestMapping("order")
	@ResponseBody
	/**
	 * 订购影片
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> order(HttpServletRequest request)throws Exception{
		Map<String,Object> response=new HashMap<String, Object>();
		CloseableHttpClient client = HttpClients.createDefault();
		HttpPost httppost = new HttpPost(request.getParameter("url")+"http://192.168.5.233:8080/dyyx/ipanelBuyMsg.do");
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		formparams.add(new BasicNameValuePair("userid",request.getParameter("userid")));
		formparams.add(new BasicNameValuePair("vodId", request.getParameter("vodId")));
		formparams.add(new BasicNameValuePair("price",request.getParameter("price")));
		formparams.add(new BasicNameValuePair("type",request.getParameter("type")));
		formparams.add(new BasicNameValuePair("status",request.getParameter("status")));
		
		UrlEncodedFormEntity entity;
		String mes= null;
		try {
			entity = new UrlEncodedFormEntity(formparams, "UTF-8");
			httppost.setEntity(entity);
			HttpResponse httpresponse = client.execute(httppost);
			HttpEntity httpEntity = httpresponse.getEntity();
			if (httpEntity != null) {
				mes = EntityUtils.toString(httpEntity);
				response.put("mes", mes);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}finally{
			client.close();
		}
		return makeSuccessResponse(response);
	}
	
	@RequestMapping("playMovie")
	@ResponseBody
	/**
	 * 播放影片
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> playMovie(HttpServletRequest request)throws Exception{
		Map<String,Object> response=new HashMap<String, Object>();
		CloseableHttpClient client = HttpClients.createDefault();
		HttpPost httppost = new HttpPost("http://192.168.5.233:8080/dyyx/ipanelBuyMsg.do");
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		formparams.add(new BasicNameValuePair("userid",request.getParameter("userid")));
		formparams.add(new BasicNameValuePair("vodId", request.getParameter("vodId")));
		formparams.add(new BasicNameValuePair("price",request.getParameter("price")));
		formparams.add(new BasicNameValuePair("type",request.getParameter("type")));
		formparams.add(new BasicNameValuePair("status",request.getParameter("status")));
		
		UrlEncodedFormEntity entity;
		String mes= null;
		try {
			entity = new UrlEncodedFormEntity(formparams, "UTF-8");
			httppost.setEntity(entity);
			HttpResponse httpresponse = client.execute(httppost);
			HttpEntity httpEntity = httpresponse.getEntity();
			if (httpEntity != null) {
				mes = EntityUtils.toString(httpEntity);
				response.put("mes", mes);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}finally{
			client.close();
		}
		return makeSuccessResponse(response);
	}
	

}
