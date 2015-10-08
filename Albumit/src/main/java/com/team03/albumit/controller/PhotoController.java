package com.team03.albumit.controller;

import java.util.*;

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
	
	
	@RequestMapping("/photoList")
	public String Photolist(
			int album_no,
			Model model) {
		
		
		List<Photo> list = photoService.showLaPhoto(album_no);
		logger.info("album_no", album_no);
		
		model.addAttribute("list",list);
		
	
		
		return "/photoList";
		
		

	}
}