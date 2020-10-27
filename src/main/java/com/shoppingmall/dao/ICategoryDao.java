package com.shoppingmall.dao;

import java.util.List;

import com.shoppingmall.dto.CategoryDto;

public interface ICategoryDao {
	CategoryDto getOne(String ctgr_id);
	List<CategoryDto> getMulti(String m_ctgr_id);
}
