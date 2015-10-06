package com.team03.albumit.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.team03.albumit.dao.*;
import com.team03.albumit.dto.*;

@Component
public class MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	//회원 추가
	public void add(Member member){
		memberDao.insert(member);
	}
	
}
