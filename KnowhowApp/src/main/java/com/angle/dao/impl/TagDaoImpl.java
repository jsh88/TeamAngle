package com.angle.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.angle.dao.TagDao;
import com.angle.domain.MemberTag;
import com.angle.domain.PostTag;
import com.angle.domain.Tag;

@Repository
public class TagDaoImpl implements TagDao {

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
	public void addRootTag(ArrayList<PostTag> pTagList) {

		for (PostTag p : pTagList) {

			// 루트 태그 업로드
			try {
				System.out.println(p.getTag() + " 도전!");
				jdbcTemplate.update("insert into tag values(?, 1, 0, sysdate, sysdate)", new Object[] { p.getTag() });

			} catch (DataAccessException e) {
				System.out.println(p.getTag() + " 이미 있다!");
				jdbcTemplate.update("update tag set count = count + 1, rdate = sysdate where tag = ?",
						new Object[] { p.getTag() });

			}
		}
	}

	@Override
	public void addPostTag(ArrayList<PostTag> pTagList) {

		for (PostTag p : pTagList) {

			// 포스트 태그 업로드
			try {
				System.out.println(p.getTag() + " 도전!");
				jdbcTemplate.update("insert into posttag values(?, ?, 1, 0, sysdate, sysdate)",
						new Object[] { p.getpNo(), p.getTag() });

			} catch (DataAccessException e) {
				System.out.println(p.getTag() + " 이미 있다!");
				jdbcTemplate.update("update posttag set count = count + 1, rdate = sysdate where tag = ?",
						new Object[] { p.getTag() });

			}
		}

	}

	@Override
	public void addMemberTag(ArrayList<MemberTag> mTagList) {

		for (MemberTag m : mTagList) {

			// 포스트 태그 업로드
			try {

				jdbcTemplate.update("insert into membertag values(?, ?, 1, 0, sysdate, sysdate)",
						new Object[] { m.getId(), m.getTag() });

			} catch (DataAccessException e) {

				jdbcTemplate.update("update membertag set count = count + 1, rdate = sysdate where tag = ?",
						new Object[] { m.getTag() });

			}
		}

	}

	@Override
	public ArrayList<Tag> getIntroTagList() {

		return (ArrayList<Tag>) jdbcTemplate.query("select * from tag order by rdate desc", new RowMapper<Tag>() {

			@Override
			public Tag mapRow(ResultSet rs, int rowNum) throws SQLException {

				Tag tag = new Tag();

				tag.setTag(rs.getString("tag"));
				tag.setCount(rs.getInt("count"));
				tag.setWeight(rs.getInt("weight"));
				tag.setfDate(rs.getString("fdate"));
				tag.setrDate(rs.getString("rdate"));

				return null;

			}
		});
	}
}