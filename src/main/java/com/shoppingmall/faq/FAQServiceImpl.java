package com.shoppingmall.faq;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.shoppingmall.dao.IFAQDao;
import com.shoppingmall.dto.FAQDto;

@Service("faqSvc")
@Primary
public class FAQServiceImpl implements IFAQService{
	
	@Autowired
	IFAQDao faqDao;
	
	@Override
	public void viewFAQ(Model model, String num) {
		int faq_num = Integer.parseInt(num);
		FAQDto dto = faqDao.sltOne(faq_num);
		model.addAttribute("dto", dto);
	}
	
	@Override
	public void viewFAQList(Model model, String category) {
		int faq_category = Integer.parseInt(category);
		List<FAQDto> list = faqDao.search(faq_category);
		
		if(faq_category == 1) {
			category = "입금/결제";
		}else if(faq_category == 2) {
			category = "배송";
		}else if(faq_category == 3) {
			category = "주문/조회";
		}else if(faq_category == 4) {
			category = "회원/기타";
		}else if(faq_category == 5) {
			category = "상품/재입고";
		}else if(faq_category == 6) {
			category = "변경/취소";
		}
		

		model.addAttribute("LIST", list);
		model.addAttribute("category", category);
		model.addAttribute("faq_category", faq_category);
	}

	@Override
	public void insertFAQ(FAQDto dto) {

		System.out.println("num : "+dto.getFaq_num());
		System.out.println("cate : "+dto.getFaq_category());
		System.out.println("q : "+dto.getFaq_question());
		System.out.println("a : "+dto.getFaq_answer());
		
		faqDao.insert(dto);
	}
	
	@Override
	public void updateFAQ(FAQDto dto) {

		System.out.println("num : "+dto.getFaq_num());
		System.out.println("cate : "+dto.getFaq_category());
		System.out.println("q : "+dto.getFaq_question());
		System.out.println("a : "+dto.getFaq_answer());
		
		faqDao.update(dto);
	}
	
	@Override
	public void delFAQ(String num) {
		int faq_num = Integer.parseInt(num);
		faqDao.delete(faq_num);
	}



	

}
