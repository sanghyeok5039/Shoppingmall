package com.shoppingmall.review;

import org.springframework.ui.Model;

import com.shoppingmall.dto.Board_reviewDto;
import com.shoppingmall.dto.CountDto;

public interface IBoard_reviewService {


	String show(CountDto dto, Model model);

	void insert(Board_reviewDto dto);

}
