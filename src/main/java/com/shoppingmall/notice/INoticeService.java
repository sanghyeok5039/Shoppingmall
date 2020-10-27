package com.shoppingmall.notice;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.shoppingmall.dto.NoticeDto;

public interface INoticeService {
	String viewNotice(Model model,String notice_num) throws Exception;
	String viewAllNotice(Model model,String strPageNum) throws Exception;
	String writeNotice(HttpSession session,NoticeDto ntcDto,MultipartHttpServletRequest mpRequest) throws Exception;
	String editNotice(Model model,NoticeDto ntcDto);
	String delNotice(Model model,String[] delNoticeNum);
	
	public List<Map<String, Object>> selectFileList(int ntcNum) throws Exception;		//파일리스트 조회
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;//파일 다운로드
}
