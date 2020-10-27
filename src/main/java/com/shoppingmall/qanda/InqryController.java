package com.shoppingmall.qanda;

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

import com.shoppingmall.dto.InquryDto;

@Controller
public class InqryController {
	@Autowired
	IInquryService iqSvc;
	
	@RequestMapping("inquryList")
	public String inquryList(Model model,@RequestParam(value="pageNum",required = false)String strPageNum
			,@RequestParam(value="condition",required = false)String condition) throws Exception {
		iqSvc.inquryList(model, condition, strPageNum);
		return "mngInquryList";
	}
	//연습
	
	@RequestMapping("myInquryList")
	public String myInquryList(Model model,@RequestParam(value="pageNum",required = false)String strPageNum
			,HttpSession session) throws Exception {
		return iqSvc.viewMyAllInqury(model, strPageNum, session);
	}
	
	@RequestMapping("mngViewInqury")
	public String viewInqury(Model model,@RequestParam(value="pageNum",required = false)String strPageNum,@RequestParam("iqNum")String qanda_num) throws Exception{
		iqSvc.viewInqury(model, strPageNum , qanda_num);
		return "mngInquryAnswer";
	}
	
	@RequestMapping("viewMyInqury")
	public String viewMyInqury(Model model,@RequestParam(value="pageNum",required = false)String strPageNum,@RequestParam("iqNum")String qanda_num) throws Exception {
		iqSvc.viewInqury(model, strPageNum , qanda_num);
		return "cstViewInqury";
	}
	
	@RequestMapping("writeInquryForm")
	public String writeInquryForm() {
		return "inquryWriteForm";
	}
	
	@RequestMapping("writeInqury")
	public String writeInqury(@RequestParam(value="category", required=false) String category,HttpSession session,InquryDto iqDto
			,MultipartHttpServletRequest mpRequest) throws Exception {
		iqSvc.writeInqury(category, session, iqDto, mpRequest);
		//임의지정.
		return "redirect:myInquryList";
	}
	
	@RequestMapping("writeAnswer")
	public String writeAnswer(Model model,InquryDto iqDto,@RequestParam(value="condition",required = false)String condition) {
		iqSvc.writeAnswer(model, iqDto);
		System.out.println(condition);
		return "redirect:inquryList?condition="+condition;
	}
	
	@RequestMapping("/inquryFileDown")
	public void fileDown(@RequestParam Map<String, Object>map, HttpServletResponse response) throws Exception{
		System.out.println("파일 번호는 ??? "+map.get("FILE_NO"));
		Map<String, Object> resultMap = iqSvc.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
		String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
		
		//파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\project\\inqury\\"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
}
