package com.shoppingmall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.shoppingmall.dto.BasketDto;
@Repository
public interface BasketMultiDao {
	List<BasketDto> getAllBskt(@Param("mbr_id") String id);
}
