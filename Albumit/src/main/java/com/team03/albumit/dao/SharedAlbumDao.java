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

@Component
public class SharedAlbumDao {
	
	
		@Autowired
		private JdbcTemplate jdbcTemplate;
		
		public Integer insert(SharedAlbum sharedAlbum) {
			Integer pk = null;
			String sql = "insert into SharedAlbum (album_no, uid, f_uid) values(?, ?, ?)";
			KeyHolder keyHolder = new GeneratedKeyHolder();
			jdbcTemplate.update(new PreparedStatementCreator() {
				@Override
				public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, sharedAlbum.getAlbum_no());
					pstmt.setInt(2, sharedAlbum.getUid());
					pstmt.setInt(3, sharedAlbum.getF_uid());
				
					return pstmt;
				}
			},keyHolder);
			Number keyNumber = keyHolder.getKey();
			pk = keyNumber.intValue();
			return pk;
		}
		
		public List<SharedAlbum> selectByUid(int uid) {
			String sql = "select * from SharedAlbum where uid=?";
			List<SharedAlbum> list = jdbcTemplate.query(
				sql,
				new Object[] {uid},
				new RowMapper<SharedAlbum>() {
					@Override
					public SharedAlbum mapRow(ResultSet rs, int rowNum) throws SQLException {
						SharedAlbum sharedAlbum = new SharedAlbum();
						sharedAlbum.setAlbum_no(rs.getInt("album_no"));
						sharedAlbum.setUid(rs.getInt("uid"));
						sharedAlbum.setF_uid(rs.getInt("f_uid"));
						return sharedAlbum;
					}
				});
			return list;
		}
		
		public List<SharedAlbum> selectByFuid(int f_uid) {
			String sql = "select * from SharedAlbum where f_uid=?";
			List<SharedAlbum> list = jdbcTemplate.query(
				sql,
				new Object[] {f_uid},
				new RowMapper<SharedAlbum>() {
					@Override
					public SharedAlbum mapRow(ResultSet rs, int rowNum) throws SQLException {
						SharedAlbum sharedAlbum = new SharedAlbum();
						sharedAlbum.setAlbum_no(rs.getInt("album_no"));
						sharedAlbum.setUid(rs.getInt("uid"));
						sharedAlbum.setF_uid(rs.getInt("f_uid"));
						return sharedAlbum;
					}
				});
			return list;
		}
		
		public List<SharedAlbum> selectByAlbumNo(int album_no) {
			String sql = "select * from SharedAlbum where album_no=?";
			List<SharedAlbum> list = jdbcTemplate.query(
				sql,
				new Object[] {album_no},
				new RowMapper<SharedAlbum>() {
					@Override
					public SharedAlbum mapRow(ResultSet rs, int rowNum) throws SQLException {
						SharedAlbum sharedAlbum = new SharedAlbum();
						sharedAlbum.setAlbum_no(rs.getInt("album_no"));
						sharedAlbum.setUid(rs.getInt("uid"));
						sharedAlbum.setF_uid(rs.getInt("f_uid"));
						return sharedAlbum;
					}
				});
			return list;
		}
		
		public int delete(int album_no, int f_uid) {
			String sql = "delete from SharedAlbum where album_no=? and f_uid=? ";
			int rows = jdbcTemplate.update(
				sql,
				album_no,
				f_uid
			);
			return rows;
		}
		
	
	



}