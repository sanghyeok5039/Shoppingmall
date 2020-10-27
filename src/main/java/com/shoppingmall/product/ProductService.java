package com.shoppingmall.product;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.shoppingmall.dao.ICategoryDao;
import com.shoppingmall.dao.IMain_CategoryDao;
import com.shoppingmall.dao.IMembersDao;
import com.shoppingmall.dao.IProductDao;
import com.shoppingmall.dao.IProductDetailDao;
import com.shoppingmall.dto.CategoryDto;
import com.shoppingmall.dto.CountDto;
import com.shoppingmall.dto.Main_CategoryDto;
import com.shoppingmall.dto.MembersDto;
import com.shoppingmall.dto.ProductDetailDto;
import com.shoppingmall.dto.ProductDto;

@Service("svc")
public class ProductService implements IProductService {
	
	@Autowired
	private IProductDao dao;
	@Autowired
	private IProductDetailDao pddao;
	@Autowired
	private IMain_CategoryDao mcadao;
	@Autowired
	private ICategoryDao cadao;
	@Autowired
	private IMembersDao mdao;
	int maxcount=12;
	
	
//	@Override
//	public String mainpage(Model model, HttpSession session) {
//		
//		String go="null";
//		go="list";
//		List<ProductDto> list = new ArrayList<ProductDto>();
//		List<Main_CategoryDto> mclist = mcadao.search();
//		for(int i = 0 ; i < mclist.size() ; i++) {
//			CountDto dto= new CountDto();
//			dto.setPageNum(maxcount);
//			dto.setStartNum(1);
//			dto.setM_ctgr_id(mclist.get(i).getM_ctgr_id());
//			List<ProductDto> setlist = dao.searchMainCategory(dto); 
//			for(int j = 0 ; j < setlist.size() ; j++) {
//				list.add(setlist.get(j));
//			}
//		}
//		
////		model.addAttribute("list",list.subList(0, 9));
//		model.addAttribute("list",list);
//		
//		return go;
//	}
	@Override
	public void mainpage(Model model, HttpSession session) {
		
		List<ProductDto> list = new ArrayList<ProductDto>();
		List<Main_CategoryDto> mclist = mcadao.search();
		for(int i = 0 ; i < mclist.size() ; i++) {
			CountDto dto= new CountDto();
			dto.setPageNum(maxcount);
			dto.setStartNum(1);
			dto.setM_ctgr_id(mclist.get(i).getM_ctgr_id());
			List<ProductDto> setlist = dao.searchMainCategory(dto); 
			for(int j = 0 ; j < setlist.size() ; j++) {
				list.add(setlist.get(j));
			}
		}
		
//		model.addAttribute("list",list.subList(0, 9));
		model.addAttribute("list",list);
	}
	
	
	/* (non-Javadoc)
	 * @see com.test.product.IProductSvc#showList(org.springframework.ui.Model, javax.servlet.http.HttpSession)
	 */
	@Override
	public String showmain(Model model, HttpSession session,String m_ctgr_id) {
		String id = (String) session.getAttribute("id");
		MembersDto basket = mdao.searchnon(id);
		if(basket == null) {
			MembersDto mdto = new MembersDto();
			mdto.setMbr_adres("0");
			mdto.setMbr_brthdy("0");
			mdto.setMbr_email("0");
			mdto.setMbr_grade("0");
			mdto.setMbr_rgsde("0");
			mdto.setMbr_id(id);
			mdto.setMbr_level("9");
			mdto.setMbr_name("basket");
			mdto.setMbr_point("0");
			mdto.setMbr_pw("0");
			mdto.setMbr_secsn("0");
			mdto.setMbr_sex("0");
			mdto.setMbr_tel("0");
			mdao.insertnon(mdto);
		}
		int count=dao.countMainCategory(m_ctgr_id);
		String go="null";
		if(count == 0) {
			return go;
		}
		go="list";
		int startNum=Integer.parseInt((String) session.getAttribute("startNum"));
		
		int startRow= (startNum - 1) * maxcount + 1;;
		CountDto dto= new CountDto();
		dto.setPageNum(maxcount);
		dto.setStartNum(startRow);
		dto.setM_ctgr_id(m_ctgr_id);
		Main_CategoryDto mcadto = mcadao.getOne(m_ctgr_id);
		List<CategoryDto> calist = cadao.getMulti(m_ctgr_id);
		List<ProductDto> list = dao.searchMainCategory(dto); 
		for(int i = 0 ; i < list.size() ; i++) {
			ProductDto pdto = list.get(i);
			List<ProductDetailDto> pdlist = pddao.search(pdto.getProduct_id());
			pdto.setProduct_price(pdlist.get(0).getProduct_price());
			list.set(i, pdto);
		}
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
		session.setAttribute("id", id);
		model.addAttribute("mbr_id",id);
		model.addAttribute("m_ctgr_name",mcadto.getM_ctgr_name());
		model.addAttribute("m_ctgr_id",m_ctgr_id);
		model.addAttribute("ctgrlist",calist);
		model.addAttribute("list",list);
		model.addAttribute("product_price","");
		model.addAttribute("startPage",startPage);
		model.addAttribute("numlist",numlist);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageCount",pageCount);
		return go;
	}
	
	
	@Override
	public String show(String product_id, Model model) {
		ProductDto dto = dao.searchOne(product_id);
		List<ProductDetailDto> pdlist = pddao.search(product_id);
		String go="null";
		if(dto == null) {
			return go;
		}
		go="show";
		
		for(int i = 0; i<pdlist.size();i++) {
			ProductDetailDto pddto = pdlist.get(i);
			pddto.setProduct_size(pddto.getProduct_color()+pddto.getProduct_size());
			pddto.setProduct_count(pddto.getProduct_count()+"/"+pddto.getProduct_price()+"/"+pddto.getProduct_detail_id());
			pdlist.set(i, pddto);
		}
		model.addAttribute("show", dto);
		model.addAttribute("showdetail",pdlist);
		return go;
	}


	@Override
	public String showctgr(Model model, HttpSession session, String ctgr_id) {
		
		
		int count=dao.countCategory(ctgr_id);
		String go="null";
		if(count == 0) {
			return go;
		}
		go="list";
		
		int startNum=Integer.parseInt((String) session.getAttribute("startNum"));
		
		int startRow= (startNum - 1) * maxcount + 1;;
		CountDto dto= new CountDto();
		dto.setPageNum(maxcount);
		dto.setStartNum(startRow);
		dto.setCtgr_id(ctgr_id);
		CategoryDto cadto= cadao.getOne(ctgr_id);
		List<ProductDto> list = dao.searchCategory(dto); 
		for(int i = 0 ; i < list.size() ; i++) {
			ProductDto pdto = list.get(i);
			List<ProductDetailDto> pdlist = pddao.search(pdto.getProduct_id());
			pdto.setProduct_price(pdlist.get(0).getProduct_price());
			list.set(i, pdto);
		}
		
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
		model.addAttribute("ctgr_name",cadto.getCtgr_name());
		model.addAttribute("ctgr_id",ctgr_id);
		model.addAttribute("list",list);
		model.addAttribute("startPage",startPage);
		model.addAttribute("numlist",numlist);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageCount",pageCount);
		return go;

	}


	@Override
	public String showname(Model model, HttpSession session, String product_name) {
		String go="null";
		String product="%"+product_name+"%";
//		if(product_name ==null) {
//			return go;
//		}
		int count=dao.countName(product);
		
		if(count == 0) {
			return go;
		}
		go="list";
		
		int startNum=Integer.parseInt((String) session.getAttribute("startNum"));
		
		int startRow= (startNum - 1) * maxcount + 1;;
		CountDto dto= new CountDto();
		dto.setPageNum(maxcount);
		dto.setStartNum(startRow);
		dto.setProduct_name(product_name);;
		List<ProductDto> list = dao.searchName(dto); 
		for(int i = 0 ; i < list.size() ; i++) {
			ProductDto pdto = list.get(i);
			List<ProductDetailDto> pdlist = pddao.search(pdto.getProduct_id());
			pdto.setProduct_price(pdlist.get(0).getProduct_price());
			list.set(i, pdto);
		}
		
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
		model.addAttribute("product_name",product_name);
		model.addAttribute("list",list);
		model.addAttribute("startPage",startPage);
		model.addAttribute("numlist",numlist);
		model.addAttribute("endPage",endPage);
		model.addAttribute("pageCount",pageCount);
		return go;
	}
	
	@Override
	public String search(Model model,HttpServletRequest request) {
		
		String m_ctgr_id = request.getParameter("m_ctgr_id");
		String ctgr_id = request.getParameter("ctgr_id");
		String product_name = request.getParameter("product_name");
		String startNum=request.getParameter("startNum");
		if(m_ctgr_id != null) {
			model.addAttribute("content",m_ctgr_id);
			model.addAttribute("name","m_ctgr_id");
		} else if(ctgr_id != null) {
			model.addAttribute("content",ctgr_id);
			model.addAttribute("name","ctgr_id");
		} else if(product_name != null) {
			model.addAttribute("content",product_name);
			model.addAttribute("name","product_name");
		}
		model.addAttribute("startNum",startNum);
		
		
		return null;
	}
	
}
