package com.shoppingmall.mbr;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import com.shoppingmall.dto.MbrDto;

public interface IMbrService {

	String mbrMulSrch(Model md);
	String mbrOneSrch(Model md, HttpServletRequest req);
	String mbrInsert(MbrDto dto);
	String mbrDelete(String id);
	String mbrUpdate(Model md, HttpServletRequest req);
	String mbrCndtnSrch(Model md, HttpServletRequest req);
	
}
