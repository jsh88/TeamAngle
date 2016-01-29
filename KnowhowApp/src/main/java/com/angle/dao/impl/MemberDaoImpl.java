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
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
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
	public void insertMemberJoin(Member member) {

		String state = "";

		if (member.isState() == true) {
			state = "1";
		} else {
			state = "0";
		}

		namedParameterJdbcTemplate.update(
				"insert into member values("
						+ ":id, :pw, :nickname, :jdate, :ldate, :vcount, :state, :image, :pcomment)",
				new MapSqlParameterSource().addValue("id", member.getId()).addValue("pw", member.getPw())
						.addValue("nickname", member.getNickName()).addValue("jdate", member.getjDate())
						.addValue("ldate", member.getlDate()).addValue("vcount", member.getvCount())
						.addValue("state", state).addValue("image", member.getImage())
						.addValue("pcomment", member.getpComment()));
	}

	@Override
	public int checkId(String id) {

		return namedParameterJdbcTemplate.query("select count(*) from member where id = :id",
				new MapSqlParameterSource().addValue("id", id), new ResultSetExtractor<Integer>() {

					@Override
					public Integer extractData(ResultSet rs) throws SQLException, DataAccessException {
						int temp = 1;
						if (rs.next()) {
							temp = rs.getInt(1);
						}
						return temp;
					}

				});
	}

	@Override
	public int checkNickName(String nickname) {

		return namedParameterJdbcTemplate.query("select count(*) from member where nickname = :nickname",
				new MapSqlParameterSource().addValue("nickname", nickname), new ResultSetExtractor<Integer>() {

					@Override
					public Integer extractData(ResultSet rs) throws SQLException, DataAccessException {
						int temp = 1;
						if (rs.next()) {
							temp = rs.getInt(1);
						}
						return temp;
					}
				});
	}

	@Override
	public int checkPw(String id, String pw) {

		return namedParameterJdbcTemplate.query("select count(*) from member where id = :id and pw = :pw",
				new MapSqlParameterSource().addValue("id", id).addValue("pw", pw), new ResultSetExtractor<Integer>() {

					@Override
					public Integer extractData(ResultSet rs) throws SQLException, DataAccessException {
						int temp = 1;
						if (rs.next()) {
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

		return namedParameterJdbcTemplate.query("SELECT * FROM member WHERE id = :id",
				new MapSqlParameterSource().addValue("id", id), new memberResultSetExtrctor());
	}

	public class memberResultSetExtrctor implements ResultSetExtractor<Member> {

		@Override
		public Member extractData(ResultSet rs) throws SQLException, DataAccessException {
			Member m = new Member();
			if (rs.next()) {
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

	@Override
	public Boolean memberLoginCheck(String id, String pw) {

		return jdbcTemplate.query("select 1 from member where id=? and pw=?", new Object[] { id, pw },
				new ResultSetExtractor<Boolean>() {

					@Override
					public Boolean extractData(ResultSet rs) throws SQLException, DataAccessException {

						if (rs.next())
							return true;

						return false;
					}
				});
	}

	@Override
	public void updateMemberInfo(Member member) {

		String sql = "update member set id= :id, nickname= :nickname, " + "pw= :pw where id= :id";

		namedParameterJdbcTemplate.update(sql,
				new MapSqlParameterSource().addValue("id", member.getId()).addValue("nickname", member.getNickName())
						.addValue("pw", member.getPw()).addValue("id", member.getId()));

	}

	public class memberRowMapper implements RowMapper<Member> {

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
		Post p = (Post) namedParameterJdbcTemplate.query("select * from post where id = :id order by wdate desc",
				new MapSqlParameterSource().addValue("id", id), new RowMapper<Post>() {

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
		namedParameterJdbcTemplate.update("UPDATE member SET image = :image, pComment = :pComment WHERE id = :id",
				new BeanPropertySqlParameterSource(m));

	}
}