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
		
		public void insert(SharedPhoto sharedPhoto) {
			Integer pk = null;
			String sql = "insert into SharedPhoto (photo_no, uid, album_no, share_date ) values(?, ?, ?, now())";
			
			jdbcTemplate.update(new PreparedStatementCreator() {
				@Override
				public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, sharedPhoto.getPhoto_no());
					pstmt.setInt(2, sharedPhoto.getUid());
					pstmt.setInt(3, sharedPhoto.getAlbum_no());
				
					return pstmt;
				}
			});
			
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
						sharedPhoto.setShare_date(rs.getDate("share_date"));
						return sharedPhoto;
					}
				});
			return list;
		}
		
		public List<SharedPhoto> selectByAlbumPhotoNo(int album_no,int photo_no) {
			String sql = "select * from SharedPhoto where album_no=? and photo_no=?";
			List<SharedPhoto> list = jdbcTemplate.query(
				sql,
				new Object[] {album_no, photo_no},
				new RowMapper<SharedPhoto>() {
					@Override
					public SharedPhoto mapRow(ResultSet rs, int rowNum) throws SQLException {
						SharedPhoto sharedPhoto = new SharedPhoto();
						sharedPhoto.setPhoto_no(rs.getInt("photo_no"));
						sharedPhoto.setUid(rs.getInt("uid"));
						sharedPhoto.setAlbum_no(rs.getInt("album_no"));
						sharedPhoto.setShare_date(rs.getDate("share_date"));
						return sharedPhoto;
					}
				});
			return list;
		}
		
		
		public int delete(int photo_no, int album_no) {
			String sql = "delete from SharedPhoto where photo_no=? and album_no=? ";
			int rows = jdbcTemplate.update(
				sql,
				photo_no,
				album_no
			);
			return rows;
		}
		
	
	



}
