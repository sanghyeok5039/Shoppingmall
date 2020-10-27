package com.shoppingmall.dao;

import com.shoppingmall.dto.MbrDto;

public interface MbrDAO {

	MbrDto getOne(String id);
	void insert(MbrDto dto);
	void update(MbrDto dto);
	void delete(String id);
}
