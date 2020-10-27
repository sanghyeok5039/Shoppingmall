package com.shoppingmall.dao;

import java.util.List;

import com.shoppingmall.dto.ProductDetailDto;

public interface IProductDetailDao {
	List<ProductDetailDto> search(String product_id);
	ProductDetailDto searchOne(String product_detail_id);
	void countupdate(ProductDetailDto pddto);
}
