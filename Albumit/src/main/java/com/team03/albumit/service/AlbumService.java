package com.team03.albumit.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.team03.albumit.dao.*;

@Component
public class AlbumService {

	@Autowired
	private AlbumDao albumDao;
	
	public void addAlbum() {
		
	}
}
