package com.shoppingmall.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.shoppingmall.dto.PagingDto;
import com.shoppingmall.dto.InquryDto;

public interface IInquryDao {
	
	int getCnt();
	int getAnswerAtCnt(String condition);
	int getMyInquryCnt(String mbr_id);
	List<InquryDto> getAnswerAtInquryList(@Param("pgDto")PagingDto pgDto,@Param("answer_at")String condition);
	InquryDto getInqury(int qanda_num);
	List<InquryDto> getInquryList(PagingDto pgDto);
	List<InquryDto> getMyInquryList(HashMap<String, Object> hm);
	void insert(InquryDto iqDto);
	void update(InquryDto iqDto);
	
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;			//파일조회
	void insertFile(Map<String,Object> map) throws Exception;							//파일 업로드
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;//파일 다운로드
	
}
