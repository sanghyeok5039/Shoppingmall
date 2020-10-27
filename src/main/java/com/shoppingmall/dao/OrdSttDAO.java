package com.shoppingmall.dao;

import java.util.ArrayList;

import com.shoppingmall.dto.OrdSttDTO;

public interface OrdSttDAO {
	
	ArrayList<OrdSttDTO> ordSttList();
	ArrayList<OrdSttDTO> CndtnSrchNum(String word);
	ArrayList<OrdSttDTO> CndtnSrchId(String word);
	ArrayList<OrdSttDTO> CndtnSrchName(String word);
	ArrayList<OrdSttDTO> CndtnSrchTel(String word);
}
