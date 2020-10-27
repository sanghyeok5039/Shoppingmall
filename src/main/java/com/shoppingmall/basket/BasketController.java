package com.shoppingmall.basket;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shoppingmall.dto.BasketDto;
import com.shoppingmall.dto.MbrDto;

@Controller
public class BasketController {
	
	@Autowired
	private IBasketService bssvc;
	
	@RequestMapping("basketinsert")
	public String insert(Model model,HttpServletRequest request, HttpSession session) {
		BasketDto dto = new BasketDto();
		MbrDto mdto = null;
		mdto = (MbrDto) session.getAttribute("loginUser");

		if(mdto == null) {
			dto.setMbr_id((String)session.getAttribute("id"));
		} else {
			dto.setMbr_id(mdto.getMbr_id());
		}
		
		dto.setProduct_id(request.getParameter("product_id"));
		dto.setNum(request.getParameter("num"));
		dto.setProduct_detail_id(request.getParameter("product_detail_id"));
		System.out.println(request.getParameter("product_detail_id"));
		String go=bssvc.insert(dto,model);
		if(go!=null) {
			if(go.equals("error")) {
				return "baskethave";
			} else if(go.equals("over")) {
				return "orderover";
			}
		}
		return "basketOK";
	}
	
	@RequestMapping("basketshow")
	public String show(Model model,HttpServletRequest request, HttpSession session) {
		String mbr_id;
		MbrDto mdto = null;
		mdto = (MbrDto) session.getAttribute("loginUser");

		if(mdto == null) {
			mbr_id = (String)session.getAttribute("id");
		} else {
			mbr_id = mdto.getMbr_id();
		}
		String go=bssvc.search(mbr_id, model);
		if(go!=null) {
			return "basketempty";
		}
		return "basket";
	}
	
	@RequestMapping("basketdelete")
	public String delete(Model model,HttpServletRequest request, HttpSession session) {
		BasketDto dto = new BasketDto();
		String mbr_id;
		MbrDto mdto = null;
		mdto = (MbrDto) session.getAttribute("loginUser");

		if(mdto == null) {
			mbr_id = (String)session.getAttribute("id");
		} else {
			mbr_id = mdto.getMbr_id();
		}
		dto.setMbr_id(mbr_id);
		dto.setProduct_detail_id(request.getParameter("product_detail_id"));
		bssvc.delete(dto, model);
		
		return "basketdelete";
	}
	
	@RequestMapping("basketopen")
	public String basketopen(Model model,HttpServletRequest request, HttpSession session) {
		String mbr_id;
		MbrDto mdto = null;
		mdto = (MbrDto) session.getAttribute("loginUser");

		if(mdto == null) {
			mbr_id = (String)session.getAttribute("id");
		} else {
			mbr_id = mdto.getMbr_id();
		}
		bssvc.open(mbr_id, model);
		
		return "orderPage";
	}
	
	

}
