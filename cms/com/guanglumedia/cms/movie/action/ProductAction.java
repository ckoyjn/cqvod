package com.guanglumedia.cms.movie.action;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guanglumedia.cms.common.BaseAction;
import com.guanglumedia.cms.common.Feedback;
import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.movie.entity.Product;
import com.guanglumedia.cms.movie.service.ProductService;

@Controller
@RequestMapping(value="/cms/product")
public class ProductAction extends BaseAction{
	@Autowired
	private ProductService productservice;
	
	
	@RequestMapping(value="findproductlist")
	public String FindProductList(Product product,HttpServletRequest request, Model model) throws UnsupportedEncodingException{
		PagedModelList<Product> pagedModelList = this.productservice.findAllProductList(product,getPageNo(request),getPageRow(request));
		model.addAttribute("pml", pagedModelList);
		model.addAttribute("product", product);
		return "product/ListProduct";
	}
	
	@RequestMapping(value="tomodifyproduct")
	public String ToModifyProduct(@RequestParam("id")int id,@RequestParam("Edit")String edit,HttpServletRequest request, Model model){
		if(id>0){
			Product movie=productservice.getProductById(id);
			model.addAttribute("ProductInfo",movie);
		}
		model.addAttribute("Edit", edit);
		model.addAttribute("ProductID",id);
		return "product/ModifyProduct";
	}
		
	@RequestMapping(value="modifyproduct")
	@ResponseBody
	public Feedback ModifyProduct(Product product,HttpServletRequest request, Model model){
		int result=-1;
		String message="更新失败";
		try{
			if(productservice.checkMediaID(product.getVodid(), product.getId())<=0){
				result=this.productservice.UpdateProduct(product);
			}else{
				message="VoD ID不能重复";
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
	
	@RequestMapping(value="addproduct")
	@ResponseBody
	public Feedback AddProduct(Product product,HttpServletRequest request, Model model){
		int result=-1;
		String message="添加失败";
		try{	
			if(productservice.checkMediaID(product.getVodid(), product.getId())<=0){
				result=this.productservice.AddProduct(product);
			}else{
				message="VoD ID不能重复";
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
	
	@RequestMapping(value="delproduct")
	@ResponseBody
	public Feedback DelProduct(@RequestParam("id")int id,HttpServletRequest request, Model model){
		int result=-1;
		String message="删除失败";
		try{		
			result=this.productservice.DelProduct(id);
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
//	//vodID不能重复
//    @RequestMapping(value={"checkVodID"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
//    public void checkMediaID(@Param("vodid")String vodid,HttpServletRequest request, HttpServletResponse response){
//        int result = this.productservice.checkVodID(vodid);
//        writeAjaxResult(response, result>0?"false":"true");
//    }
}
