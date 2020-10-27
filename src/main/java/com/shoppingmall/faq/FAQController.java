package com.shoppingmall.faq;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.shoppingmall.dto.FAQDto;

@Controller
public class FAQController {
	
	@Autowired
	IFAQService facSvc;
	
	@RequestMapping("cstViewFAQList")
	public String viewFAQList(Model model,@RequestParam("category")String category) throws Exception{
		facSvc.viewFAQList(model, category);
		return "csCenterFAQ";
	}
	
	@RequestMapping("mngViewFAQList")
	public String mngViewFAQ(Model model,@RequestParam("category")String category) throws Exception{
		facSvc.viewFAQList(model, category);
		return "mngFAQList";
	}
	
	@RequestMapping("viewFAQ")
	public String viewFAQ(Model model,@RequestParam("num")String num,@RequestParam("category")String category) throws Exception{
		System.out.println("num : "+num);
		facSvc.viewFAQ(model, num);
		model.addAttribute("category",category);
		
		return "mngViewFAQ";
	}
	
	@RequestMapping("writeFAQForm")
	public String writeNoticeForm(Model model,@RequestParam("category")String category) {
		model.addAttribute("category", category);
		return "faqWriteForm";
	}
	
	@RequestMapping("writeFAQ")
	public String writeNotice(FAQDto dto) throws Exception {
		facSvc.insertFAQ(dto);
		return "redirect:mngViewFAQList?category="+dto.getFaq_category();
	}
	
	@RequestMapping("updateFAQ")
	public String updateFAQ(FAQDto dto) throws Exception{
		facSvc.updateFAQ(dto);
		return "redirect:viewFAQ?num="+dto.getFaq_num()+"&category="+dto.getFaq_category();
	}
	
	@RequestMapping("delFAQ")
	public String delFAQ(@RequestParam("num")String num,@RequestParam("category")String category) throws Exception{
		facSvc.delFAQ(num);
		return "redirect:mngViewFAQList?category="+category;
	}
	
}
