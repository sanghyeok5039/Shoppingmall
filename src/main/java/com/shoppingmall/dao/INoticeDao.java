package com.shoppingmall.dao;


import java.util.List;
import java.util.Map;

import com.shoppingmall.dto.PagingDto;
import com.shoppingmall.dto.NoticeDto;

public interface INoticeDao {
	List<NoticeDto> getList(PagingDto pgDto);
	NoticeDto getOne(int notice_num);
	void insert(NoticeDto ntcDto);
	void update(NoticeDto ntcDto);
	void delete(int notice_num);
	int  getCnt();
	
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;			//파일조회
	void insertFile(Map<String,Object> map) throws Exception;							//파일 업로드
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;//파일 다운로드
}
