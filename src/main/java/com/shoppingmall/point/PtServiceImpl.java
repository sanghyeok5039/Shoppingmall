package com.shoppingmall.point;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.google.gson.Gson;
import com.shoppingmall.dao.PtInOutMultiDao;
import com.shoppingmall.dto.MbrDto;
import com.shoppingmall.dto.PtInOutDto;

@Service("ptSvc")
public class PtServiceImpl implements IPtService{
	
	@Autowired
	private PtInOutMultiDao pmDao;
	
	@Override
	public String pointView(HttpSession session) {
		// TODO Auto-generated method stub
		List<PtInOutDto> li = null;
		MbrDto dto = (MbrDto) session.getAttribute("loginUser");	
		li = pmDao.getPtInOut(dto.getMbr_id());
		int total = 0;
		
		for(PtInOutDto pdto : li) {
			total += Integer.parseInt(pdto.getPt_in()) - Integer.parseInt(pdto.getPt_out()); 
		}
		
		session.setAttribute("POINT", li);
		session.setAttribute("pointTotal", total);
		
		return "pointView";
	}
	
	@Override
	public String getPoint(Model model, HttpSession session) {
		List<PtInOutDto> li = null;
		MbrDto dto = (MbrDto) session.getAttribute("loginUser");
		li = pmDao.getPtInOut(dto.getMbr_id());
		Gson gson = new Gson();
		int total = 0;
		for(PtInOutDto pdto : li) {
			total += Integer.parseInt(pdto.getPt_in()) - Integer.parseInt(pdto.getPt_out()); 
		}
		session.setAttribute("pointTotal", total);
		String jsonOut = gson.toJson(li);
		return jsonOut;
	}
}
