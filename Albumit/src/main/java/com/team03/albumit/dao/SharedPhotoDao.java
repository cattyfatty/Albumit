package com.team03.albumit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import com.team03.albumit.dto.SharedAlbum;
import com.team03.albumit.dto.SharedPhoto;

@Component
public class SharedPhotoDao {
	
	
		@Autowired
		private JdbcTemplate jdbcTemplate;
		
		public Integer insert(SharedPhoto sharedPhoto) {
			Integer pk = null;
			String sql = "insert into SharedPhoto (photo_no, uid,album_no ) values(?, ?, ?)";
			KeyHolder keyHolder = new GeneratedKeyHolder();
			jdbcTemplate.update(new PreparedStatementCreator() {
				@Override
				public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, sharedPhoto.getPhoto_no());
					pstmt.setInt(2, sharedPhoto.getUid());
					pstmt.setInt(2, sharedPhoto.getAlbum_no());
				
					return pstmt;
				}
			},keyHolder);
			Number keyNumber = keyHolder.getKey();
			pk = keyNumber.intValue();
			return pk;
		}
		
		public List<SharedPhoto> selectByPhotoNo(int photo_no) {
			String sql = "select * from SharedPhoto where photo_no=?";
			List<SharedPhoto> list = jdbcTemplate.query(
				sql,
				new Object[] {photo_no},
				new RowMapper<SharedPhoto>() {
					@Override
					public SharedPhoto mapRow(ResultSet rs, int rowNum) throws SQLException {
						SharedPhoto sharedPhoto = new SharedPhoto();
						sharedPhoto.setPhoto_no(rs.getInt("photo_no"));
						sharedPhoto.setUid(rs.getInt("uid"));
						sharedPhoto.setAlbum_no(rs.getInt("album_no"));
						return sharedPhoto;
					}
				});
			return list;
		}
		
		
		public int delete(int photo_no, int uid) {
			String sql = "delete from SharedPhoto where photo_no=? and uid=? ";
			int rows = jdbcTemplate.update(
				sql,
				photo_no,
				uid
			);
			return rows;
		}
		
	
	



}
