package com.angle.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import com.angle.dao.MemberDao;
import com.angle.domain.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}
	
	@Override
	public void insertMemberJoin(Member member) {
		
		String state = "";
		
		if(member.isState() == true) {
			state = "1";
		} else {
			state = "0";
		}
		
		namedParameterJdbcTemplate.update(
				"insert into member values("
				+ ":id, :pw, :nickname, :jdate, :ldate, :vcount, :state, :image, :pcomment)",				
				new MapSqlParameterSource()
				.addValue("id", member.getId())
				.addValue("pw", member.getPw())
				.addValue("nickname", member.getNickName())
				.addValue("jdate", member.getjDate())
				.addValue("ldate", member.getlDate())
				.addValue("vcount", member.getvCount())
				.addValue("state", state)
				.addValue("image", member.getImage())
				.addValue("pcomment", member.getpComment()));
	}

	@Override
	public int checkId(String id) {
		
		return namedParameterJdbcTemplate.query(
				"select count(*) from member where id = :id",
				new MapSqlParameterSource().addValue("id", id),
				new ResultSetExtractor<Integer>() {

					@Override
					public Integer extractData(ResultSet rs) throws SQLException, DataAccessException {
						int temp = 1;
						if(rs.next()) {
							temp = rs.getInt(1);
						}
						return temp;
					}
					
				});
	}
	
	@Override
	public int checkNickName(String nickname) {
		
		return namedParameterJdbcTemplate.query(
				"select count(*) from member where nickname = :nickname",
				new MapSqlParameterSource().addValue("nickname", nickname),
				new ResultSetExtractor<Integer>() {

					@Override
					public Integer extractData(ResultSet rs) throws SQLException, DataAccessException {
						int temp = 1;
						if(rs.next()) {
							temp = rs.getInt(1);
						}
						return temp;
					}					
				});				
	}
	
	@Override
	public int checkPw(String id, String pw) {
		
		return namedParameterJdbcTemplate.query(
				"select count(*) from member where id = :id and pw = :pw",
				new MapSqlParameterSource()
				.addValue("id", id)
				.addValue("pw", pw),
				new ResultSetExtractor<Integer>() {

					@Override
					public Integer extractData(ResultSet rs) throws SQLException, DataAccessException {
						int temp = 1;
						if(rs.next()) {
							temp = rs.getInt(1);
						}
						return temp;
					}					
				});
	}

	@Override
	public void deleteMember(String id) {
		
		SqlParameterSource beanParam = new MapSqlParameterSource().addValue("id", id);
		String sql = "delete from member where id = :id";
		
		namedParameterJdbcTemplate.update(sql, beanParam);
		
	}

	@Override
	public Member getMember(String id) {
			
		return jdbcTemplate.queryForObject(
				"select * from member where id = ?",
				new Object[] {id},
				new RowMapper<Member>() {

					@Override
					public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
						
						Member member = new Member();
						member.setId(rs.getString("id"));
						member.setPw(rs.getString("pw"));
						member.setNickName(rs.getString("nickname"));
						member.setjDate(rs.getString("jdate"));
						member.setlDate(rs.getString("ldate"));
						member.setvCount(rs.getInt("vcount"));
						member.setState(false);
						member.setImage(rs.getString("image"));
						member.setpComment(rs.getString("pcomment"));
						return member;
					}
				});
					
	}

	@Override
	public Boolean memberLoginCheck(String id, String pw) {
		
		return jdbcTemplate.query(
				"select 1 from member where id=? and pw=?",
				new Object[] {id, pw},
				new ResultSetExtractor<Boolean>() {

					@Override
					public Boolean extractData(ResultSet rs) throws SQLException, DataAccessException {
						
						if(rs.next()) 
							return true;
						
						return false;
					}					
				});
	}
	
	


	@Override
	public void updateMemberInfo(Member member) {
				
		String sql = "update member set id= :id, nickname= :nickname, "
				+ "pw= :pw where id= :id";
		
		namedParameterJdbcTemplate.update(sql,
				new MapSqlParameterSource()
				.addValue("id", member.getId())
				.addValue("nickname", member.getNickName())
				.addValue("pw", member.getPw())
				.addValue("id", member.getId()));
		
	}

	

	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}