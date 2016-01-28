package com.angle.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.angle.dao.PostDao;
import com.angle.domain.Post;
import com.angle.domain.PostContent;

@Repository
public class PostDaoImpl implements PostDao {

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
	public Post addPost(Post p) {

		String time = jdbcTemplate.queryForObject("select sysdate from dual", String.class);
		int seq = jdbcTemplate.queryForObject("select post_seq.nextval from dual", Integer.class);

		jdbcTemplate.update("insert into post values(?, ?, ?, 1, sysdate, sysdate, null, 0, 0)",
				new Object[] { seq, p.getId(), p.getTitle() });

		p.setpNo(seq);
		p.setmPage(1);
		p.setmDate(time);
		p.setwDate(time);
		p.setGood(0);
		p.setState(false);

		return p;

	}

	@Override
	public void modifyPostPage(PostContent pCon) {

		jdbcTemplate.update("update postContent set page=?, content=?, media=? where pno=?",
				new Object[] { pCon.getPage(), pCon.getContent(), pCon.getMedia(), pCon.getpNo() });

	}

	@Override
	public void addPostPage(PostContent pCon) {

		jdbcTemplate.update("insert into postContent values(?, ?, ?, ?)",
				new Object[] { pCon.getpNo(), pCon.getPage(), pCon.getContent(), pCon.getMedia() });

	}

	@Override
	public Post getPost(int pNo) {

		return jdbcTemplate.queryForObject("select p.*, nickname from post p, member m where p.id=m.id and p.pno = ?",
				new Object[] {}, new RowMapper<Post>() {

					@Override
					public Post mapRow(ResultSet rs, int rowNum) throws SQLException {

						Post p = new Post();

						p.setpNo(pNo);
						p.setId(rs.getString("id"));
						p.setNickName(rs.getString("nickname"));
						p.setTitle(rs.getString("title"));
						p.setmPage(rs.getInt("mpage"));
						p.setwDate(rs.getString("wdate"));
						p.setmDate(rs.getString("mdate"));
						p.settDate(rs.getString("tdate"));
						p.setGood(rs.getInt("good"));
						p.setState(rs.getInt("state") == 1 ? true : false);

						return p;

					}
				});
	}

	@Override
	public ArrayList<PostContent> getPostPage(int pNo) {

		return (ArrayList<PostContent>) jdbcTemplate.query("select * from postContent where pno = ? order by page asc", new Object[] { pNo },
				new RowMapper<PostContent>() {

					@Override
					public PostContent mapRow(ResultSet rs, int rowNum) throws SQLException {
						
						
						
						return null;
					}
				});
	}
}