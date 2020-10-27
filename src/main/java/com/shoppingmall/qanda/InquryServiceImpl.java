package com.shoppingmall.qanda;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.shoppingmall.dao.IInquryDao;
import com.shoppingmall.dto.InquryDto;
import com.shoppingmall.dto.MbrDto;
import com.shoppingmall.dto.PagingDto;
import com.shoppingmall.util.FileUtils;

@Service
@Primary
public class InquryServiceImpl implements IInquryService{

	@Autowired
	IInquryDao iqDao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public void inquryList(Model model, String condition, String strPageNum) throws Exception {
		if(condition==null||condition.isEmpty()) {
			condition="ALL";
		}
		
		if("ALL".equals(condition)) {
			viewAllInqury(model,strPageNum);
		}
		else if("Y".equals(condition)) {
			viewConditionInqury(model,condition,strPageNum);
		}
		else if("N".equals(condition)) {
			viewConditionInqury(model,condition,strPageNum);
		}
		model.addAttribute("condition", condition);
		System.out.println(condition);
	}
	
	@Override
	public void viewInqury(Model model,String strPageNum, String qanda_num) throws Exception {
		if(strPageNum==null||strPageNum.isEmpty()) {
			strPageNum="1";
		}
		else {
			;
		}
		int pageNum  = Integer.parseInt(strPageNum);
		
		int iqNum = Integer.parseInt(qanda_num);
		InquryDto iqDto = iqDao.getInqury(iqNum);
		
		List<Map<String, Object>> fileList = selectFileList(iqNum);

		model.addAttribute("fileList", fileList);
		model.addAttribute("iqDto", iqDto);
		model.addAttribute("pageNum",pageNum);
	}
	
	@Override
	public void viewAllInqury(Model model,String strPageNum) throws Exception{

		if(strPageNum==null||strPageNum.isEmpty()) {
			strPageNum="1";
		}
		else {
			;
		}
		int pageNum  = Integer.parseInt(strPageNum);
		int pageSize = 10;
		int pageBlock= 10;
		int startPage= 1;
		int pageCnt;
		int startNo = (pageNum-1)*pageSize+1;
		boolean pre = false;
		boolean next= false;
		
		if(pageNum%pageBlock !=0) {
			startPage =  (int) (pageNum/10)*10 +1;
		}
		else {
			startPage = (int)(((pageNum/10)-1)*10+1);
		}
		int cnt = iqDao.getCnt();
		if(cnt%pageSize==0) {
			pageCnt=cnt/pageSize;
		}
		else {
			pageCnt=(cnt/pageSize)+1;
		}
		int endPage = startPage+pageBlock-1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
		if(startPage>pageBlock) {
			pre = true;
		}
		if(endPage<pageCnt) {
			next = true;
		}
		PagingDto pgDto = new PagingDto();
		pgDto.setStartNo(startNo);
		pgDto.setPageSize(pageSize);
		
		List<InquryDto> list =iqDao.getInquryList(pgDto);
		
//		//오라클의 SYSDATE로 저장된 작성일을 보기 편한 형식으로 바꾸기 위해서 하나하나 형식 변경.
//		for(int i=0;i<list.size();i++) {
//			NoticeDto ntcDto = list.get(i);
//			Date date = ntcDto.getNotice_regDate();
////			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
//			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
//			String strDate = sdf.format(date);
//			Date newDate = sdf.parse(strDate);
//			ntcDto.setNotice_regDate(newDate);
//			list.add(i, ntcDto);
//		}
//		System.out.println(list.get(0).getNotice_regDate());
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("LIST",list);
		model.addAttribute("PRE", pre);
		model.addAttribute("NEXT", next);
	}
	
	@Override
	public void viewConditionInqury(Model model, String condition, String strPageNum) {
		if(strPageNum==null||strPageNum.isEmpty()) {
			strPageNum="1";
		}
		else {
			;
		}
		int pageNum  = Integer.parseInt(strPageNum);
		int pageSize = 10;
		int pageBlock= 10;
		int startPage= 1;
		int pageCnt;
		int startNo = (pageNum-1)*pageSize+1;
		boolean pre = false;
		boolean next= false;
		
		if(pageNum%pageBlock !=0) {
			startPage =  (int) (pageNum/10)*10 +1;
		}
		else {
			startPage = (int)(((pageNum/10)-1)*10+1);
		}
		int cnt = iqDao.getAnswerAtCnt(condition);
		if(cnt%pageSize==0) {
			pageCnt=cnt/pageSize;
		}
		else {
			pageCnt=(cnt/pageSize)+1;
		}
		int endPage = startPage+pageBlock-1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
		if(startPage>pageBlock) {
			pre = true;
		}
		if(endPage<pageCnt) {
			next = true;
		}
		PagingDto pgDto = new PagingDto();
		pgDto.setStartNo(startNo);
		pgDto.setPageSize(pageSize);
		
		List<InquryDto> list =iqDao.getAnswerAtInquryList(pgDto, condition);
		
//		//오라클의 SYSDATE로 저장된 작성일을 보기 편한 형식으로 바꾸기 위해서 하나하나 형식 변경.
//		for(int i=0;i<list.size();i++) {
//			NoticeDto ntcDto = list.get(i);
//			Date date = ntcDto.getNotice_regDate();
////			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
//			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
//			String strDate = sdf.format(date);
//			Date newDate = sdf.parse(strDate);
//			ntcDto.setNotice_regDate(newDate);
//			list.add(i, ntcDto);
//		}
//		System.out.println(list.get(0).getNotice_regDate());
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("condition", condition);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("LIST",list);
		model.addAttribute("PRE", pre);
		model.addAttribute("NEXT", next);
	}
	
	@Override
	public String viewMyAllInqury(Model model,String strPageNum,HttpSession session) {

		MbrDto dto = (MbrDto) session.getAttribute("loginUser");
		if(dto==null) {
			return "noneMbr";
		}
		String id = dto.getMbr_id();
		
		if(strPageNum==null||strPageNum.isEmpty()) {
			strPageNum="1";
		}
		else {
			;
		}
		int pageNum  = Integer.parseInt(strPageNum);
		int pageSize = 10;
		int pageBlock= 10;
		int startPage= 1;
		int pageCnt;
		int startNo = (pageNum-1)*pageSize+1;
		boolean pre = false;
		boolean next= false;
		
		if(pageNum%pageBlock !=0) {
			startPage =  (int) (pageNum/10)*10 +1;
		}
		else {
			startPage = (int)(((pageNum/10)-1)*10+1);
		}
		int cnt = iqDao.getMyInquryCnt(id);
		if(cnt%pageSize==0) {
			pageCnt=cnt/pageSize;
		}
		else {
			pageCnt=(cnt/pageSize)+1;
		}
		int endPage = startPage+pageBlock-1;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
		if(startPage>pageBlock) {
			pre = true;
		}
		if(endPage<pageCnt) {
			next = true;
		}
//		PagingDto pgDto = new PagingDto();
//		pgDto.setStartNo(startNo);
//		pgDto.setpageSize(pageSize);
		
		HashMap<String, Object> hm = new HashMap<String, Object>();
		
		hm.put("startNo" ,startNo);
		hm.put("pageSize",pageSize);
		hm.put("mbr_id"  ,id);
		
		List<InquryDto> list =iqDao.getMyInquryList(hm);
		
//		//오라클의 SYSDATE로 저장된 작성일을 보기 편한 형식으로 바꾸기 위해서 하나하나 형식 변경.
//		for(int i=0;i<list.size();i++) {
//			NoticeDto ntcDto = list.get(i);
//			Date date = ntcDto.getNotice_regDate();
////			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
//			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
//			String strDate = sdf.format(date);
//			Date newDate = sdf.parse(strDate);
//			ntcDto.setNotice_regDate(newDate);
//			list.add(i, ntcDto);
//		}
//		System.out.println(list.get(0).getNotice_regDate());
		System.out.println(pageNum);
		model.addAttribute("CNT", list.size());
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("LIST",list);
		model.addAttribute("PRE", pre);
		model.addAttribute("NEXT", next);
		
		return "cstInquryList";
	}
	
	@Override
	public void writeInqury(String category, HttpSession session, InquryDto iqDto
			,MultipartHttpServletRequest mpRequest) throws Exception{
		MbrDto dto = (MbrDto) session.getAttribute("loginUser");
		String id = dto.getMbr_id();
		String title  = iqDto.getQanda_title();
		String content= iqDto.getQanda_content();
		
		if(category.equals("purchase")) {
			title = "[입금 및 결제]"+title;
		}else if(category.equals("delivery")) {
			title = "[배송]"+title;
		}else if(category.equals("cancel")) {
			title = "[환불 및 취소]"+title;
		}else if(category.equals("exchange")) {
			title = "[상품교환]"+title;
		}else if(category.equals("nonmember")) {
			title = "[비회원 문의]"+title;
		}

		title = title.replace("<", "&lt");
		title = title.replace(">", "&gt");
		title = title.replace(" ", "&nbsp;&nbsp;");
		
		content = content.replace("<", "&gt");
		content = content.replace(">", "&gt");
		content = content.replace("\n", "<br>");
		
		iqDto.setQanda_title(title);
		iqDto.setQanda_content(content);
		iqDto.setQanda_answer("");
		iqDto.setMbr_id(id);
		iqDao.insert(iqDto);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfoInqury(iqDto, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			iqDao.insertFile(list.get(i)); 
		}
	}

	@Override
	public void writeAnswer(Model model, InquryDto iqDto) {
		InquryDto chkDto = iqDao.getInqury(iqDto.getQanda_num());
		if(chkDto == null) {
			System.out.println("존재하지않는 게시글입니다.");
			return ;
		}
		String answer    = iqDto.getQanda_answer();
		System.out.println(answer);
		String qanda_at = "Y";
		chkDto.setQanda_answer(answer);
		chkDto.setQanda_at(qanda_at);
		iqDao.update(chkDto);
		
	}

	@Override
	public List<Map<String, Object>> selectFileList(int iqNum) throws Exception {
		return iqDao.selectFileList(iqNum);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return iqDao.selectFileInfo(map);
	}



	




}
