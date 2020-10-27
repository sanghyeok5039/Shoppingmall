package com.shoppingmall.member;


import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.shoppingmall.dao.MbrCUDDao;
import com.shoppingmall.dao.MbrMultiDao;
import com.shoppingmall.dto.MbrDto;

@Service("mbrSvc")
public class MemberSvcImpl implements IMemberService {
	
	@Autowired
	private MbrCUDDao mcDao;
	@Autowired
	private MbrMultiDao mmDao;

	
	/* (non-Javadoc)
	 * @see com.webProject.mvc01.IMbrSvc#login(java.lang.String, java.lang.String, org.springframework.ui.Model)
	 */
	
	public String myPage(String id , String pw, HttpSession session) {
		MbrDto dto = null;
		dto = mcDao.getMbr(id);
		if(dto == null) {
			session.setAttribute("myPageState", "failed");
			return "redirect:myPageContainer";
		}
		if(dto.getMbr_pw().equals(pw)) {

			session.setAttribute("myPageState", "success");
			return "redirect:myPageContainer";
		} else {
			
			session.setAttribute("myPageState", "failed");
			return "redirect:myPageContainer";
		}
	}
	
	public MbrDto setUserInfo(MbrDto dto) {

		String mbr_sex = dto.getMbr_sex();
		if(mbr_sex.equals("0")) {
			dto.setMbr_sex("남성");
		} else {
			dto.setMbr_sex("여성");
		}
		
		String[] tempAdr = dto.getMbr_adres().split("\\|");
		dto.setPostcode(tempAdr[0]);
		dto.setRoadAddress(tempAdr[1]);
		dto.setDetailAddress(tempAdr[2]);
		
		dto.setMbr_adres(tempAdr[1] + " " + tempAdr[2]);
		String[] tempEm = dto.getMbr_email().split("@");
		dto.setEmailPrefix(tempEm[0]);
		dto.setEmailSuffix(tempEm[1]);
		return dto;
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public String login(String id, String pw, HttpSession session) {
		MbrDto dto = null;
		dto = mcDao.getMbr(id);
		boolean result = false;
		JSONObject jsonObj = new JSONObject();
		
		if(dto == null) {
			session.setAttribute("loginState", "failed");
			result = false;
		} else {
			if(dto.getMbr_pw().equals(pw)) {
				dto = setUserInfo(dto);		
				session.setAttribute("loginUser" , dto);
				session.setAttribute("loginState", "success");
				jsonObj.put("id",dto.getMbr_id());
				result = true;
			} else {
				session.setAttribute("loginState", "failed");
				result = false;
			}		
		}
		jsonObj.put("result", result);
		
		String jsonOut = jsonObj.toString();
		return jsonOut;
	}

	@SuppressWarnings("unchecked")
	@Override
	public String idCheck(String id) {
		// TODO Auto-generated method stub
		MbrDto dto = null;
		boolean result = false;
		dto = mcDao.getMbr(id);
				
		if(dto == null) {
			result = true;
		}
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		
		String jsonOut = jsonObj.toString();
		return jsonOut;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public String idFind(String name, String tel) {
		// TODO Auto-generated method stub
		MbrDto dto = null;
		boolean result = false;
		JSONObject jsonObj = new JSONObject();
		dto = mmDao.getId(name, tel);
		if(dto == null) {
		} else {
			result = true;
			jsonObj.put("id", dto.getMbr_id());
		}
		jsonObj.put("result", result);
		
		String jsonOut = jsonObj.toString();
		return jsonOut;
	}
	@SuppressWarnings("unchecked")
	@Override
	public String pwFind(String id, String tel) {
		// TODO Auto-generated method stub
		MbrDto dto = null;
		boolean result = false;
		JSONObject jsonObj = new JSONObject();
		dto = mcDao.getMbr(id);
		
		if(tel.equals(dto.getMbr_tel())) {
			result = true;
			jsonObj.put("pw", dto.getMbr_pw());
		} 
		jsonObj.put("result", result);
		
		String jsonOut = jsonObj.toString();
		return jsonOut;
	}
	@Override
	@Transactional
	public String insertMbr(MbrDto dto, HttpSession session) {
		// TODO Auto-generated method stub
		
		MbrDto tDto = mcDao.getMbr(dto.getMbr_id());
		
		if(tDto != null) {
			return "signUp";
		}
		
		if(dto.getMbr_sex().equals("male")) {
			dto.setMbr_sex("0");
		} else {
			dto.setMbr_sex("1");
		}
		//이메일, 주소 설정
		dto.setMbr_adres(dto.getPostcode() + "|" + dto.getRoadAddress() + "|" + dto.getDetailAddress());
		dto.setMbr_email(dto.getEmailPrefix() + "@" + dto.getEmailSuffix());
		//일반 유저의 회원가입 시
		dto.setMbr_grade("0");
		dto.setMbr_level("1");
		dto.setMbr_point("0");
		dto.setMbr_secsn("0");
		
		mcDao.insertMbr(dto);
		return "login";
	}
	@Override
	@Transactional
	public String updateMbr(MbrDto dto, HttpSession session) {
		MbrDto tDto = mcDao.getMbr(dto.getMbr_id());
		
		if(tDto == null) {
			return "login";
		}
		
		//이메일, 주소 설정
		dto.setMbr_adres(dto.getPostcode() + "|" + dto.getRoadAddress() + "|" + dto.getDetailAddress());
		dto.setMbr_email(dto.getEmailPrefix() + "@" + dto.getEmailSuffix());
		
		if(dto.getMbr_sex().equals("male")) {
			dto.setMbr_sex("0");
		} else {
			dto.setMbr_sex("1");
		}
		//일반 유저의 회원정보 수정 시
		dto.setMbr_rgsde(tDto.getMbr_rgsde());
		dto.setMbr_grade(tDto.getMbr_grade());
		dto.setMbr_level(tDto.getMbr_level());
		dto.setMbr_point(tDto.getMbr_point());
		dto.setMbr_secsn(tDto.getMbr_secsn());
		mcDao.updateMbr(dto);
		
		MbrDto rdto = mcDao.getMbr(dto.getMbr_id());
		rdto = setUserInfo(rdto);		
		session.setAttribute("loginUser" , rdto);
		session.setAttribute("myPageView", "myPage");
		return "redirect:myPageContainer";
	}
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public String secession(String id, String pw, HttpSession session) {
		
		MbrDto dto = null;
		MbrDto userDto = (MbrDto) session.getAttribute("loginUser");
		dto = mcDao.getMbr(id);
		
		boolean result = false;
		JSONObject jsonObj = new JSONObject();
		
		if(dto == null) {
			session.setAttribute("secessionState", "failed");
			result = false;
		} else {
			if(dto.getMbr_pw().equals(pw) && dto.getMbr_id().equals(userDto.getMbr_id())) {
				mcDao.deleteMbr(dto);
				session.removeAttribute("loginUser");
				session.removeAttribute("pointInOut");
				session.removeAttribute("myPageState");
				session.removeAttribute("myPageView");
				result = true;
			} else {
				session.setAttribute("secessionState", "failed");
				result = false;
			}
		}
		jsonObj.put("result", result);
		
		String jsonOut = jsonObj.toString();
		return jsonOut;
	}
	// 비회원 조회 추가
	@SuppressWarnings("unchecked")
	@Override
	public String getNonMbr(Model model, String tel, String pw) {
		// TODO Auto-generated method stub
		MbrDto dto = null;
		JSONObject jsonObj = new JSONObject();
		boolean result = false;
		
		dto = mmDao.getNonMbr(tel, pw);
		if(dto != null) {
			result = true;
			jsonObj.put("mbr_id", dto.getMbr_id());
		} else {
			result = false;
		}
		jsonObj.put("result", result);
		
		String jsonOut = jsonObj.toString();
		return jsonOut;
	}



}
