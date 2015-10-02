package com.team03.albumit.dao;

import java.sql.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.*;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import com.team03.albumit.dto.*;

@Component
public class ReportedPhotoDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public Integer insert(ReportedPhoto reportedPhoto){
		Integer pk = null;
		String sql = "insert into reportedPhoto (photo_no, uid, reason) values(?, ?, ?)";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
				PreparedStatement pstmt = conn.prepareStatement(sql, new String[] {"photo_no"});
				pstmt.setInt(1, reportedPhoto.getPhoto_no());
				pstmt.setInt(2, reportedPhoto.getUid());
				pstmt.setString(3, reportedPhoto.getReported_reason());
				return pstmt;
			}
		},keyHolder);
		Number keyNumber = keyHolder.getKey();
		pk = keyNumber.intValue();
		return pk;
	}
	
	// 
		public int update(ReportedPhoto reportedPhoto) {
			String sql = "update ReportedPhoto set photo_no=?, uid=?, reported_reason=? where photo_no=?";
				int rows = jdbcTemplate.update(
						sql,
						reportedPhoto.getPhoto_no(),
						reportedPhoto.getUid(), 
						reportedPhoto.getReported_reason()
					);
				return rows;
			}

	
}
