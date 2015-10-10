package com.team03.albumit.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;

import com.team03.albumit.dao.*;
import com.team03.albumit.dto.*;
import com.team03.albumit.service.*;

@Controller
@SessionAttributes("member")

public class MemberController {
@Autowired
	private MemberService memberService;
private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping(value="/",method=RequestMethod.GET)
	public String loginForm(Member loginMember){
		return "loginForm";
	}
	
	@RequestMapping(value="/",method=RequestMethod.POST)
	public String login(Member loginMember, Model model,HttpSession session){
		Boolean loginCheck;
		
		//로그인 성공시 세션객체에 등록하기!
		String email = loginMember.getMember_email();
		String pw = loginMember.getMember_password();
		loginCheck = memberService.login(email,pw);
		
		
		
		if(loginCheck){
			model.addAttribute("member",loginMember);
		//	session.setAttribute("friends",);
			logger.info("로그인성공");
			return "redirect:/allAlbumList";
		}
		logger.info("로그인 실패");
		return "redirect:/login";	
	}
	
	@RequestMapping(value="join", method=RequestMethod.GET)
	public String joinForm(Member m){
		return "joinForm";
	}
	
	@RequestMapping(value="join", method=RequestMethod.POST)
	public String join(Member joinMember, HttpSession session, BindingResult bindingResult){
		
		ServletContext application =session.getServletContext();
		String dirPath = application.getRealPath("/resources/image");
		logger.info("Beforefilecheck");
		
		
		//회원 가입시 필수 기입사항 확인 
		new JoinValidator().validate(joinMember, bindingResult);
		if(bindingResult.hasErrors()) {
			logger.info("validator");
			return "joinForm";
		}
		
		//파일 경로 구하기
		if(joinMember.getAttach() !=null){
			String originalFilename = joinMember.getAttach().getOriginalFilename();
			String filesystemName = System.currentTimeMillis() +"-" + originalFilename;
			String contentType = joinMember.getAttach().getContentType();
			
			if(!joinMember.getAttach().isEmpty()){
				try{
					joinMember.getAttach().transferTo(new File(dirPath+ "/"+ filesystemName));
				}catch(Exception e) {e.printStackTrace();}
			}
			
			joinMember.setMember_original_file_name(originalFilename);
			joinMember.setMember_filesystem_name(filesystemName);
			joinMember.setMember_content_type(contentType);
		
			//회원등록 성공하면 로그인폼으로 이동
			 if(memberService.register(joinMember)){
				 return "redirect:/";
			 }
		}
		
	
		//회원 가입 실패시 다시 회원가입폼으로 이동
		return "redirect:/join";
	}
	
	@RequestMapping(value="findPw",method=RequestMethod.GET)
	public String findPwForm(){
		return "";
	}
	
	@RequestMapping(value="findPw", method=RequestMethod.POST)
	public String findPw(){
		return "";
	}
	
	
	
}


