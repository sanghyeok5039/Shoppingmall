package com.shoppingmall.dao;

import java.util.ArrayList;

import com.shoppingmall.dto.CtgryDTO;
import com.shoppingmall.dto.MCtgryDTO;

public interface CtgryMDAO {
	
	ArrayList<CtgryDTO> getCtgrList();
	ArrayList<CtgryDTO> getChangedCtgrList(String mId);
	ArrayList<MCtgryDTO> getMctgrList();
	
}
