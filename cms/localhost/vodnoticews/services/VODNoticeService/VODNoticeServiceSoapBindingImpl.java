/**
 * VODNoticeServiceSoapBindingImpl.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package localhost.vodnoticews.services.VODNoticeService;

import org.springframework.beans.factory.annotation.Autowired;

import com.guanglumedia.cms.movie.dao.InjectDao;
import com.guanglumedia.cms.movie.dao.MovieDao;
import com.guanglumedia.cms.movie.dao.PreviewDao;
import com.guanglumedia.cms.movie.entity.Inject;
import com.guanglumedia.cms.movie.entity.Movie;
import com.guanglumedia.cms.movie.entity.PreView;

public class VODNoticeServiceSoapBindingImpl implements localhost.vodnoticews.services.VODNoticeService.VODNoticeService{
	
	@Autowired
	private InjectDao Injectdao;
	@Autowired
	private MovieDao Moviedao;
	@Autowired
	private PreviewDao Previewdao;
	
    public VODNoticeService.ParaOut downloadFinishNotice(java.lang.String id) throws java.rmi.RemoteException {
		int videoid = Integer.parseInt(id);
	  	Inject inject = Injectdao.getInjectById(videoid);
	  	
	  	int flag = 0;
	  	//修改影片或者片花的状态
		if("1".equals(inject.getVideotype())){
			int movieid = Integer.parseInt(inject.getMovieid());
			Movie movie = Moviedao.getMovieById(movieid);
			movie.setStatus("1");
			flag = Moviedao.updateMovie(movie);
		}else {
			int previewid = Integer.parseInt(inject.getPreviewid());
			PreView preview = Previewdao.getPreViewById(previewid);
			preview.setStatus("1");
			flag = Previewdao.updatePreView(preview);
		}
	  	
		//修改注入状态
		inject.setStatus("1");
		int i = Injectdao.updateInject(inject);
		if(i > 0 && flag > 0){
			return new ParaOut("同步成功",true);
		}else{
			return new ParaOut("同步失败",false);
		}
    	
    }

    public VODNoticeService.ParaOut programDeleteNotice(java.lang.String id) throws java.rmi.RemoteException {
    	int Videoid = Integer.parseInt(id);
    	Inject inject = Injectdao.getInjectById(Videoid);
	  	
	  	int flag = 0;
	  	//修改影片或者片花的状态
		if("1".equals(inject.getVideotype())){
			int movieid = Integer.parseInt(inject.getMovieid());
			Movie movie = Moviedao.getMovieById(movieid);
			movie.setStatus("0");
			flag = Moviedao.updateMovie(movie);
		}else {
			int previewid = Integer.parseInt(inject.getPreviewid());
			PreView preview = Previewdao.getPreViewById(previewid);
			preview.setStatus("0");
			flag = Previewdao.updatePreView(preview);
		}
		
		
		if(Injectdao.getInjectById(Videoid) == null && flag > 0){
			return new ParaOut("同步成功",true);
		}else{
			return new ParaOut("同步失败",false);
		}
    }

}
