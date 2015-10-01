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

import com.team03.albumit.dto.Album;

@Component
public class AlbumDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// C
	public Integer insert(Album album) {
		Integer pk = null;
		String sql = "INSERT INTO Album(album_name,album_publicity,thumbnail_no,uid) "
				+ "VALUES (?,?,?,?)";
		
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
				PreparedStatement pstmt = conn.prepareStatement(sql, new String[] { "album_no" });
				pstmt.setString(1, album.getAlbum_name());
				pstmt.setBoolean(2, album.isAlbum_publicity());
				pstmt.setInt(3, album.getThumbnail_no());
				pstmt.setInt(5, album.getUid());
				return pstmt;
			}
		}, keyHolder);
		
		Number keyNumber = keyHolder.getKey();
		pk = keyNumber.intValue();
		return pk;
	}
	
	// R
	public Album selectByAlbumNo(int album_no) {
		String sql = "SELECT * FROM Album WHERE album_no=?";
		
		Album album = jdbcTemplate.queryForObject(
				sql,
				new Object[] {album_no},
				new RowMapper<Album> () {
					@Override
					public Album mapRow(ResultSet rs, int rowNum) throws SQLException {
						Album album = new Album();
						album.setAlbum_no(album_no);
						album.setAlbum_name(rs.getString("album_name"));
						album.setAlbum_publicity(rs.getBoolean("album_publicity"));
						album.setThumbnail_no(rs.getInt("thumbnail_no"));
						album.setUid(rs.getInt(rs.getInt("uid")));
						
						return album;
					}
				});
		
		return album;
	}
	
	public List<Album> selectAllAlbum() {
		String sql = "SELECT * FROM Album";
		List<Album> list = jdbcTemplate.query(sql, 
				new RowMapper<Album>() {
	
					@Override
					public Album mapRow(ResultSet rs, int rowNum) throws SQLException {
						Album album = new Album();
						album.setAlbum_no(rs.getInt("album_no"));
						album.setAlbum_name(rs.getString("album_name"));
						album.setAlbum_publicity(rs.getBoolean("album_publicity"));
						album.setThumbnail_no(rs.getInt("thumbnail_no"));
						album.setUid(rs.getInt("uid"));
						
						return album;
					}
				});
		
		return list;
	}
	
	// U
	public int update(Album album) {
		String sql = "UPDATE Album SET album_name=?, album_publicity=?, thumbnail_no=? WHERE album_no=?";
		int rows = jdbcTemplate.update(sql, album.getAlbum_name(), album.isAlbum_publicity(), 
				album.getThumbnail_no(), album.getAlbum_no());
		
		return rows;
	}
	
	// D
	public int delete(int album_no) {
		String sql = "DELETE FROM Album WHERE album_no=?";
		int rows = jdbcTemplate.update(sql, album_no);
		
		return rows;
	}
}
