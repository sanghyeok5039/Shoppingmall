package com.shoppingmall.dao;

import java.util.List;

import com.shoppingmall.dto.FAQDto;

public interface IFAQDao {
	FAQDto sltOne(int faq_num);
	List<FAQDto> search(int faq_category);
	void insert(FAQDto dto);
	void update(FAQDto dto);
	void delete(int faq_num);
}
