package com.shoppingmall.review;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shoppingmall.dto.Board_reviewDto;
import com.shoppingmall.dto.CountDto;

@Controller
public class ReviewController {
	
	@Autowired
	private IBoard_reviewService Svc;
	
	
	@RequestMapping("review_list")
	public String showList(Model model,HttpServletRequest request) {
		CountDto dto = new CountDto();
		dto.setStartNum(Integer.parseInt(request.getParameter("startNum")));
		dto.setProduct_id(request.getParameter("product_id"));
		String go = Svc.show(dto, model);
		
		if(go.equals("null"))
		{
			return "review";
		}
		return "review";
	}
	
	@RequestMapping("review_insert")
	public String show(Model model,HttpServletRequest request) {
		Board_reviewDto dto = new Board_reviewDto();
		dto.setReview_title(request.getParameter("review_title"));
		dto.setReview_content(request.getParameter("review_content"));
		dto.setReview_grade(Integer.parseInt(request.getParameter("review_grade")));
		dto.setProduct_id(request.getParameter("product_id"));
		dto.setMbr_id(request.getParameter("mbr_id"));
		Svc.insert(dto);
		
		return "reviewOK";//다른 페이지 만들어서 거기서 알람창 띄우고 확인하면 리스트로 보내야 겠다
	}
	
	
	
	
}
