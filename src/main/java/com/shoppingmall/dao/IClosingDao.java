package com.shoppingmall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shoppingmall.dto.ClosingDto;

public interface IClosingDao {
	ClosingDto sltOne(String clos_date);
	List<ClosingDto> sltCondition(String condition);
	List<ClosingDto> sltMul();
	String getPreDayTotSales(@Param("preDay")String preDay,@Param("today")String today);
	String getPreDayOrderCnt(@Param("preDay")String preDay,@Param("today")String today);
	int closing(@Param("preDay")String preDay,@Param("preDayTotSales")String preDayTotSales,@Param("preDayOrderCnt")String preDayOrderCnt);
}
