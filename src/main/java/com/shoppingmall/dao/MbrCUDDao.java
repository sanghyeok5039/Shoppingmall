package com.shoppingmall.dao;

import org.springframework.stereotype.Repository;

import com.shoppingmall.dto.MbrDto;

@Repository
public interface MbrCUDDao {
	MbrDto getMbr(String id);
	void insertMbr(MbrDto dto);
	void updateMbr(MbrDto dto);
	void deleteMbr(MbrDto dto);
}
