package com.shoppingmall.prd;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.shoppingmall.dao.CtgryDAO;
import com.shoppingmall.dao.CtgryMDAO;
import com.shoppingmall.dao.PrdDAO;
import com.shoppingmall.dao.PrdDtDAO;
import com.shoppingmall.dao.PrdMDAO;
import com.shoppingmall.dto.CtgryDTO;
import com.shoppingmall.dto.MCtgryDTO;
import com.shoppingmall.dto.MenuDTO;
import com.shoppingmall.dto.PrdDTO;

@Service("prdSvcImpl")
public class PrdServiceImpl implements IPrdService {

	@Autowired
	private PrdDAO dao;
	@Autowired
	private PrdMDAO mDao;
	@Autowired
	private CtgryDAO cDao;
	@Autowired
	private CtgryMDAO cmDao;
	@Autowired
	private PrdDtDAO dtDao;
	
	
	@Override
	public String prdMulSrch(Model md) {
		
		ArrayList<PrdDTO>  al = mDao.getList();
		md.addAttribute("PRDLIST",al);
		
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
	public String prdOneSrch(Model md, HttpServletRequest req) {
		String id = req.getParameter("prdId");
		
		//PRD 상품 ID 로 상세정보 조회
		PrdDTO dto = dao.getOne(id);
		ArrayList<PrdDTO> sizeList = mDao.getSizeList(id);
		
		
		if( dto == null )
		{
			return "";
		}
		else
		{
			//상세정보에서 카테고리ID 가져옴
			String cId = dto.getCtgr_id();
			System.out.println("소분류ID="+cId);
			// 카테고리ID로 카테고리 상세정보 조회
			CtgryDTO cDto = cDao.getCtgr(cId);
			// 상세정보에서 메인 카테고리 ID 가져옴
			String mId = cDto.getM_Ctgr_Id();
			System.out.println("대분류ID="+mId);
			// 메인 카테고리 ID 로 상세정보 조회
			MCtgryDTO mDto = cDao.getMctgr(mId);
			System.out.println(mDto.getM_Ctgr_Name());
			
//			ArrayList<CtgryDTO> al =  cmDao.getChangedCtgrList();
			ArrayList<CtgryDTO>   al = cmDao.getCtgrList();
			ArrayList<MCtgryDTO> mAl = cmDao.getMctgrList();
			
			md.addAttribute("dto",dto); // 상품상세
			md.addAttribute("cDto",cDto); // 소분류
			md.addAttribute("mDto",mDto); // 대분류
			md.addAttribute("CTGR",al);   // 소문류 목록
			md.addAttribute("MCTGR",mAl); // 대분류 목록
			md.addAttribute("SIZELIST",sizeList);
			
			return "";
		}
		
	}


	@Override
	public void prdInsert(Model md, HttpServletRequest req) {
		String prdId   = req.getParameter("prdId");
		String prdName = req.getParameter("prdName");
		String mId     = req.getParameter("mainCtgrSelected");
		String sub     = req.getParameter("sub");
		String content = req.getParameter("memo");
		String img     = req.getParameter("file");
		String state   = req.getParameter("state");
		String price   = req.getParameter("price");
		String color   = req.getParameter("color");
		String cnt     = req.getParameter("cnt");
		String size    = req.getParameter("size");
		
		
		//기존 것 체크.
		PrdDTO chckDto = dao.getOne(prdId);
		String id="";
		String dId="";
		PrdDTO trDto = new PrdDTO();
		if( chckDto == null)
		{
			
			int num = mDao.prdMaxRownum()+1;
			System.out.println(num);
			if ( 10 <= num && num < 100 )
			{
				id = "p0"+num;
				
			}
			else if( num < 10 )
			{
				id = "p00"+num;
			}
			System.out.println(id);
			
			trDto.setPrd_id(id);
			trDto.setCtgr_id(sub);
			trDto.setPrd_name(prdName);
			trDto.setPrd_stt(state);
			trDto.setM_ctgr_id(mId);
			trDto.setPrd_img(img);
			trDto.setPrd_cntnt(content);
			trDto.setPrd_price(price);
			trDto.setPrd_color(color);
			trDto.setPrd_cnt(cnt);
			trDto.setPrd_size(size);
			trDto.setPrd_grade("0");

			int dNum = mDao.prdDtMaxRownum()+1;
			
			
			if( 10 <= dNum && dNum < 100 )
			{
				dId = "df0"+dNum;
			}
			else if ( dNum < 10 )
			{
				dId = "df00"+dNum;
			}
			System.out.println("DETAIL ID : "+dId);
			trDto.setDf_id(dId);
			
			System.out.println(trDto.getPrd_id());
			System.out.println(trDto.getCtgr_id());
			System.out.println(trDto.getPrd_name());
			System.out.println(trDto.getPrd_stt());
			System.out.println(trDto.getPrd_grade());
			System.out.println(trDto.getM_ctgr_id());
			System.out.println(trDto.getPrd_img());
			System.out.println(trDto.getPrd_cntnt());
			
			
			dao.insert(trDto);
			dtDao.insert(trDto);
			
		}
		else if( chckDto != null )
		{
			trDto.setPrd_id(id);
			trDto.setPrd_price(price);
			trDto.setPrd_color(color);
			trDto.setPrd_cnt(cnt);
			trDto.setPrd_size(size);
			
			int dNum = mDao.prdDtMaxRownum()+1;
			
			if( 10 < dNum && dNum < 100 )
			{
				dId = "df0"+dNum;
			}
			else if ( dNum < 10 )
			{
				dId = "df00"+dNum;
			}
			
			trDto.setDf_id(dId);
			
			//제품 상세만 인서트
			dtDao.insert(trDto);
			
			int prdCnt = Integer.parseInt(chckDto.getPrd_cnt());
			int dfCnt  = Integer.parseInt(cnt);
			int result = prdCnt + dfCnt;
			
			chckDto.setPrd_cnt(String.valueOf(result));
			
			//product count 업데이트
			dao.update(chckDto);
			
			
		}
		
	}

	@Override
	public String prdUpdate(Model md, HttpServletRequest req) {
		String id = req.getParameter("prdId");
		String name = req.getParameter("prdName");
		String main = req.getParameter("mainCtgrSelected");
		String sub = req.getParameter("sub");
		String content = req.getParameter("memo");
		String price = req.getParameter("price");
		String stt = req.getParameter("stt");
		
		System.out.println("ID : "+id);
		System.out.println("NAME : " + name);
		System.out.println("MAIN : " +main);
		System.out.println("SUB : " + sub);
		System.out.println("CONTENT : " + content);
		System.out.println("PRICE : " + price);
		System.out.println("STATE : " + stt);
		
//		PrdEleDTO chkDto = dao.getEleOne(id);
		PrdDTO dto = dao.getOne(id);
		dto.setPrd_name(name);
		dto.setCtgr_id(sub);
		dto.setM_ctgr_id(main);
		dto.setPrd_cntnt(content);
		dto.setPrd_stt(stt);
		
//		chkDto.setPRODUCT_NAME(name);
//		chkDto.setM_CTGR_ID(main);
//		chkDto.setCTGR_ID(sub);
//		chkDto.setPRODUCT_CONTENT(content);
//		chkDto.setPRODUCT_STATE(stt);
		
		dao.update(dto); // else update
		
		dtDao.update(dto); // price update
		
		
		
		
			return "";
		
	}

	@Override
	public String prdDelete(String id) {
		PrdDTO dto = dao.getOne(id);
		
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
	public String setCategory(Model md) {
		
		ArrayList<CtgryDTO>   al = cmDao.getCtgrList();
		ArrayList<MCtgryDTO> mAl = cmDao.getMctgrList();
		
		md.addAttribute("CTGR" ,al );   // 소문류 목록
		md.addAttribute("MCTGR",mAl);   // 대분류 목록
		
		return null;
	}

	@Override
	public String setCategoryMenu(HttpSession session) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		ArrayList<MenuDTO> menuAl = (ArrayList<MenuDTO>) session.getAttribute("MENU");
		if(menuAl != null) {
			return null;
		}
		ArrayList<CtgryDTO>   al = cmDao.getCtgrList();
		ArrayList<MCtgryDTO> mAl = cmDao.getMctgrList();
		menuAl = new ArrayList<MenuDTO>();
		
		for(MCtgryDTO li : mAl) {
			ArrayList<CtgryDTO> temp = new ArrayList<CtgryDTO>();
			MenuDTO dto = new MenuDTO();
			dto.setM_Ctgr_Id(li.getM_Ctgr_Id());
			dto.setM_Ctgr_Name(li.getM_Ctgr_Name());
			for(CtgryDTO list : al) {
				if(li.getM_Ctgr_Id().equals(list.getM_Ctgr_Id())) {
					temp.add(list);
					
				}
			}			
			dto.setCtgryList(temp);
			menuAl.add(dto);
		}
		
		session.setAttribute("MENU", menuAl);
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String getCnt(String id, String size) {
		
		String cnt = mDao.getCnt(id, size);
		
		JSONObject jsonObj = new JSONObject();
		
		if ( cnt.isEmpty() )
		{
			;
		}
		else 
		{
			jsonObj.put("cnt", cnt);
		}
		
		
		return jsonObj.toString(); 
	}
	
	//조건조회이셈.
		@Override
		public String prdCndtnSrch(Model md, HttpServletRequest req) {
			String srchWord = req.getParameter("prdSrchWord"); // 검색어
			String clsfy = req.getParameter("classify"); 	// 콤보박스 선택
			ArrayList<PrdDTO> al = new ArrayList<PrdDTO>();
			
			System.out.println(srchWord);
			
			if( "PRODUCT_NAME".equals(clsfy) )
			{
				al = mDao.getCndtnSrchP("%"+srchWord+"%");
				md.addAttribute("PRDLIST",al);
			}
			else if( "M_CTGR_NAME".equals(clsfy) )
			{
				
				al = mDao.getCndtnSrchC("%"+srchWord+"%");
				md.addAttribute("PRDLIST",al);
			}
			
			return null;
		}
	

}
