package com.angle.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.angle.dao.MemberDao;
import com.angle.domain.Member;
import com.angle.domain.Post;

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
	public Member getMember(String id) {
		
		return namedParameterJdbcTemplate.query(
				"SELECT * FROM member WHERE id = :id", 
				new MapSqlParameterSource().addValue("id", id), 
				new memberResultSetExtrctor());
	}
	
	public class memberResultSetExtrctor implements ResultSetExtractor<Member>{

		@Override
		public Member extractData(ResultSet rs) throws SQLException, DataAccessException {
			Member m = new Member();
			if(rs.next()){
				m.setId(rs.getString("id"));
				m.setPw(rs.getString("pw"));
				m.setNickName(rs.getString("nickName"));
				m.setjDate(rs.getString("jDate"));
				m.setlDate(rs.getString("lDate"));
				m.setvCount(rs.getInt("vCount"));
				m.setState(rs.getBoolean("state"));
				m.setImage(rs.getString("image"));
			}
			return m;
		}
		
	}
	
	public class memberRowMapper implements RowMapper<Member>{

		@Override
		public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
			Member m = new Member();
			
			m.setId(rs.getString("id"));
			m.setPw(rs.getString("pw"));
			m.setNickName(rs.getString("nickName"));
			m.setjDate(rs.getString("jDate"));
			m.setlDate(rs.getString("lDate"));
			m.setvCount(rs.getInt("vCount"));
			m.setState(rs.getBoolean("state"));
			m.setImage(rs.getString("image"));
			
			return m;
		}
		
	}
	// 내가 최근 작성한 포스트
	@Override
	public Post getMyLatelyPost(String id) {
		Post p = (Post) namedParameterJdbcTemplate.query(
				"select * from post where id = :id order by wdate desc", 
				new MapSqlParameterSource().addValue("id", id), 
				new RowMapper<Post>() {

					@Override
					public Post mapRow(ResultSet rs, int rowNum) throws SQLException {
						Post p = new Post();
						p.setpNo(rs.getInt("pno"));
						p.setTitle(rs.getString("title"));
						p.setmPage(rs.getInt("mPage"));
						p.setwDate(rs.getString("wDate"));
						p.setmDate(rs.getString("mDate"));
						p.settDate(rs.getString("tDate"));
						p.setGood(rs.getInt("good"));
						p.setState(rs.getBoolean("state"));
						
						return p;
					}
				});
		return p;
	}
	
	@Override
	public void modifyMember(Member m) {
		namedParameterJdbcTemplate.update(
				"UPDATE member SET image = :image, pComment = :pComment WHERE id = :id",
				new BeanPropertySqlParameterSource(m));
		
	}
}