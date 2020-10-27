package com.shoppingmall.dao;

import org.apache.ibatis.annotations.Param;

public interface IHomeDao {
	int todayOrderCnt(@Param("today_start")String today_start,@Param("today_end")String today_end);
	int todaySignUpCnt(@Param("today")String today);
	int todayTotSales(@Param("today_start")String today_start,@Param("today_end")String today_end);
}
