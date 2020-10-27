package com.shoppingmall.dao;

import java.util.List;

import com.shoppingmall.dto.Main_CategoryDto;

public interface IMain_CategoryDao {
	Main_CategoryDto getOne(String m_ctgr_id);
	List<Main_CategoryDto> search();
}
