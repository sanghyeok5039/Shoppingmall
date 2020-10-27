package com.shoppingmall.member;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.shoppingmall.dto.MbrDto;


public interface IMemberService {

	String login(String id, String pw, HttpSession session);
	String idCheck(String id);
	String insertMbr(MbrDto dto, HttpSession session);
	String myPage(String id , String pw, HttpSession session);
	String updateMbr(MbrDto dto, HttpSession session);
	String idFind(String name, String tel);
	String pwFind(String id, String tel);
	String secession(String id, String pw, HttpSession session);
	String getNonMbr(Model model, String tel, String pw);
	
}