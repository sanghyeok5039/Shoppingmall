package com.shoppingmall.notice;

import java.io.File;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.shoppingmall.dto.NoticeDto;

@Controller
public class NoticeController {
	
	@Autowired
	INoticeService ntcSvc;
	
	@RequestMapping("viewNotice")
	public String viewNotice(Model model,@RequestParam("ntcNum")String notice_num,@RequestParam(value="pageNum",required = false)String strPageNum) throws Exception{
//		logger.info("read");
		ntcSvc.viewNotice(model, notice_num);
		model.addAttribute("pageNum", strPageNum);
		return "mngViewNotice";
	}
	
	@RequestMapping("noticeList")
	public String viewAllNotice(Model model,@RequestParam(value="pageNum",required = false)String strPageNum) throws Exception {
		ntcSvc.viewAllNotice(model,strPageNum);
		return "mngNoticeList";
	}
	
	@RequestMapping("writeNoticeForm")
	public String writeNoticeForm() {
		return "noticeWriteForm";
	}
	
	@RequestMapping("writeNotice")
	public String writeNotice(HttpSession session, NoticeDto ntcDto,MultipartHttpServletRequest mpRequest) throws Exception {
		ntcSvc.writeNotice(session, ntcDto,mpRequest);
		return "redirect:noticeList";
	}
	
	@RequestMapping("updateNotice")
	public String updateNotice(Model model,NoticeDto ntcDto) {
		ntcSvc.editNotice(model, ntcDto);
		return "redirect:noticeList";
	}
	
	@RequestMapping("delNotice")
	public String deleteNotice(@RequestParam("ntcNum")String[] delNoticeNum,Model model) {
		ntcSvc.delNotice(model, delNoticeNum);
		return "redirect:noticeList";
	}
	
	@RequestMapping("/noticeFileDown")
	public void fileDown(@RequestParam Map<String, Object>map, HttpServletResponse response) throws Exception{
		System.out.println("파일 번호는 ? "+map.get("FILE_NO"));
		Map<String, Object> resultMap = ntcSvc.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
		String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
		
		//파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\project\\notice\\"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
	
	/* --------------------------------------  고객 -----------------------------------------------  */
	@RequestMapping("csCenterNotice")
	public String csCenter(Model model,@RequestParam(value="pageNum",required = false)String strPageNum) throws Exception {
		ntcSvc.viewAllNotice(model,strPageNum);
		return "csCenterNotice";
		
	}
	
	@RequestMapping("cstViewNotice")
	public String cstViewNotice(Model model,@RequestParam("ntcNum")String notice_num) throws Exception {
		ntcSvc.viewNotice(model, notice_num);
		return "cstViewNotice";
	}

}
