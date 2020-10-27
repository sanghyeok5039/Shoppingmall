package com.shoppingmall.dao;

import java.util.List;

import com.shoppingmall.dto.CountDto;
import com.shoppingmall.dto.ProductDto;

public interface IProductDao {
	List<ProductDto> searchCategory(CountDto dto);

	List<ProductDto> searchMainCategory(CountDto dto);

	List<ProductDto> searchName(CountDto dto);

	ProductDto searchOne(String product_id);

	int countCategory(String ctgr_id);

	int countMainCategory(String m_ctgr_id);

	int countName(String product_name);

	void countupdate(ProductDto dto);

	void reviewupdate(ProductDto dto);
	
	
}
