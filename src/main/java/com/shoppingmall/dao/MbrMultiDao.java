package com.shoppingmall.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.shoppingmall.dto.MbrDto;

@Repository
public interface MbrMultiDao {
	MbrDto getId(@Param("name") String name, @Param("tel") String tel);
	MbrDto getNonMbr(@Param("tel") String tel, @Param("pw") String pw);
}
