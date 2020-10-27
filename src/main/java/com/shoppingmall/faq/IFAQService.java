package com.shoppingmall.faq;

import org.springframework.ui.Model;

import com.shoppingmall.dto.FAQDto;

public interface IFAQService {
	void viewFAQ(Model model,String num);
	void viewFAQList(Model model,String category);
	void insertFAQ(FAQDto dto);
	void updateFAQ(FAQDto dto);
	void delFAQ(String num);
}
