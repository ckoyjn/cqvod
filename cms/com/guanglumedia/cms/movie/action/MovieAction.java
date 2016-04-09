package com.guanglumedia.cms.movie.action;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Collections;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.nuxeo.common.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.guanglumedia.api.utils.DateUtil;
import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.Feedback;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.movie.entity.Movie;
import com.guanglumedia.cms.movie.entity.Product;
import com.guanglumedia.cms.movie.service.InjectService;
import com.guanglumedia.cms.movie.service.MovieService;
import com.guanglumedia.cms.movie.service.ProductService;
import com.guanglumedia.util.GetServerRealPathTools;

@Controller
@RequestMapping(value="/cms/movie")
public class MovieAction extends BaseAction{
	@Autowired
	private MovieService movieservice;
	@Autowired
	private ProductService productservice;
	@Autowired
	private InjectService  injectService;
	
	@RequestMapping(value="findmovielist")
	public String FindMovieList(Movie movie,HttpServletRequest request, Model model) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		PagedModelList<Movie> pagedModelList = this.movieservice.findAllMovieList(movie,getPageNo(request),getPageRow(request));
		model.addAttribute("pml", pagedModelList);
		model.addAttribute("movies", movie);
		return "movie/ListMovie";
	}
	
	@RequestMapping(value="tomodifymovie")
	public String ToModifyMovie(@RequestParam("id")int id,@RequestParam("Edit")String edit,HttpServletRequest request, Model model){
		List<Product>products=productservice.findAllProductList();
		List<String> existsIdentifies = movieservice.getExistsIdentifies();
		List<String> identifys = GetServerRealPathTools.findAllIdentifys(existsIdentifies);
		if(id>0){
			Movie movie=movieservice.getMovieById(id);
			model.addAttribute("MovieInfo",movie);
			identifys.add(movie.getIdentify());
		}
		Collections.sort(identifys);
		model.addAttribute("identifys", identifys);
		model.addAttribute("products", products);
		model.addAttribute("Edit", edit);
		model.addAttribute("MovieID",id);
		return "movie/ModifyMovie";
	}
	
	

	@RequestMapping(value="modifymovie")
	@ResponseBody
	public Feedback ModifyMovie(Movie movie,HttpServletRequest request, Model model){
		int result=-1;
		String message="更新失败";
		try{
			if(movieservice.findRank(movie.getRank(),movie.getId())>0){
				message="排序的序号不能相同";
			}else if(movieservice.checkMediaID(movie.getMediaID(), movie.getId())>0){
				message="内部ID不能重复";
			}else{
				int ret = movieservice.checkRelation(movie.getId());
				if(ret<0){
					switch (ret) {
					case -1:
						message = "影片在首页推荐中尚未下架";
						break;
					case -2:
						message = "影片还存在未过期用户订单";
						break;
					default:
						break;
					}
				}else{
					if(movie.getStatus()!=null){
						if(movie.getStatus().equals("1")){
							String date=DateUtil.getCurrentDateTime();
							movie.setOnlineTime(date);
						}else if(!movie.getStatus().equals("1")&&!movie.getStatus().equals("2")){
							movie.setDownlineTime(DateUtil.getCurrentDateTime());
						}
					}
					result=this.movieservice.UpdateMovie(movie);
				}
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
	
	@RequestMapping(value="addmovie")
	@ResponseBody
	public Feedback AddMovie(Movie movie,HttpServletRequest request, Model model){
		int result=-1;
		String message="添加失败";
		try{	
			//当电影排序的序号不存在相同的时候才进行添加
			if(movieservice.findRank(movie.getRank(),0+"")<=0){
				if(movieservice.checkMediaID(movie.getMediaID(), movie.getId())<=0){
					result=this.movieservice.AddMovie(movie);
				}else{
					message="内部ID不能重复";
				}
			}else{
				message="排序的序号不能相同";
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
	
	@RequestMapping(value="delmovie")
	@ResponseBody
	public Feedback DelMovie(@RequestParam("id")int id,HttpServletRequest request, Model model){
		int result=-1;
		String message="删除失败";
		try{
			//查询注入表中是否有该影片数据
			if(injectService.getInjectByMovieId(id)<=0){
				result=this.movieservice.DelMovie(id);
			}else{
				message="请先删除该影片的注入数据，再删除影片信息";
			}
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
	
    // 根据产品包查价格
    @RequestMapping(value = "findPrice")
    @ResponseBody
    public Feedback findPrice(@RequestParam("vodID") String vodID, HttpServletRequest request, Model model) {
        String price = "";
        price = this.movieservice.findPrice(vodID);
        return Feedback.success(price);
    }
//    //内部ID不能重复
//    @RequestMapping(value={"checkMediaID"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
//    public void checkMediaID(@Param("mediaID")String mediaID,HttpServletRequest request, HttpServletResponse response){
//        int result = this.movieservice.checkMediaID(mediaID);
//        writeAjaxResult(response, result>0?"false":"true");
//    }
	
    @RequestMapping(value="uploadjsp")
	public String upload() {
		return "movie/UploadPicMovie";
	}
    
    @RequestMapping(value = "doupload")
	public void catimgUpload(@RequestParam("file") MultipartFile uploadfile,HttpServletRequest request, HttpServletResponse response) {
    	response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		PrintWriter writer = null;
		String result = "success";
		String imgFileFileName = uploadfile.getOriginalFilename();
        CommonsMultipartFile cf= (CommonsMultipartFile)uploadfile; 
        DiskFileItem fi = (DiskFileItem)cf.getFileItem(); 
        File imgFile = fi.getStoreLocation();
		try {
			String path = request.getSession().getServletContext().getRealPath("static/epgimg");
			
			writer = response.getWriter();
			path += File.separator+imgFileFileName;
			BufferedImage bufImg=ImageIO.read(imgFile);
			if(bufImg==null)
				throw new Exception("请上传图片!");
			FileUtils.copyFile(imgFile, new File(path));
			
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}finally{
			writer.write(result);
			writer.close();
		}
	}
}
