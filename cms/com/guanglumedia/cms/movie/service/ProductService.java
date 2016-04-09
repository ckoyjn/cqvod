package com.guanglumedia.cms.movie.service;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guanglumedia.cms.common.PagedModelList;
import com.guanglumedia.cms.movie.dao.ProductDao;
import com.guanglumedia.cms.movie.entity.Product;

@Service
public class ProductService {
	@Autowired
	private ProductDao productdao;

	public PagedModelList<Product> findAllProductList(Product product, int pageNo,int pageRow) throws UnsupportedEncodingException {
	    if (product.getName()!= null) {
            String name = new String(product.getName().getBytes("ISO-8859-1"), "utf-8");
            product.setName(name);
        }
		List<Product> list = this.productdao.findProductList(product, new RowBounds((pageNo - 1) * pageRow, pageRow));
		int count=this.productdao.findCount(product);
		PagedModelList<Product> pml = new PagedModelList<Product>(pageNo, pageRow, count);
		pml.addModels(list);
		return pml;
	}

	public Product getProductById(int id) {
		return productdao.getProductById(id);
	}

	public int UpdateProduct(Product product) {
		return productdao.updateProduct(product);
	}

	public int AddProduct(Product  product) {
		return productdao.addProduct(product);
	}

	public int DelProduct(int id) {
		return productdao.delProduct(id);
	}

	public List<Product> findAllProductList() {
		return productdao.findAllProduct();
	}

	public int checkMediaID(String vodid, String id) {
		return productdao.checkVodID(vodid,id);
	}
}
