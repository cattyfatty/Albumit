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
@SessionAttributes("member")
public class AlbumController {

	private static final Logger logger = LoggerFactory.getLogger(AlbumController.class);
	
	@Autowired
	private AlbumService albumService;
	
	@RequestMapping("/allAlbumList")
	public String allAlbumList(@ModelAttribute("member") Member member, Model model) {
		List<Album> albumList = albumService.showAllAlbumList();
		model.addAttribute(albumList);
		
		return "albumList";
	}
	
	@RequestMapping("/myAlbumList")
	public String myAlbumList(@ModelAttribute("member") Member member, Model model) {
		List<Album> albumList = albumService.showMyAlbumList(member);
		model.addAttribute(albumList);
		
		return "albumList";
	}
	
	@RequestMapping("/sharedAlbumList")
	public String sharedAlbumList(@ModelAttribute("member") Member member, Model model) {
		List<Album> albumList = albumService.showMySharedAlbumList(member);
		model.addAttribute(albumList);
		
		return "albumList";
	}
	
	@RequestMapping("/likedAlbumList")
	public String likedAlbumList(@ModelAttribute("member") Member member, Model model) {
		List<Album> albumList = albumService.showMyLikedAlbumList(member);
		model.addAttribute(albumList);
		
		return "albumList";
	}
	
	@RequestMapping("/makeAlbum")
	public String makeAlbum(Album album) {
		Integer album_no = albumService.makeAlbum(album);
		// TODO: when owner want to make shared album which is shared with friends at creation
		
		return "redirect:/myAlbumList";
	}
}
