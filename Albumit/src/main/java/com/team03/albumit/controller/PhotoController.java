package com.team03.albumit.controller;

import java.util.*;

import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.team03.albumit.dto.*;
import com.team03.albumit.service.*;




@Controller
public class PhotoController {
	private static final Logger logger = LoggerFactory.getLogger(PhotoController.class);
	
	@Autowired
	private PhotoService photoService;
	
	//사진 보여주기
	@RequestMapping("/photoList")
	public String PhotoList(
			int album_no,
			Model model,
			HttpSession session) {
		
		logger.info("photoList");
		
		List<Photo> list = photoService.showLaPhoto(album_no);
		logger.info("album_no", album_no);
		
		model.addAttribute("list",list);
		
	
		
		return "/photoList";
		
		

	}
	
	//사진 큰화면 보여주기
	@RequestMapping("/detail")
	public String detail(int photo_no, Model model){
		
		photoService.addHitcount(photo_no);
		Photo photo = photoService.getPhoto(photo_no);
		model.addAttribute("photo",photo);
		return "/detail";
		
	}
	
}