package com.shoppingmall.mbr;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping(value = "/mb")
public class MbrController {
	
	@Autowired
	@Qualifier("mbrSvcImpl")
	private IMbrService mbrSvcImpl;
	
	@RequestMapping(value = "/mb")
	public String MbMngHome() {
		return "redirect:/mbrMng.jsp";
	}
	
	
	@RequestMapping("mbrSrchCndtn")
	public String mbrSrchCndtn(Model md,HttpServletRequest req) {
		
		mbrSvcImpl.mbrCndtnSrch(md, req);
		
		return "mbrMng";
	}
	
	//수우저어어엉
	@RequestMapping("mbUpdate")
	public String mbUpdate(Model md, HttpServletRequest req) {
		mbrSvcImpl.mbrUpdate(md, req);
		mbrSvcImpl.mbrMulSrch(md);
		
		return "mbrMng";
	}
	
	@RequestMapping("mbrMng")
	public String mbList(Model md) {
		mbrSvcImpl.mbrMulSrch(md);
		return "mbrMng";
	}
	
	@RequestMapping("mbDetail")
	public String mbDetail(Model md, HttpServletRequest req) 
	{
//		String id = req.getParameter("abcde");
//		System.out.println(id);
//		System.out.println("콘트롤러"); //ㅇㅋ
		mbrSvcImpl.mbrOneSrch(md,req); // 넘어가서 id찍으면 null로 나오고 여기서 죽음.
//		System.out.println("서비스로 보냄");
		return "mbrDetail";
	}
	
	@RequestMapping("mbInsert")
	public String mbInsert() {
		return "";
	}
	
	@RequestMapping("mbDelete")
	public String mbDelete() {
		return "";
	}
}
