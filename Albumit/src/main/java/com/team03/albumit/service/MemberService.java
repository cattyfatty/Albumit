package com.team03.albumit.service;

import java.util.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.team03.albumit.dao.*;
import com.team03.albumit.dto.*;

@Component
public class MemberService {

	@Autowired
	private MemberDao memberDao;
	@Autowired
	private FriendDao friendDao;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);

	//회원 가입
	public boolean register(Member member){
		//아이디 중복 체크
		String emailId = member.getMember_email();
       
		logger.info("서비스에서 아디 출력:"+emailId);
		if( memberDao.selectByEmail(emailId) == null)
		{
			memberDao.insert(member);
			logger.info("회원가입 성공");
			return true;
		}

		logger.info("회원가입 실패 아이디 중복");
		return false;

	}

	//로그인
	public boolean login(String email, String pw){
		//아이디 동일체크

		Member mem =memberDao.selectByEmail(email); 
		if(mem.getMember_password().equals(pw)){
			return true;
		}
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

	//비밀번호 변경
	public void passwordModify(Member member){
		memberDao.passwordUpdate(member);
	}

	//친구 등록
	public int addFriend(Member umember,String freindId){
		Member fr = memberDao.selectByEmail(freindId);
		if(fr == null){
			return 1;
		}

		Friend friend =friendDao.select(umember, fr);
		
		//이미 등록된 친구 친구등록X
		if(friend != null){
			return 2;
		}
		else{
		friendDao.insert(umember,fr);
		return 3;
		}
	}

	//친구 목록 보기
	public List<FriendList> friendList (Member umember) {
		List<FriendList> friendLists = new ArrayList<FriendList>();
		List<Friend> fr= friendDao.selectAll(umember);

		for(Friend f : fr){
			FriendList friends = new FriendList();
			Member mem = memberDao.selectByUid(f.getF_uid());
			friends.setMember_email(mem.getMember_email());
			friends.setMember_nickname(mem.getMember_nickname());
			friends.setFriend_block(f.isFrined_block());
			friends.setMember_profile(mem.getMember_profile());
			friends.setMember_content_type(mem.getMember_content_type());
			friends.setMember_filesystem_name(mem.getMember_filesystem_name());
			friends.setMember_original_file_name(mem.getMember_original_file_name());

			friendLists.add(friends);
		}
		return friendLists;
	}

	//친구 차단

	public void block(Member umember, Member fmember, Boolean block){
		block = false;   //차단
		friendDao.update(umember, fmember,block);
	}

	//친구 검색
	public Member searchFriend (Member umember,String friendId){
		//검색 하려는 친구가 회원인지 검색
		Member fr = memberDao.selectByEmail(friendId);
		if(fr == null){
			return null;
		}
		else{
			//두 회원이 친구인지 확인	
			Friend friend = friendDao.select(umember, fr);
			if(friend == null){
				return null;
			}
			Member searchedFriend = memberDao.selectByUid(friend.getF_uid());
			return searchedFriend;
		}
	}
}


