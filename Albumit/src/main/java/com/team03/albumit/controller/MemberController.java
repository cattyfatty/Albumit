package com.team03.albumit.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
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
	public String login(Member loginMember){
		Boolean loginCheck;
		loginCheck = memberService.login(loginMember.getMember_email(),loginMember.getMember_password());
		if(loginCheck){
			return "albumList";
		}
		return "loginForm";	
	}
}
