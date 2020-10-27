package com.shoppingmall.notice;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.shoppingmall.dao.INoticeDao;
import com.shoppingmall.dto.MbrDto;
import com.shoppingmall.dto.NoticeDto;
import com.shoppingmall.dto.PagingDto;
import com.shoppingmall.util.FileUtils;

@Service("ntcSvc")
@Primary
public class NoticeServiceImpl implements INoticeService{
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	INoticeDao ntcDao;
	
	@Override
	public String viewNotice(Model model, String notice_num) throws Exception {
		int ntcNum = Integer.parseInt(notice_num);
		NoticeDto ntcDto = ntcDao.getOne(ntcNum);
//		int readCnt = ntcDto.getNotice_readCount();
		String strCnt = ntcDto.getNotice_readCount();
		int readCnt = Integer.parseInt(strCnt);
		readCnt += 1;
		ntcDto.setNotice_readCount(String.valueOf(readCnt));
		ntcDao.update(ntcDto);
	
		List<Map<String, Object>> fileList = selectFileList(ntcNum);

		model.addAttribute("fileList", fileList);
		model.addAttribute("ntcDto", ntcDto);
		return null;
	}

	@Override
	public String viewAllNotice(Model model,String strPageNum) throws Exception{

		if(strPageNum==null||strPageNum.isEmpty()) {
			strPageNum="1";
		}
		else {
			;
		}
		int pageNum  = Integer.parseInt(strPageNum);
		int pagesize = 10;
		int pageBlock= 10;
		int startPage= 1;
		int pageCnt;
		int startRow = (pageNum-1)*pagesize+1;
		boolean pre = false;
		boolean next= false;
		
		if(pageNum%pageBlock !=0) {
			startPage =  (int) (pageNum/10)*10 +1;
		}
		else {
			startPage = (int)(((pageNum/10)-1)*10+1);
		}
		int cnt = ntcDao.getCnt();
		if(cnt%pagesize==0) {
			pageCnt=cnt/pagesize;
		}
		else {
			pageCnt=(cnt/pagesize)+1;
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
		pgDto.setStartNo(startRow);
		pgDto.setPageSize(pagesize);
		
		List<NoticeDto> list =ntcDao.getList(pgDto);
		
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
		
		return null;
	}
	
	@Override
	public String writeNotice(HttpSession session, NoticeDto ntcDto, MultipartHttpServletRequest mpRequest) throws Exception {
		
		
		MbrDto dto = (MbrDto) session.getAttribute("loginUser");
		String id = dto.getMbr_id();
		
		String title  = "[공지사항]"+ntcDto.getNotice_title();
		String content= ntcDto.getNotice_content();
		
		title = title.replace("<", "&lt");
		title = title.replace(">", "&gt");
		title = title.replace(" ", "&nbsp;&nbsp;");
		
		content = content.replace("<", "&gt");
		content = content.replace(">", "&gt");
//		content = content.replace("\n", "<br>");
		// TODO 
		ntcDto.setNotice_title(title);
		ntcDto.setNotice_content(content);
		ntcDto.setMbr_id(id);
		ntcDao.insert(ntcDto);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfoNotice(ntcDto, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			ntcDao.insertFile(list.get(i)); 
		}
		
		return null;
	}

	@Override
	public String editNotice(Model model, NoticeDto ntcDto) {
		
		ntcDao.update(ntcDto);
		
		return null;
	}

	@Override
	public String delNotice(Model model, String[] delNoticeNum) {
		
		for(String delntcNum : delNoticeNum) {
			System.out.println("삭제할 NUM : "+delntcNum);
			int notice_num=Integer.parseInt(delntcNum);
			ntcDao.delete(notice_num);
		}

		return null;
	}

	@Override
	public List<Map<String, Object>> selectFileList(int ntcNum) throws Exception {
		return ntcDao.selectFileList(ntcNum);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return ntcDao.selectFileInfo(map);
	}

}
