package com.shoppingmall.home;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.shoppingmall.dao.IHomeDao;

@Service("homeSvc")
public class HomeServiceImpl implements IHomeService{
	
	@Autowired
	IHomeDao hDao;
	
	@Override
	public void mngHome(Model model) {
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
		SimpleDateFormat format2 = new SimpleDateFormat ("yy/MM/dd");
		
		Date time = new Date();
		
		//다음날 날짜 구하기
		Calendar cal = Calendar.getInstance();
		cal.setTime(time);
		cal.add(Calendar.DATE, 1);
		
		//회원 가입 일시는 String으로 되어있어서 형식바꿔서 today저장
		String today = format2.format(time);
		//다른 형식으로 today 저장.
		String today_start = format.format(time);
		//다음날 저장.
		String today_end=format.format((cal.getTime()));
		
		System.out.println("today_start"+today_start);
		System.out.println("today_end"+today_end);
		System.out.println("today"+today);

		int ord_cnt    = hDao.todayOrderCnt(today_start, today_end);
		int today_sale = hDao.todayTotSales(today_start, today_end);
		int today_join = hDao.todaySignUpCnt(today);
		
		model.addAttribute("ORD_CNT",ord_cnt);
		model.addAttribute("TODAY_SALE",today_sale);
		model.addAttribute("TODAY_JOIN",today_join);
		
	}
}
