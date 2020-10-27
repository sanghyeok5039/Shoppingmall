package com.shoppingmall.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.shoppingmall.dto.BasketDto;
@Repository
public interface BasketCUDDao {
	BasketDto getBskt(@Param("mbr_id") String mbr_id, @Param("product_detail_id") String product_detail_id);
	void deleteBskt(BasketDto dto);
}
