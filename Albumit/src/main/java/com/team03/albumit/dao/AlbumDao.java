package com.team03.albumit.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class AlbumDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	
}
