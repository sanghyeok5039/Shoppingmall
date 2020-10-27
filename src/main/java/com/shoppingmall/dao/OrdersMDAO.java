package com.shoppingmall.dao;

import java.util.ArrayList;

import com.shoppingmall.dto.OrdersDTO;

public interface OrdersMDAO {
	
	public ArrayList<OrdersDTO> ordSttMulSrch(String date, String date2);
	
}
