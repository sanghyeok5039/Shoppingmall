package com.shoppingmall.ordStt;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.shoppingmall.dao.OrdSttDAO;
import com.shoppingmall.dto.OrdSttDTO;

@Service("ordSttSvcImpl")
public class OrdSttServiceImpl implements IOrdSttService {

	@Autowired
	private OrdSttDAO dao;
	
//	@Autowired
//	private OrdersMDAO mDao;
	
	@Override
	public void ordSttSrch(Model md) {
		
//		Date today = new Date();
//		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
//		String date = format.format(today);
//		
//		ArrayList<OrdersDTO> al = mDao.ordSttMulSrch(date+"00:00:00",date+"23:59:00");
//		
//		md.addAttribute("ORDERLIST", al);
//		System.out.println(al.toString());
		
		ArrayList<OrdSttDTO> al = dao.ordSttList();
		md.addAttribute("ORDERLIST", al);
		
	}

	@Override
	public void ordSttCndtnSrch(Model md, HttpServletRequest req) {
		// TODO Auto-generated method stub
		String condition = req.getParameter("classify");
		String word = "%"+req.getParameter("srchWord")+"%";
		
		ArrayList<OrdSttDTO> al = null;
		
		if( "NO".equals(condition) )
		{
			al = dao.CndtnSrchNum(word);
		}
		else if( "ID".equals(condition) )
		{
			al =dao.CndtnSrchId(word);
		}
		else if( "NAME".equals(condition) )
		{
			al =dao.CndtnSrchName(word);
		}
		else if( "TEL".equals(condition) )
		{
			al =dao.CndtnSrchTel(word);
		}
		
		md.addAttribute("ORDERLIST", al);
		
	}

}
