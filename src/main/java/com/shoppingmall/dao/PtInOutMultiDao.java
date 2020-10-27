package com.shoppingmall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.shoppingmall.dto.PtInOutDto;

@Repository
public interface PtInOutMultiDao {
	List<PtInOutDto> getPtInOut(@Param("mbr_id") String id);
}
