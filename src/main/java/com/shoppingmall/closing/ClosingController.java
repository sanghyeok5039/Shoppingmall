package com.shoppingmall.closing;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ClosingController {
	@Autowired
	IClosingService closSvc;
	
	@RequestMapping("saleList")
	public String saleList(Model model) {
		closSvc.saleList(model);
		return "sales";
	}
	
	@RequestMapping("saleListCondition")
	public String saleListCondition(Model model,@RequestParam("year")String year,@RequestParam("month")String month) {
		closSvc.saleLog(model, year, month);
		return "sales";
	}
	
	@RequestMapping("closing")
	public String closing(Model model,HttpSession session) {
		return closSvc.closing(model,session);
	}

}
