package com.team03.albumit.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.team03.albumit.dao.*;
import com.team03.albumit.dto.*;

@Component
public class AlbumService {

	@Autowired
	private AlbumDao albumDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private SharedAlbumDao sharedAlbumDao;
	@Autowired
	private LikedAlbumDao likedAlbumDao;
	
	// C
	public Integer makeAlbum(Album album) {
		Integer albumNo = albumDao.insert(album);
		
		return albumNo;		
	}
	
	// R
	public List<Album> showMyAlbumList(Member member) {
		List<Album> list = null;
		
		int uid = member.getUid();
		list = albumDao.selectAlbumByUid(uid);
		
		return list;
	}
	
	public List<Album> showMySharedAlbumList(Member member) {
		List<SharedAlbum> sharedlist = null;
		
		int uid = member.getUid();
		sharedlist = sharedAlbumDao.selectByFuid(uid);
		
		List<Album> list = new ArrayList<Album>();
		for(SharedAlbum sa : sharedlist) {
			Album a = albumDao.selectByAlbumNo(sa.getAlbum_no());
			list.add(a);
		}
		
		return list;
	}
	
	public List<Album> showMyLikedAlbumList(Member member) {
		List<LikedAlbum> likedlist = null;
		
		int uid = member.getUid();
		likedlist = likedAlbumDao.selectByUid(uid);
		
		List<Album> list = new ArrayList<Album>();
		for(LikedAlbum la : likedlist) {
			Album a = albumDao.selectByAlbumNo(la.getAlbum_no());
			list.add(a);
		}
		
		return list;
	}
	
	public List<Album> showAllAlbumList() {
		List<Album> list = albumDao.selectAllAlbum();
		
		return list;
	}
	
	// U
	public int modifyAlbum(Album album) {
		int row = albumDao.update(album);
		
		return row;
	}
	
	
	// D
	public int removeAlbum(List<Album> albumList) {
		int row = 0;
		for(Album album : albumList) {
			int album_no = album.getAlbum_no();
			row += albumDao.delete(album_no);
		}
		
		return row;
	}
	
	// ETC
	//--------------- share an album with friends -------------------//
	public void shareAlbum(int album_no, int owner_uid, int[] friends_uid) {
		for(int f : friends_uid) {
			SharedAlbum sharedAlbum = new SharedAlbum();
			sharedAlbum.setAlbum_no(album_no);
			sharedAlbum.setUid(owner_uid);
			sharedAlbum.setF_uid(f);
			sharedAlbumDao.insert(sharedAlbum);
		}
	}
	
	
}
