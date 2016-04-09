package com.guanglumedia.cms.movie.service;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guanglumedia.cms.common.Feedback;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.movie.dao.InjectDao;
import com.guanglumedia.cms.movie.dao.MovieDao;
import com.guanglumedia.cms.movie.dao.PreviewDao;
import com.guanglumedia.cms.movie.entity.Inject;
import com.guanglumedia.cms.movie.entity.Movie;
import com.guanglumedia.cms.movie.entity.PreView;
import com.guanglumedia.util.ADIUtils;
import com.guanglumedia.util.FTPTools;
import com.guanglumedia.util.HwSoapUtils;
import com.guanglumedia.util.VideoFormatUtils;
import com.huawei.dtvmw.mediaasset.soap.OperateResult;

@Service
public class InjectService {
	@Autowired
	private InjectDao Injectdao;
	@Autowired
	private MovieDao Moviedao;
	@Autowired
	private PreviewDao Previewdao;
	
	Logger logger = Logger.getLogger(InjectService.class);
	
 	public PagedModelList<Inject> findAllInjectList(Inject inject, int pageNo,int pageRow) throws UnsupportedEncodingException {
	    if (inject.getVideoname() != null) {
            String videoname = new String(inject.getVideoname().getBytes("ISO-8859-1"), "utf-8");
            inject.setVideoname(videoname);
        }
	    if (inject.getUrl() != null) {
            String url = new String(inject.getUrl().getBytes("ISO-8859-1"), "utf-8");
            inject.setUrl(url);
        }
		List<Inject> list = this.Injectdao.findInjectList(inject, new RowBounds((pageNo - 1) * pageRow, pageRow));
		int count=this.Injectdao.findCount(inject);
		PagedModelList<Inject> pml = new PagedModelList<Inject>(pageNo, pageRow, count);
		pml.addModels(list);
		return pml;
	}

	public Inject getInjectById(int id) {
		return Injectdao.getInjectById(id);
	}

	public int UpdateInject(Inject inject) {
		return Injectdao.updateInject(inject);
	}
	
	public Feedback AddInject(Inject  inject) {
		
		//1.生成adi.xml文件
		Map<String,String> value = updateADI(inject);
		if("NoSupport".equals(value.get("CodeFormat"))){
			return Feedback.fail("文件格式不支持");
		}
		
		String adiFile = "add_inject_"+new Date().getTime()+".xml";
		String orginfilename = ADIUtils.ModifyXMLFile(adiFile, "inject", value);
		logger.info("adi文件创建完成...................");
		//2.将adi文件上传到ftp服务器上
		if(FTPTools.upload(adiFile, orginfilename)){
			//删除本地的adi文件
			new File(orginfilename).delete();
			logger.info("adi文件上传完成...................");
		}
		//3.通知华为vod系统
			OperateResult or = HwSoapUtils.sendAdiInfo(adiFile);
			if(0 == or.getReturnCode()){
			    logger.info("注入成功");
				inject.setStatus("0");
				int i = Injectdao.addInject(inject);
				if(i>0){
					return Feedback.success("注入成功");
				}else{
					return Feedback.fail("添加失败");
				}
			}else{
			    logger.info(or.getMessage());
				return Feedback.fail(or.getMessage());
			}
	}

	public int DelInject(int id) {
		Inject video = Injectdao.getInjectById(id);
		Map<String, String> value = updateADI(video);
		
		String adiFile = "del_inject_"+new Date().getTime()+".xml";
		String orginfilename = ADIUtils.ModifyXMLFile(adiFile, "delete", value);
		if(FTPTools.upload(adiFile, orginfilename)){
			new File(orginfilename).delete();
		}
		OperateResult or = HwSoapUtils.sendAdiInfo(adiFile);
		
		if(Injectdao.delInject(id)>0){
			return or.getReturnCode();
		}else{
			return 100;
		}
		
	}
	
	public Feedback ModifyInject(int id){
		
		Inject inject = Injectdao.getInjectById(id);
		
		Map<String,String> value = updateADI(inject);
		
		String adiFile = "modify_inject_"+new Date().getTime()+".xml";
		String orginfilename = ADIUtils.ModifyXMLFile(adiFile, "modify", value);
		if(FTPTools.upload(adiFile, orginfilename)){
			new File(orginfilename).delete();
		}
		
		OperateResult or = HwSoapUtils.sendAdiInfo(adiFile);
		if(0 == or.getReturnCode()){
			inject.setStatus("0");
			int i = Injectdao.updateInject(inject);
			if(i>0){
				return Feedback.success("更新成功");
			}else{
				return Feedback.fail("更新失败");
			}
		}else{
			return Feedback.fail(or.getMessage());
		}
	}
	
	public Map<String,String> updateADI(Inject inject){
		Map<String, String> value = new HashMap<String, String>();
		
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(currentTime);
		
		if("1".equals(inject.getVideotype())){
			int movieid = Integer.parseInt(inject.getVideoid()==null?inject.getMovieid():inject.getVideoid());
			Movie movie = Moviedao.getMovieById(movieid);
			value.put("Asset_Class", "movie");
			
			value.put("Asset_Name", movie.getName());
			value.put("Asset_ID", movie.getMediaID());
			
			value.put("Title", movie.getName());
			value.put("Title_FG", movie.geteName());
			value.put("Summary_Medium", movie.getIntro());
			value.put("DirectorName", movie.getDirector().replaceAll("/", ","));
			value.put("Actors_Display", movie.getActor().replaceAll("/", ","));
			value.put("Suggested_Price", Moviedao.findPrice(movie.getVodID()));
			value.put("Subject_IDs", movie.getVodID());
			
			
			String run_time = null;
			int min = Integer.parseInt(movie.getMins());
			int h = min/60;
			int m = min%60;
			if(h>9){
				if(m>9){
					run_time = ""+h+":"+m+":00";
				}else{
					run_time = ""+h+":0"+m+":00";
				}
			}else{
				if(m>9){
					run_time = "0"+h+":"+m+":00";
				}else{
					run_time = "0"+h+":0"+m+":00";
				}
			}
			
			value.put("Run_Time", run_time);
			value.put("HDContent", "1".equals(movie.getType())?"N":"Y");
		}else {
			int previewid = Integer.parseInt(inject.getVideoid()==null?inject.getPreviewid():inject.getVideoid());
			PreView preview = Previewdao.getPreViewById(previewid);
			value.put("Asset_Class", "movie");
			
			value.put("Asset_Name", preview.getName());
			value.put("Asset_ID", preview.getMediaID());
			value.put("Suggested_Price", "0.00");
			value.put("Title", preview.getName());
			value.put("DirectorName", preview.getDirector());
			value.put("Actors_Display", preview.getActor());
			
		}
		
		
		value.put("Creation_Date",dateString);
		value.put("Description","www.cqvod.com");
		value.put("Provider_ID","sfyx");
		value.put("url", inject.getUrl());
		
		String codeFormat = VideoFormatUtils.Format2Encode(inject.getFiletype());
		value.put("CodeFormat", codeFormat);
		return value;
		
	}
    public int DelInjectByMovieId(int movieId) {
        return Injectdao.DelInjectByMovieId(movieId);
    }

    public int getInjectByMovieId(int movieId) {
        return Injectdao.getInjectByMovieId(movieId);
    }
}
