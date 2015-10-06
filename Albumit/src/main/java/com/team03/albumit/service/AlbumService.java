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
//	private MemberDao memberDao;
	
	// related to ALbum
	public Integer addAlbum(Album album) {
		Integer albumNo = albumDao.insert(album);
		
		return albumNo;		
	}
	
	public List<Album> showMyAlbumList() {
		List<Album> list = null;
		
		return list;
	}
	
	public int modifyAlbum(Album album) {
		int row = albumDao.update(album);
		
		return row;
	}
	
	public int removeAlbum(List<Album> albumList) {
		int row = 0;
		for(Album album : albumList) {
			int album_no = album.getAlbum_no();
			row += albumDao.delete(album_no);
		}
		
		return row;
	}
}
