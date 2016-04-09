package com.guanglumedia.cms.movie.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.guanglumedia.cms.movie.entity.Product;
@Repository
public abstract interface ProductDao {

	public abstract List<Product> findProductList(Product product, RowBounds rowBounds);

	public abstract int findCount(Product product);

	public abstract Product getProductById(@Param("id")int id);

	public abstract int updateProduct(Product product);

	public abstract int addProduct(Product product);

	public abstract int delProduct(@Param("id")int id);

	public abstract List<Product> findAllProduct();

    public abstract int checkVodID(@Param("vodid")String vodid, @Param("id")String id);

	
}
