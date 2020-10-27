package com.shoppingmall.mbr;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.shoppingmall.dao.MbrDAO;
import com.shoppingmall.dao.MbrMDAO;
import com.shoppingmall.dto.MbrDto;

@Service("mbrSvcImpl")
public class MbrServiceImpl implements IMbrService {

	@Autowired
	private MbrMDAO mDao;
	@Autowired
	private MbrDAO dao;
	
	
	
	@Override
	public String mbrMulSrch(Model md) {
		//애도 그닥 리스트를 불러오는느낌은아닌뎅...............어케실행이된거지
		//안에 그 머야 데이터가 있긴한데
		//그게 우리가원하는데이터인지모르겟눈뎅 저게 몬 데이텅ㅁ ?
		//멤버mng들어가봣징 ㅇㅇ 거기 나오는 데이터가 저거아핫..
		ArrayList<String> al = mDao.mbrMulSrch();
		md.addAttribute("MBRLIST",al);
//		System.out.println("mbrtest : " +al.get(0).toString());
		if( al.size() > 0 ) 
		{
			return "home";
		}
		else
		{
			return "";
		}
		
	}

	@Override
	public String mbrOneSrch(Model md, HttpServletRequest req) {
		String id = req.getParameter("id");
//		System.out.println(id); //null왜?
		
		MbrDto dto = dao.getOne(id);
		
		if( dto == null ) 
		{
			return "";
		}
		else 
		{
			md.addAttribute("dto",dto);
			return "mbrDetail";
		}
		
	}

	@Override
	@Transactional
	public String mbrInsert(MbrDto dto) {
//		getParameter("mbrId")
		
		String id = dto.getMbr_id();
		
		MbrDto dto2 = dao.getOne(id);

		
		if( dto2 == null ) 
		{
			dao.insert(dto);
			return "";
		} 
		else 
		{
			return "";
		}
		
	}

	@Override
	@Transactional
	public String mbrUpdate(Model md, HttpServletRequest req) {
		String id = req.getParameter("id");
		String level = req.getParameter("MBR_LEVEL");
		
		MbrDto chkDto = dao.getOne(id);
		
		
		if( chkDto != null ) 
		{
			chkDto.setMbr_level(level);
			dao.update(chkDto);
			
			return "YES";
		} 
		else 
		{
			return "NO";
		}
		
	}

	@Override
	@Transactional
	public String mbrDelete(String id) {
		MbrDto dto = dao.getOne(id);
		
		if( dto == null )
		{
			return "error";
		}
		else
		{
			dao.delete(id);
			return "";
		}
		
		
	}

	@Override
	public String mbrCndtnSrch(Model md, HttpServletRequest req) {
		String condition  = req.getParameter("classify");
		String srchWord   = "%"+req.getParameter("mbrSrchWord")+"%";
		ArrayList<String> al = null;
		
		if( "MBR_NAME".equals(condition) )
		{
			al = mDao.nameSrch(srchWord);
		}
		else if( "MBR_ID".equals(condition) )
		{
			al = mDao.idSrch(srchWord);
		}
		else if( "MBR_TEL".equals(condition) )
		{
			al = mDao.telSrch(srchWord);
		}
		
		md.addAttribute("MBRLIST", al);
		
		return "";
	}

}
