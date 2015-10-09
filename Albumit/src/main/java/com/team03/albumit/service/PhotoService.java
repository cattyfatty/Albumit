package com.team03.albumit.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.team03.albumit.dao.*;
import com.team03.albumit.dto.*;

@Component
public class PhotoService {
	
	@Autowired
	private PhotoDao photoDao;
	@Autowired
	private SharedPhotoDao sharedPhotoDao;
	@Autowired
	private ReportedPhotoDao reportedPhotoDao;
	@Autowired
	private ThumbnailDao thumbnailDao;
	
	//사진목록보기 (최신순 정렬)
	public List<Photo> showLaPhoto(int album_no){
		List<Photo> list1 = photoDao.selectByAlbumNo(album_no);
		List<SharedPhoto> list2 = sharedPhotoDao.selectByAlbumNo(album_no);
		
		for(SharedPhoto sharedPhoto : list2){
			Photo photo = photoDao.selectByPk(sharedPhoto.getPhoto_no());
			photo.setPhoto_date(sharedPhoto.getShare_date());
			photo.setAlbum_no(sharedPhoto.getAlbum_no());
			list1.add(photo);
		}

		Collections.sort(list1, new Comparator<Photo>() {
			@Override
			public int compare(Photo o1, Photo o2) {
				return o2.getPhoto_date().compareTo(o1.getPhoto_date());
			}
		});
		
		return list1;
	}
	
	//사진목록보기 (인기순 정렬)
	public List<Photo> showLiPhoto(int album_no){
		List<Photo> list1 = photoDao.selectByAlbumNo(album_no);
		List<SharedPhoto> list2 = sharedPhotoDao.selectByAlbumNo(album_no);
		
		for(SharedPhoto sharedPhoto : list2){
			Photo photo = photoDao.selectByPk(sharedPhoto.getPhoto_no());
			photo.setPhoto_date(sharedPhoto.getShare_date());
			photo.setAlbum_no(sharedPhoto.getAlbum_no());
			list1.add(photo);
		}

		Collections.sort(list1, new Comparator<Photo>(){
			@Override
			public int compare(Photo p1, Photo p2) {
				if(p1.getPhoto_like()<p2.getPhoto_like()) {
					return 1;
				} else if(p1.getPhoto_like()==p2.getPhoto_like()) {
					return 0;
				} else {
					return -1;
				}
			}
		});
		
		return list1;
	}
	
	//사진 상세 보기
	public Photo getPhoto(int photo_no){
		Photo photo= photoDao.selectByPk(photo_no);
		
		return photo;
	}
	
	//사진등록
	public void add(Photo photo) {
		photoDao.insert(photo);
	}
	
	//사진삭제
	public void remove(int photo_no, int album_no) {
		
		List<SharedPhoto> sharedphoto = sharedPhotoDao.selectByAlbumPhotoNo(album_no, photo_no);
		
		if(sharedphoto == null){
			photoDao.delete(photo_no);
			
		}else{
			
			sharedPhotoDao.delete(photo_no, album_no);
		}
		
	}
	//조회수
	public void addHitcount(int photo_no) {
		photoDao.updateHitcount(photo_no);
	}	
	//사진 좋아요
	public void addLike(int photo_no) {
		photoDao.updateLike(photo_no);
	}
	//퍼간 사진 보기
	public void showShared(int album_no,int photo_no){
		sharedPhotoDao.selectByAlbumPhotoNo(album_no, photo_no);
	}
	//사진 수정
	public void modify(Photo photo) {
		photoDao.update(photo);
	}
	//사진 퍼가기
	public void share(SharedPhoto sharedPhoto){
		sharedPhotoDao.insert(sharedPhoto);
	}
	//사진 옮기기
	
	//사진신고
	public void report(ReportedPhoto reportedPhoto){
		reportedPhotoDao.insert(reportedPhoto);		
	}
	//신고된 사진(관리자)
	public void showreported(){
		reportedPhotoDao.selectAll();
	}
	
	//댓글달기
	
	//댓글보기
	
	//댓글삭제
	
	
	
}
