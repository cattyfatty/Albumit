package com.team03.albumit.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;


import com.team03.albumit.dao.*;
import com.team03.albumit.dto.*;

@Component
public class PhotoService {
	
	@Autowired
	private PhotoDao photoDao;
	private SharedPhotoDao sharedPhotoDao;
	private ReportedPhotoDao reportedPhotoDao;
	private ThumbnailDao thumbnailDao;
	
	
	public void add(Photo photo) {
		photoDao.insert(photo);
	}
	
	public void remove(int photo_no, int album_no) {
		
		
	}
	
	public void addHitcount(int photo_no) {
		photoDao.updateHitcount(photo_no);
	}	
	
	public void addLike(int photo_no) {
		photoDao.updateLike(photo_no);
	}
	
	public void modify(Photo photo) {
		photoDao.update(photo);
	}

	public void share(SharedPhoto sharedPhoto){
		sharedPhotoDao.insert(sharedPhoto);
	}
	
	
	
}
