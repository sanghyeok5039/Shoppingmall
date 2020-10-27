package com.shoppingmall.closing;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.shoppingmall.dao.IClosingDao;
import com.shoppingmall.dto.ClosingDto;

@Service("closSvc")
@Primary
public class ClosingServiceImpl implements IClosingService{
	
	@Autowired
	IClosingDao closDao;
	
	@Override
	public String saleList(Model model) {
		Date tmptime= new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		
		String ymd = format.format(tmptime);
		String year = ymd.substring(0, 4);
		String month= ymd.substring(4,6);
		
		return saleLog(model,year,month);
	}
	
	@Override
	public String saleLog(Model model, String year, String month) {
//		if(month.equals(null)||month.isEmpty()) {
//			month = "01";
//		}
		String condition = year;
		List<String> monthSale = new ArrayList<String>();
		List<String> daySale   = new ArrayList<String>();
		
		int nMonth = Integer.parseInt(month);
		int monthTot = 0;
		int yearTot  = 0;
		int mon = 1;
		int day = 1;
		int sum = 0;

		List<ClosingDto> list =  new ArrayList<ClosingDto>(); 
		list = closDao.sltCondition(condition);
		for(int i=1; i<=12; i++) {
			monthSale.add("0");
			for(int j=1;j<=31;j++) {
				daySale.add("0");
			}
		}
		
		for(int i=0 ; i<list.size(); i++) {
		
			ClosingDto dto  = list.get(i);
			String closDate = dto.getClos_date();
			String strMonth = closDate.substring(4, 6);
			int    tmpMonth   = Integer.parseInt(strMonth);

			if(tmpMonth == nMonth) {
				daySale.add(day,dto.getClos_total());
				monthTot += Integer.parseInt(dto.getClos_total());
				day++;
			}
			
			if(tmpMonth == mon) {
				sum += Integer.parseInt(dto.getClos_total());
			}
			else {
				monthSale.add(mon, String.valueOf(sum));		//달이 넘어가게되면 이전 달의 총 매출을 저장.
				yearTot += sum;									//연매출 
				sum=0;											//총 매출액 초기화
				mon++;											//다음달로 이동.
				sum += Integer.parseInt(dto.getClos_total());	//달이 넘어가고 첫날의 매출 저장.
			}
		}
		//마지막 달의 마지막 날 매출 저장.
		monthSale.add(mon, String.valueOf(sum));
		yearTot += sum;	

		model.addAttribute("mList"   , monthSale);
		model.addAttribute("dList"   , daySale  );
		model.addAttribute("yearTot" , yearTot );
		model.addAttribute("monthTot", monthTot);
		model.addAttribute("year", year);
		model.addAttribute("month", nMonth);
		
		return "sales";
	}
	
	//전일마감처리
	@Override
	public String closing(Model model,HttpSession session) {
		SimpleDateFormat format = new SimpleDateFormat ("yyyyMMdd");
		String msg;
		Date time = new Date();
		
		//전날 날짜 구하기
		Calendar cal = Calendar.getInstance();
		cal.setTime(time);
		cal.add(Calendar.DATE, -1);
		
		//오늘 저장.
		String today=format.format(time);
		//전날 저장.
		String preDay=format.format((cal.getTime()));
		
		String preDayTotSales = closDao.getPreDayTotSales(preDay, today);
		String preDayOrderCnt = closDao.getPreDayOrderCnt(preDay, today);
		try {
			//전날 마감 여부 체크
			ClosingDto closDto = closDao.sltOne(preDay);
			
			if(closDto == null) {
				closDao.closing(preDay, preDayTotSales, preDayOrderCnt);
				msg = "마감처리가 완료되었습니다.";
				session.setAttribute("closingComplete", true);
			}
			else {
				msg = "이미 마감처리가 완료되었습니다.";
			}
			
		}catch(Exception e) {
			return "failClosing";
		}
		
		model.addAttribute("msg", msg);
		return "successClosing";
	}

	@Override
	public void chkClosing(Model model,HttpSession session) {
		SimpleDateFormat format = new SimpleDateFormat ("yyyyMMdd");

		Date time = new Date();
		
		//전날 날짜 구하기
		Calendar cal = Calendar.getInstance();
		cal.setTime(time);
		cal.add(Calendar.DATE, -1);
		
		//전날 마감했는지 체크를 위한 전날 저장.
		String clos_date=format.format((cal.getTime()));
		
		ClosingDto closDto = closDao.sltOne(clos_date);
		if(closDto == null) {
			session.setAttribute("closingComplete", false);
		}
		else {
			session.setAttribute("closingComplete", true);
		}
	}

}
