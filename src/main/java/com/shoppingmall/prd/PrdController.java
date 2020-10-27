package com.shoppingmall.prd;

import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;

//import com.sun.javafx.collections.MappingChange.Map;

@Controller
//@RequestMapping(value = "/pr")
public class PrdController {
	
	@Autowired
	@Qualifier("prdSvcImpl")
	private IPrdService prdSvcImpl;
	
	@RequestMapping(value = "/pr")
	public String prMngHome() {
		return "redirect:/prdMngList.jsp";
	}
	
	@RequestMapping("prdMngList")
	public String prdList(Model md) {
		prdSvcImpl.prdMulSrch(md);
		
		return "prdMngList";
		
	}
	@RequestMapping("prdCndtnSrch")
	public String prdCndtnSrch (Model md, HttpServletRequest req) {
		// 조건 조회입니다리..
		
		prdSvcImpl.prdCndtnSrch(md, req);

		return "prdMngList";
	}
	
	@RequestMapping("prdMngReg")
	public String prdMngReg (Model md, HttpServletRequest req) {
		prdSvcImpl.prdOneSrch(md, req);
		
		return "prdMngReg";
	}
	
	
	@RequestMapping("prdInsertForm")
	public String prdInsertForm(Model md, HttpServletRequest req) {
		prdSvcImpl.setCategory(md);
		return "prdInsertForm";
	}
	
	@RequestMapping("prdInsert")
	public String prdInsert(Model md, HttpServletRequest req) {
		prdSvcImpl.prdInsert(md, req);
		
		
		prdSvcImpl.prdMulSrch(md);
		return "prdMngList";
	}
	
	@RequestMapping("prdUpdate")
	public String prdUpdate(Model md, HttpServletRequest req) {
		prdSvcImpl.prdUpdate(md, req);
		prdSvcImpl.prdMulSrch(md);
		return "prdMngList";
	}

	@RequestMapping(value="/sizeCnt.do" , produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String itemChange( Model md, @ModelAttribute("data") String data,  @ModelAttribute("id") String id) {
		System.out.println(data+"이거봐아아아아아아아아아아!!!!!!!!!!!!!"+id);
		String cnt= prdSvcImpl.getCnt(id, data);
		System.out.println(cnt+"=====================================");
		//여기에다가 사이즈 별로 그에 맞는 수량을 적어넣을것이에오.
		// dto에 담겨져있는 값을 뽑으면 되긴 해.
		return cnt;
	}
	
	
	
	
	@RequestMapping("itemChange")
	public String sizeCnt() {
		
		
		return "";
	}
	
	
	@RequestMapping("ajaxMctgrSlctd")
	public String MctgrSlctd() {
		
		
		return "prdMngReg";
	}
	
	
	
	
//	@RequestMapping("ajaxMctgrSlctd")
//	public ModelAndView selectGftctPupl(HttpServletRequest request, HttpServletResponse response,
//			Map<String, Object> model,0001Model 0001Model){
//		
//		try{
//			List<DataMap> data=0001Service.selectGftctPupl(0001Model); // 데이터 조회
//			if(data==null || data.size()==0) return new ModelAndView("jsonView",model);
//			model.put("data",data);
//		 } catch (Exception e){
//			 
//		 }
//		 return new ModelAndView("jsonView",model);
//	}
	
	
}
