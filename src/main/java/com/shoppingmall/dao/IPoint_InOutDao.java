package com.shoppingmall.dao;

import com.shoppingmall.dto.Point_inoutDto;

public interface IPoint_InOutDao {
	void insert(Point_inoutDto dto);
	Point_inoutDto search(Point_inoutDto dto);
}
