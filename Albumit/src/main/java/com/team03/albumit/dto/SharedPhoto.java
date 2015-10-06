package com.team03.albumit.dto;

import java.util.*;

public class SharedPhoto {
	private int photo_no;
	private int uid;
	private int album_no;
	private Date share_date;
	
	public Date getShare_date() {
		return share_date;
	}
	public void setShare_date(Date share_date) {
		this.share_date = share_date;
	}
	public int getPhoto_no() {
		return photo_no;
	}
	public void setPhoto_no(int photo_no) {
		this.photo_no = photo_no;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getAlbum_no() {
		return album_no;
	}
	public void setAlbum_no(int album_no) {
		this.album_no = album_no;
	}
}
