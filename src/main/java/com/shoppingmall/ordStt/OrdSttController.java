package com.shoppingmall.ordStt;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrdSttController {
	
	@Autowired
	@Qualifier("ordSttSvcImpl") 
	private IOrdSttService svc;
	
	@RequestMapping("ordSttMng")
	public String ordSttMng(Model md) {
		
		svc.ordSttSrch(md);
		
		return "ordSttMng";
	}
	
	@RequestMapping("ordSttCndtnSrch")
	public String ordSttCndtnSrch(Model md, HttpServletRequest req) {
		
		svc.ordSttCndtnSrch(md, req);
		
		return "ordSttMng";
	}
	
	
}
