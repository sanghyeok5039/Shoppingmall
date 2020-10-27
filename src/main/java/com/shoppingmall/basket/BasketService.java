package com.shoppingmall.basket;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.shoppingmall.dao.IBasketDao;
import com.shoppingmall.dao.IMembersDao;
import com.shoppingmall.dao.IProductDao;
import com.shoppingmall.dao.IProductDetailDao;
import com.shoppingmall.dto.BasketDto;
import com.shoppingmall.dto.BasketOrderDto;
import com.shoppingmall.dto.MembersDto;
import com.shoppingmall.dto.OrderListDto;
import com.shoppingmall.dto.ProductDetailDto;
import com.shoppingmall.dto.ProductDto;

@Service("bssvc")
public class BasketService implements IBasketService{
	
	
	@Autowired
	private IBasketDao bsdao;
	@Autowired
	private IProductDao pdao;
	@Autowired
	private IProductDetailDao pddao;
	@Autowired
	private IMembersDao mdao;
	
	/* (non-Javadoc)
	 * @see com.test.Score.IBasketSvc#search(java.lang.String, org.springframework.ui.Model)
	 */
	@Override
	public String search(String mbr_id, Model model) {
		String go="empty";
		List<BasketDto> list= bsdao.search(mbr_id);
		if(list.isEmpty()) {
			return go;
		}
		List<BasketOrderDto> plist = new ArrayList<BasketOrderDto>();
		int price=0;
		int delivery=2500;
		for(int i=0;list.size()>i;i++) {
			BasketDto dto=list.get(i);
			String product_id=dto.getProduct_id();
			String product_detail_id=dto.getProduct_detail_id();
			ProductDto pdto=pdao.searchOne(product_id);
			ProductDetailDto pddto=pddao.searchOne(product_detail_id);
			BasketOrderDto opdto = new BasketOrderDto();
			opdto.setProduct_id(pdto.getProduct_id());
			opdto.setProduct_name(pdto.getProduct_name());
			opdto.setProduct_price(pddto.getProduct_price());
			opdto.setNum(dto.getNum());
			opdto.setProduct_detail_id(pddto.getProduct_detail_id());
			opdto.setProduct_size(pddto.getProduct_color()+pddto.getProduct_size());
			int total_price=Integer.parseInt(dto.getNum())*Integer.parseInt(pddto.getProduct_price());
			opdto.setMbr_point(total_price/10);
			opdto.setTotal_price(Integer.toString(total_price));
			price+=Integer.parseInt(opdto.getTotal_price());
			plist.add(opdto);
		}
		BasketOrderDto opdto = new BasketOrderDto();
		if(price>=50000) {
			delivery=0;
		}
		opdto.setTotal_price(Integer.toString(price+delivery));
		opdto.setDelivery(Integer.toString(delivery));
		plist.add(opdto);
		model.addAttribute("list",plist);
		model.addAttribute("mbr_id",mbr_id);
		return null;
	}
	

	public String open(String mbr_id,Model model) {
		System.out.println(mbr_id);
		List<BasketDto> list= bsdao.search(mbr_id);
		List<OrderListDto> olist = new ArrayList<OrderListDto>();
		MembersDto mdto= mdao.search(mbr_id);
		int price = 0;
		int delivery = 2500;
		int totalprice=0;
		for(int i=0;list.size()>i;i++) {
			BasketDto dto=list.get(i);
			ProductDetailDto pddto = pddao.searchOne(dto.getProduct_detail_id());
			ProductDto pdto= pdao.searchOne(dto.getProduct_id());//재고도 받아서 재고보다 많으면 튕기게해야함
			int count = Integer.parseInt(pddto.getProduct_count());
			int num1 = Integer.parseInt(dto.getNum());
			if(count<num1) {
				return "error";
			}
			pddto.setProduct_size(pddto.getProduct_color()+pddto.getProduct_size());
			price= Integer.parseInt(pddto.getProduct_price())*num1;
			OrderListDto odto = new OrderListDto();
			odto.setNum(dto.getNum());
			odto.setPdto(pdto);
			odto.setPddto(pddto);
			
			odto.setTotal(Integer.toString(price));
			odto.setImg(pdto.getProduct_img());
			olist.add(odto);
			totalprice+=price;
		}
		if(totalprice>=50000) {
			delivery=0;
		}
		model.addAttribute("list",olist);
		model.addAttribute("delivery",delivery);
		model.addAttribute("mdto",mdto);
		model.addAttribute("totalprice",totalprice+delivery);
		model.addAttribute("point",totalprice/10);
		return null;
	}
	
	/* (non-Javadoc)
	 * @see com.test.Score.IBasketSvc#insert(com.test.Score.BasketDto)
	 */
	@Override
	public String insert(BasketDto dto, Model model) {
		String go=null;
		List<BasketDto> list=bsdao.search(dto.getMbr_id());
		model.addAttribute("mbr_id",dto.getMbr_id());
		for(int i =0;i<list.size();i++) {
			BasketDto bdto=list.get(i);
			String product_detail_id=bdto.getProduct_detail_id();
			if(product_detail_id.equals(dto.getProduct_detail_id())) {
				go="error";
				return go;
			} 
		}
		ProductDetailDto pddto=pddao.searchOne(dto.getProduct_detail_id());
		int count = Integer.parseInt(dto.getNum());
		if(count>Integer.parseInt(pddto.getProduct_count())) {
			go="over";
			return go;
		}
		bsdao.insert(dto);
		
		return go;
	}
	
	@Override
	public String delete(BasketDto dto, Model model) {
		bsdao.delete(dto);
		model.addAttribute("mbr_id",dto.getMbr_id());
		return null;
	}
}
