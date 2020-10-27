package com.shoppingmall.order;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shoppingmall.dto.MbrDto;

@Controller
public class OrderController {
	
	@Autowired
	public IOrderService osvc;
	
	
	
	@RequestMapping("directopen")
	public String directopen(Model model,HttpServletRequest request,HttpSession session) {
		MbrDto dto = null;
		dto = (MbrDto) session.getAttribute("loginUser");
		String mbr_id;
		if(dto == null) {
			mbr_id=(String) session.getAttribute("id");
		} else {
			mbr_id = dto.getMbr_id();
		}
		
		String product_id=request.getParameter("product_id");
		String num=request.getParameter("num");
		
		String product_detail_id=request.getParameter("product_detail_id");
		String go=osvc.directopen(product_id, num, mbr_id,product_detail_id, model);
		if(go!=null) {
			return "orderover";
		}
		return "orderPage";
	}
	
	
	
	@RequestMapping("order")
	public String order(Model model,HttpServletRequest request,HttpSession session) {
		MbrDto dto = null;
		dto = (MbrDto) session.getAttribute("loginUser");
		String mbr_id;
		if(dto == null) {
			mbr_id=(String) session.getAttribute("id");
		} else {
			mbr_id = dto.getMbr_id();
		}
		request.setAttribute("mbr_id", mbr_id);
		String go=osvc.insert(request, model);
		if(go!=null) {
			return "pointover";
		}
		return "home";
	}

	@RequestMapping("showOrderlist")
	public String orderlist(Model model,HttpServletRequest request,HttpSession session) {
		
		osvc.List(model, request,session);

		return "orderList";
	}
	
	@RequestMapping("nonMbrOrderListCheckPage")
	public String nonMbrOrderListCheck(Model model) {
		return "nonMbrOrderListCheck";
	}
	
	@RequestMapping("showOrderdetaillist")
	public String orderdetaillist(Model model,HttpServletRequest request,HttpSession session) throws ParseException {
		osvc.detailList(model, request,session);
		return "orderDetail";
	}
	
	
	
}
