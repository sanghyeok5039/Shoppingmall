package com.shoppingmall.dao;

import com.shoppingmall.dto.CtgryDTO;
import com.shoppingmall.dto.MCtgryDTO;

public interface CtgryDAO {
	
	CtgryDTO getCtgr(String id);
	MCtgryDTO getMctgr(String id);
}
