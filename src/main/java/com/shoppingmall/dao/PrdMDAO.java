package com.shoppingmall.dao;

import java.util.ArrayList;

import com.shoppingmall.dto.PrdDTO;

public interface PrdMDAO {
	
	ArrayList<PrdDTO> getList();
	String getCnt(String id, String size);
	ArrayList<PrdDTO> getSizeList(String id);
	
	ArrayList<PrdDTO> getCndtnSrchP(String word);
	ArrayList<PrdDTO> getCndtnSrchC(String word);
	
	int prdMaxRownum();
	int prdDtMaxRownum();
	
}