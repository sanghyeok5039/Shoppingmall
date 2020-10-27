package com.shoppingmall.qanda;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.shoppingmall.dto.InquryDto;

public interface IInquryService {
	void 	inquryList(Model model,String condition,String strPageNum) throws Exception;		//문의내역을 볼 때 조건을 보고 해당 조건에 맞는 문의글 받아오기
	void 	viewInqury(Model model,String strPageNum, String qanda_num) throws Exception;
	void 	viewAllInqury(Model model,String strPageNum) throws Exception;
	void 	viewConditionInqury(Model model,String condition,String strPageNum);
	String 	viewMyAllInqury(Model model,String strPageNum,HttpSession session);
	void 	writeInqury(String category, HttpSession session, InquryDto iqDto,MultipartHttpServletRequest mpRequest)throws Exception;;
	void 	writeAnswer(Model model,InquryDto iqDto);
	
	public List<Map<String, Object>> selectFileList(int iqNum) throws Exception;		//파일리스트 조회
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;//파일 다운로드
}
