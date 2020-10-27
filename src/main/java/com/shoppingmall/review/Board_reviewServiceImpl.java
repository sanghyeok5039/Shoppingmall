package com.shoppingmall.review;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.shoppingmall.dao.IBoard_reviewDao;
import com.shoppingmall.dao.IProductDao;
import com.shoppingmall.dto.Board_reviewDto;
import com.shoppingmall.dto.CountDto;
import com.shoppingmall.dto.ProductDto;

@Service("Svc")
public class Board_reviewServiceImpl implements IBoard_reviewService {

	@Autowired
	IBoard_reviewDao dao;
	@Autowired
	IProductDao pdao;
	
	int maxcount = 12;
	
	
	@Override
	public String show(CountDto dto, Model model) {
		String go="null";
		int count= dao.count(dto.getProduct_id());
		if(count==0) {
			return go;
		}
		
		go="show";
		
		int startNum=dto.getStartNum();
		int startRow= (startNum - 1) * maxcount + 1;;
		dto.setPageNum(maxcount);
		dto.setStartNum(startRow);
		List<Board_reviewDto> list = dao.search(dto); 
		
		int startPage = 0;
		int endPage = 0;
		int pageCount = 0;
		if (count > 0) {
			pageCount = count / maxcount + (count % maxcount == 0 ? 0 : 1);
			startPage = 1;

			if (startNum % 12 != 0)
				startPage = (int) (startNum / 12) * 12 + 1;
			else
				startPage = ((int) (startNum / 12) - 1) * 12 + 1;

			int pageBlock = 12;
				endPage = startPage + pageBlock - 1;
			if (endPage > pageCount)
				endPage = pageCount;
		}
		ArrayList<String> numlist = new ArrayList<String>();
		for (int i = startPage; i <= endPage; i++) {
			String num1 = Integer.toString(i);
			numlist.add(num1);
		}
		model.addAttribute("show",list);
		model.addAttribute("startPage",startPage);
		model.addAttribute("numlist",numlist);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("id",dto.getProduct_id());
		
		return go;
	}
	

	@Override
	@Transactional
	public void insert(Board_reviewDto dto) {
		String id = dto.getProduct_id();
		List<Board_reviewDto> sum = dao.grade(id);
		ProductDto pdto = new ProductDto();
		pdto.setProduct_id(id);
		pdto.setProduct_totalgrade(dto.getReview_grade());
		if(sum.size() != 0) {
			int total=0;
			for(int i = 0; i<sum.size();i++) {
				total+=sum.get(i).getReview_grade();
			}
			double totalgrade = (total+Double.parseDouble(Integer.toString(dto.getReview_grade())))/(sum.size()+1);
			System.out.println(total);
			pdto.setProduct_totalgrade(totalgrade);
		}
		Integer num = dao.num();
		if(num ==null) {
			num=1;
		} else {
			num+=1;
		}
		dto.setReview_num(num);
		dto.setReview_regdate(new Timestamp(System.currentTimeMillis()));
		dto.setReview_relevel("0");
		dto.setReview_restep("0");
		dto.setReview_readcount("1");
		dto.setReview_ref("0");
		try {
		pdao.reviewupdate(pdto);
		dao.insert(dto);
		} catch(Exception e) {
			
		}
		
	}
	
}
