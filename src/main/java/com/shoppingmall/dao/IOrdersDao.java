package com.shoppingmall.dao;

import java.util.List;

import com.shoppingmall.dto.CountDto;
import com.shoppingmall.dto.OrdDto;

public interface IOrdersDao {
	OrdDto searchOne(OrdDto dto);
	void insert(OrdDto dto);
	int count();
	List<OrdDto> searchId(CountDto dto);
	int countId(String mbr_id);
}
