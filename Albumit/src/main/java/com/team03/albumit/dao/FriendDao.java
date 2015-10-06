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
import org.springframework.stereotype.Component;

import com.team03.albumit.dto.Friend;

@Component
public class FriendDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public Integer insert(Friend friend){
		Integer pk = null;
		String sql = "insert into Friend (uid,f_uid,frined_block) values(?,?,?)";
		pk = jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,friend.getUid());
				pstmt.setInt(2,friend.getF_uid() );
				pstmt.setBoolean(3,friend.isFrined_block());
				return pstmt;
			}
		});
		return pk;
	}


	public Integer update(Friend friend){
		String sql="update Friend set frined_block=? where uid =? and f_uid =?";
		int rows = jdbcTemplate.update(sql,friend.getUid(),friend.getF_uid());
		return rows;
	}

	
	public Integer delete(Friend friend){
		String sql ="delete from Friend where uid=? and f_uid=?";
		int rows =jdbcTemplate.update(sql,friend.getUid(),friend.getF_uid());
		return rows;

	}

	public List<Friend> selectAll(Friend friend){
		String sql ="select * from Friend where uid=? and f_uid=? ";
		List<Friend> friends =jdbcTemplate.query(sql, new Object[]{friend.getUid(),friend.getF_uid()},
				new RowMapper<Friend>(){
			@Override
			public Friend mapRow(ResultSet rs, int rowNum) throws SQLException {
				Friend fr = new Friend();
				fr.setF_uid(rs.getInt("f_uid"));
				fr.setUid(rs.getInt("uid"));
				fr.setFrined_block(rs.getBoolean("friend_block"));
				return fr;
			}
		});
		return friends;
	}

	public Friend select(Friend friend){
		String sql = "select * from Friend where uid=? and f_uid=?";
		Friend fr = jdbcTemplate.queryForObject(sql, new Object[]{friend.getUid(),friend.getF_uid()},
				new RowMapper<Friend>(){
			@Override
			public Friend mapRow(ResultSet rs, int rowNum) throws SQLException {
				Friend friends = new Friend();
				friends.setF_uid(rs.getInt("f_uid"));
				friends.setUid(rs.getInt("uid"));
				friends.setFrined_block(rs.getBoolean("friend_block"));
				return friends;
			}
		});
		return fr;
	}
}
