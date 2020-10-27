package com.shoppingmall.dao;

import java.util.List;

import com.shoppingmall.dto.Board_reviewDto;
import com.shoppingmall.dto.CountDto;

public interface IBoard_reviewDao {
	List<Board_reviewDto> search(CountDto dto);
	int count(String product_id);
	void insert(Board_reviewDto dto);
	Integer num();
	List<Board_reviewDto> grade(String product_id);
}
