package com.shoppingmall.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	
	@Autowired
	private IProductService svc;
	
//	@RequestMapping(value = "/")
//	public String home() {
//		return "redirect:/openPage.jsp";
//	}
	
	@RequestMapping("mainpage")
	public String mainpage(HttpSession session,Model model,HttpServletRequest request) {
		
		svc.mainpage(model, session);
		return "mainpage";
	}
	
	@RequestMapping("search")
	public String search(Model model,HttpServletRequest request) {
		svc.search(model, request);
		
		return "productViewPage";
	}
	
	@RequestMapping("showMainCategory")
	public String showmainctgr(HttpSession session,Model model,HttpServletRequest request) {
		session.setAttribute("startNum", request.getParameter("startNum"));
		String m_ctgr_id=request.getParameter("m_ctgr_id");
		String go = svc.showmain(model, session,m_ctgr_id);
		
		if(go.equals("null"))
		{
			return "null";
		}
		return "productViewPage";
	}
	@RequestMapping("showCategory")
	public String showctgr(HttpSession session,Model model,HttpServletRequest request) {
		session.setAttribute("startNum", request.getParameter("startNum"));
		String ctgr_id=request.getParameter("ctgr_id");
		String go = svc.showctgr(model, session,ctgr_id);
		
		if(go.equals("null"))
		{
			return "null";
		}
		return "productViewPage";
	}
	@RequestMapping("showName")
	public String showname(HttpSession session,Model model,HttpServletRequest request) {
		session.setAttribute("startNum", request.getParameter("startNum"));
		String name=request.getParameter("product_name");
		String go = svc.showname(model, session,name);
		
		if(go.equals("null"))
		{
			return "null";
		}
		return "productViewPage";
	}
	
	@RequestMapping("show")
	public String show(Model model,HttpServletRequest request) {
		String product_id = request.getParameter("id"); 
		String go =svc.show(product_id, model);
		if(go.equals("null"))
		{
			return "productViewList";
		}
		return "productView";
	}
	
	
	
	
}
