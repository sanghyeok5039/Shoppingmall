package com.shoppingmall.home;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shoppingmall.closing.IClosingService;
import com.shoppingmall.prd.IPrdService;

@Controller
public class HomeController {
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private IPrdService prdSvcImpl;
	
	@Autowired
	IHomeService homeSvc;
	@Autowired
	IClosingService closSvc;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session,HttpServletRequest request) {
		session.setAttribute("myPageView", "myPage");
		session.setAttribute("id", request.getRemoteAddr());
		prdSvcImpl.setCategoryMenu(session);
		return "home";
	}
	@RequestMapping(value = "mngMain", method = RequestMethod.GET)
	public String mngHome(Model model,HttpSession session) {
		closSvc.chkClosing(model, session);
		homeSvc.mngHome(model);
		return "mngMain";
	}
	@RequestMapping("footerContainer")
	public String footerContainer( Model model) {
		return "footerContainer";
	}
	@RequestMapping("mainContainer")
	public String mainContainer( Model model) {
		return "mainContainer";
	}
	@RequestMapping("home")
	public String homePage(HttpSession session,HttpServletRequest request) {
		session.setAttribute("myPageView", "myPage");
		prdSvcImpl.setCategoryMenu(session);
		session.setAttribute("id", request.getRemoteAddr());
		return "home";
	}
	@RequestMapping("top")
	public String topPage(HttpSession session) {
		return "top";
	}

}
