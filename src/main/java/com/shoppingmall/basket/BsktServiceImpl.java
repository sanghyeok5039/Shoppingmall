package com.shoppingmall.basket;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.google.gson.Gson;
import com.shoppingmall.dao.BasketCUDDao;
import com.shoppingmall.dao.BasketMultiDao;
import com.shoppingmall.dto.BasketDto;
import com.shoppingmall.dto.MbrDto;

@Service("bsktSvc")
public class BsktServiceImpl implements IBsktService{
	@Autowired
	BasketCUDDao bsktcDao;
	
	@Autowired
	BasketMultiDao bsktmDao;
	
	@Override
	public String getAllBasket(Model model, String id) {
		List<BasketDto> li = bsktmDao.getAllBskt(id);
		int basketTotal = 0;
		double basketPointTotal = 0;
		for(BasketDto bdto : li) {
			bdto.setProduct_getPoint();
			bdto.setProduct_total();
			basketTotal += bdto.getProduct_total();
			basketPointTotal += bdto.getProduct_getPoint();
		}
		model.addAttribute("BASKET", li);
		model.addAttribute("basketTotal", basketTotal);
		model.addAttribute("basketPtTotal", (int)basketPointTotal);
		
		return "basketView";
	}
	
	@Override
	public String getAllBasketDB(Model model, String id) {
		List<BasketDto> li = bsktmDao.getAllBskt(id);
		int basketTotal = 0;
		double basketPointTotal = 0;
		for(BasketDto bdto : li) {
			bdto.setProduct_getPoint();
			bdto.setProduct_total();
			basketTotal += bdto.getProduct_total();
			basketPointTotal += bdto.getProduct_getPoint();
		}
		model.addAttribute("BASKET", li);
		model.addAttribute("basketTotal", basketTotal);
		model.addAttribute("basketPtTotal", (int)basketPointTotal);
		
		return "basketView";
	}
	
	@Override
	public String getAllBasketSession(HttpSession session) {
		@SuppressWarnings("unchecked")
		List<BasketDto> li = (List<BasketDto>) session.getAttribute("BasketSession");
		int basketTotal = 0;
		double basketPointTotal = 0;
		if(li != null) {
			for(BasketDto bdto : li) {
				bdto.setProduct_getPoint();
				bdto.setProduct_total();
				basketTotal += bdto.getProduct_total();
				basketPointTotal += bdto.getProduct_getPoint();
			}			
		}
		session.setAttribute("BASKET", li);
		session.setAttribute("basketTotal", basketTotal);
		session.setAttribute("basketPtTotal", (int)basketPointTotal);
		
		return "basket";
	}
	
	@SuppressWarnings("unchecked")
	public String deleteBasket(Model model, String product_id, String mbr_id) {
		
		boolean result = false;
		String[] spl = product_id.split(",");
		BasketDto dto = new BasketDto();
		dto.setMbr_id(mbr_id);
		
		for(String temp : spl) {
			BasketDto bdto = bsktcDao.getBskt(dto.getMbr_id(),temp);
			if(bdto != null) {
				dto.setProduct_id(temp);
				bsktcDao.deleteBskt(dto);
				result = true;
			} else {
				result = false;
			}
		}
		
		List<BasketDto> li = bsktmDao.getAllBskt(mbr_id);
		model.addAttribute("BASKET", li);
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		
		String jsonOut = jsonObj.toString();
		return jsonOut;
	}
	
	@Override
	public String getBasketMbr(Model model, HttpSession session) {
		MbrDto dto = (MbrDto) session.getAttribute("loginUser");
		List<BasketDto> li = bsktmDao.getAllBskt(dto.getMbr_id());
		int basketTotal = 0;
		double basketPointTotal = 0;
		for(BasketDto bdto : li) {
			bdto.setProduct_getPoint();
			bdto.setProduct_total();
			basketTotal += bdto.getProduct_total();
			basketPointTotal += bdto.getProduct_getPoint();
		}

		model.addAttribute("basketTotal", basketTotal);
		model.addAttribute("basketPtTotal", (int)basketPointTotal);
		Gson gson = new Gson();
		String jsonOut = gson.toJson(li);
		return jsonOut;
	}

}
