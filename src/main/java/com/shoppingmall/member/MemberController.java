package com.shoppingmall.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoppingmall.basket.IBsktService;
import com.shoppingmall.dto.MbrDto;
import com.shoppingmall.point.IPtService;


@Controller
public class MemberController {
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private IMemberService mbrSvc;
	
	@Autowired
	private IPtService ptSvc;
	
	@Autowired
	private IBsktService bsktSvc;
	
	@RequestMapping(value = "login.do", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String login(@ModelAttribute("id") String id, @ModelAttribute("pw") String pw, HttpSession session) {
		
		String jsonOut = mbrSvc.login(id, pw, session);
		return jsonOut;
	}
	
	@RequestMapping(value = "idCheck.do", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String idCheck(@ModelAttribute("id") String id) {
		String jsonOut = mbrSvc.idCheck(id);	
		return jsonOut;
	}
	
	@RequestMapping(value = "secession.do", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String secession(@ModelAttribute("id") String id, @ModelAttribute("pw") String pw, HttpSession session) {		
		String jsonOut = mbrSvc.secession(id, pw, session);
		return jsonOut;
	}
	
	@RequestMapping("insertMbr")
	public String insertMbr(MbrDto dto, HttpSession session) {
		String viewPage = mbrSvc.insertMbr(dto, session);
		return viewPage;
	}


	@RequestMapping("loginPage")
	public String loginPage(HttpSession session) {
		return "login";
	}
	@RequestMapping(value = "idFind.do", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String idFind(@ModelAttribute("name") String name, @ModelAttribute("tel") String tel) {
		String jsonOut = mbrSvc.idFind(name, tel);	
		return jsonOut;
	}
	@RequestMapping(value = "pwFind.do", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String pwFind(@ModelAttribute("id") String id, @ModelAttribute("tel") String tel) {
		String jsonOut = mbrSvc.pwFind(id, tel);	
		return jsonOut;
	}
	@RequestMapping(value = "deleteBasketMbr.do", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String deleteBasket(Model model, @ModelAttribute("product_id") String product_id, @ModelAttribute("mbr_id") String mbr_id) {
		String jsonOut = bsktSvc.deleteBasket(model, product_id, mbr_id);
		return jsonOut;
	}
	
	@RequestMapping(value = "getNonMbr.do", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String getNonMbr(Model model, @ModelAttribute("tel") String tel, @ModelAttribute("pw") String pw) {
		String jsonOut = mbrSvc.getNonMbr(model, tel, pw);
		return jsonOut;
	}
	
	@RequestMapping("findIdPw")
	public String findIdPwPage(HttpSession session) {
		return "findIdPw";
	}
	@RequestMapping("signUpPage")
	public String signUpPage(HttpSession session) {
		return "signUp";
	}
	@RequestMapping("myPageCheck")
	public String myPageCheck(HttpSession session) {
		return "myPageCheck";
	}
	@RequestMapping("myPageView")
	public String myPageView(HttpSession session) {
		session.setAttribute("myPageView", "myPage");
		return "myPage";
	}
	@RequestMapping("orderView")
	public String orderView(HttpSession session) {
		session.setAttribute("myPageView", "orderPage");
		return "orderView";
	}
	@RequestMapping("pointView")
	public String pointView(HttpSession session) {
		session.setAttribute("myPageView", "pointPage");
		String viewPage = ptSvc.pointView(session);
		return viewPage;
	}
	@RequestMapping("updateMbrPage")
	public String updateMbrPage(HttpSession session) {
		session.setAttribute("myPageView", "updatePage");
		return "updateMember";
	}
	@RequestMapping("myPageContainer")
	public String myPageContainer(HttpSession session) {
		return "myPageContainer";
	}
	@RequestMapping("updateMbr")
	public String updateMbr(MbrDto dto, HttpSession session) {
		String viewPage = mbrSvc.updateMbr(dto, session);
		return viewPage;
	}
	
	@RequestMapping("myPage")
	public String myPage(@RequestParam("mbr_id") String id, @RequestParam("mbr_pw") String pw, HttpSession session) {
		String viewPage = mbrSvc.myPage(id, pw, session);
		return viewPage;
	}
	@RequestMapping("logOut")
	public String logOut(HttpSession session) {
		System.out.println("test");
		session.removeAttribute("loginUser");
		session.removeAttribute("pointInOut");
		session.setAttribute("myPageState","failed");
		session.removeAttribute("myPageView");
		return "home";
	}

	@RequestMapping("secessionPage")
	public String secessionPage(HttpSession session) {
		session.setAttribute("myPageView", "secessionPage");
		return "secession";
	}
	
	@RequestMapping("basketView")
	public String basketView(Model model, HttpSession session) {
		MbrDto dto = (MbrDto) session.getAttribute("loginUser");
		session.setAttribute("myPageView", "basketPage");
		String viewpage = bsktSvc.getAllBasket(model, dto.getMbr_id());
		return viewpage;
	}

	@RequestMapping(value = "getPoint.do", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String getPoint(Model model, HttpSession session) {
		String jsonOut = ptSvc.getPoint(model, session);
		return jsonOut;
	}

}
