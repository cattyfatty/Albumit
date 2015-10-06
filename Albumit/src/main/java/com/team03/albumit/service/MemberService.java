package com.team03.albumit.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.team03.albumit.dao.*;
import com.team03.albumit.dto.*;

@Component
public class MemberService {

	@Autowired
	private MemberDao memberDao;

	//회원 가입
	public void register(Member member){
		//아이디 중복 체크
		String email = member.getMember_email();
		Member mem = memberDao.selectByEmail(email);
		if(mem.getMember_email().equals(email)){
			return  ;
		
		}
		memberDao.insert(member);
	}

	//로그인
	public boolean login(String email, String pw){
		Member member=	memberDao.selectByEmail(email);
		//아이디 동일체크
		if(member.getMember_email().equals(email)){
			if(member.getMember_password().equals(pw)){
				return true;
			}
			return false;
		}else
			return false;
	}
	
	//회원정보 변경
	public void memberModify(Member member){
		memberDao.memberUpdate(member);
	}
	
	//회원 검색
	public Member findMember(String email){
		Member member = memberDao.selectByEmail(email);
		if(member == null){
			return null;
		} else{
			return member;
		}
	}
	
	//비밀번호 변경///확인필요
	public void passwordModify(String password){
		memberDao.passwordUpdate(password);
	}
	
	//
}

	
	