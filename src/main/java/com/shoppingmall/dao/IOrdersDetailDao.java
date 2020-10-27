package com.shoppingmall.dao;

import java.util.List;

import com.shoppingmall.dto.OrdersDetailDto;
import com.shoppingmall.dto.OrdDto;

public interface IOrdersDetailDao {
	OrdersDetailDto searchOne(OrdersDetailDto dto);
	void insert(OrdersDetailDto dto);
	List<OrdersDetailDto> search(OrdDto dto);
}
