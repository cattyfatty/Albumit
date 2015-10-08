package com.team03.albumit.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.team03.albumit.dto.*;
import com.team03.albumit.service.*;

@Controller
public class MemberController {
@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String loginForm(Member loginMember){
		return "loginForm";
	}
	
	@RequestMapping(value="/",method=RequestMethod.POST)
	public String login(Member loginMember, HttpSession session){
		Boolean loginCheck;
		
		//로그인 성공시 세션객체에 등록하기!
		String email = loginMember.getMember_email();
		String pw = loginMember.getMember_password();
		loginCheck = memberService.login(email,pw);
		
		if(loginCheck){
			session.setAttribute("loginMember", loginMember);
			return "albumList";
		}
		return "loginForm";	
	}
	
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String joinForm(Member joinMember){
		return "joinForm";
	}
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(Member joinMember, HttpSession session){

		ServletContext application =session.getServletContext();
		String dirPath = application.getRealPath("/resources/uploadfiles");
		
		if(joinMember.getAttach() !=null){
			String originalFilename = joinMember.getAttach().getOriginalFilename();
			String filesystemName = System.currentTimeMillis() +"-" + originalFilename;
			String contentType = joinMember.getAttach().getContentType();
			
			if(!joinMember.getAttach().isEmpty()){
				try{
					joinMember.getAttach().transferTo(new File(dirPath+ "/"+ filesystemName));;
				}catch(Exception e) {e.printStackTrace();}
			}
			joinMember.setMember_original_file_name(originalFilename);
			joinMember.setMember_filesystem_name(filesystemName);
			joinMember.setMember_content_type(contentType);
		}
		
		memberService.register(joinMember);
		return "loginForm";
	}
}


