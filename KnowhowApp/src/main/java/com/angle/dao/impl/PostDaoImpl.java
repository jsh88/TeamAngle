package com.angle.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.angle.dao.PostCommentDao;
import com.angle.dao.PostDao;
import com.angle.domain.MemberTag;
import com.angle.domain.Post;
import com.angle.domain.PostComment;
import com.angle.domain.PostContent;
import com.angle.domain.PostTag;

@Repository
public class PostDaoImpl implements PostDao, PostCommentDao {

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
	public void addPost(Post p) {

		String time = jdbcTemplate.queryForObject("select sysdate from dual", String.class);
		int seq = jdbcTemplate.queryForObject("select post_seq.nextval from dual", Integer.class);

		jdbcTemplate.update("insert into post values(?, ?, ?, 1, sysdate, sysdate, null, 0, 0, 0)",
				new Object[] { seq, p.getId(), p.getTitle() });

		p.setpNo(seq);
		p.setmPage(1);
		p.setmDate(time);
		p.setwDate(time);
		p.setGood(0);
		p.setState(false);

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

		jdbcTemplate.update("update post set mpage = mpage + 1, tdate = sysdate where pno = ?", pCon.getpNo());

	}

	@Override
	public Post getPost(int pNo) {

		return jdbcTemplate.queryForObject("select p.*, nickname from post p, member m where p.id=m.id and p.pno = ?",
				new Object[] { pNo }, new RowMapper<Post>() {

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
						p.setCount(rs.getInt("count"));
						p.setGood(rs.getInt("good"));
						p.setState(rs.getInt("state") == 1 ? true : false);

						return p;

					}
				});
	}

	@Override
	public ArrayList<PostContent> getPostPage(int pNo) {

		return (ArrayList<PostContent>) jdbcTemplate.query("select * from postContent where pno = ? order by page asc",
				new Object[] { pNo }, new ResultSetExtractor<ArrayList<PostContent>>() {

					@Override
					public ArrayList<PostContent> extractData(ResultSet rs) throws SQLException, DataAccessException {

						if (rs.next()) {

							ArrayList<PostContent> pConList = new ArrayList<>();

							do {

								PostContent pCon = new PostContent();

								pCon.setpNo(pNo);
								pCon.setPage(rs.getInt("page"));
								pCon.setContent(rs.getString("content").replaceAll("\r\n", "<br>"));

								if (rs.getString("media").indexOf("https:") > -1
										|| rs.getString("media").equals("none"))

									// url 이거나, 미디어가 없으면 그냥 넣는다.
									pCon.setMedia(rs.getString("media"));

								else

									// 이미지 넣는당
									pCon.setMedia("resources/images/" + rs.getString("media"));

								pConList.add(pCon);

							} while (rs.next());

							return pConList;

						} else

							// 해당 포스트에 페이지가 없으면 null
							return null;

					}
				});
	}

	@Override
	public void delPostPage(int pNo, int pageNum) {

		jdbcTemplate.update("delete from postContent where pno = ? and page = ?", pageNum, pNo);

		jdbcTemplate.update("update post set mpage = mpage - 1, tdate = sysdate where pno = ?", pNo);

	}

	@Override
	public void delPost(int pNo) {

		jdbcTemplate.update("delete from post where pno = ?", pNo);

	}

	@Override
	public ArrayList<Post> getTempPostList(String id) {

		return jdbcTemplate.query("select * from post where id = ? and state = 0", new Object[] { id },
				new ResultSetExtractor<ArrayList<Post>>() {

					@Override
					public ArrayList<Post> extractData(ResultSet rs) throws SQLException, DataAccessException {

						if (rs.next()) {

							ArrayList<Post> pList = new ArrayList<>();

							do {

								Post p = new Post();

								p.setpNo(rs.getInt("pno"));
								p.setId(rs.getString("id"));
								p.setNickName(rs.getString("nickname"));
								p.setTitle(rs.getString("title"));
								p.setmPage(rs.getInt("mpage"));
								p.setwDate(rs.getString("wdate"));
								p.setmDate(rs.getString("mdate"));
								p.settDate(rs.getString("tdate"));
								p.setGood(rs.getInt("good"));
								p.setState(false);

								pList.add(p);

							} while (rs.next());

							return pList;

						} else

							// 임시 포스트가 없으면 null
							return null;

					}
				});

	}

	@Override
	public HashMap<Integer, ArrayList<PostComment>> getPostCommentListAll(int pNo, int mPage) {

		HashMap<Integer, ArrayList<PostComment>> pComListMap = new HashMap<>();

		for (int i = 0; i < mPage; i++)

			pComListMap.put(i,
					jdbcTemplate.query(
							"select p.*, m.id, m.nickName, m.image from postComment p, member m where pno = ? and page = ? and p.id = m.id order by wdate asc",
							new Object[] { pNo, i }, new ResultSetExtractor<ArrayList<PostComment>>() {

								@Override
								public ArrayList<PostComment> extractData(ResultSet rs)
										throws SQLException, DataAccessException {

									ArrayList<PostComment> pComList = null;

									if (rs.next()) {

										pComList = new ArrayList<>();

										do {

											PostComment pCom = new PostComment();

											pCom.setcNo(rs.getInt("cno"));
											pCom.setContent(rs.getString("content"));
											pCom.setId(rs.getString("id"));
											pCom.setImage(rs.getString("image"));
											pCom.setmDate(rs.getString("mdate"));
											pCom.setMedia(rs.getString("media"));
											pCom.setNickName(rs.getString("nickname"));
											pCom.setPage(rs.getInt("page"));
											pCom.setpNo(pNo);
											pCom.setwDate(rs.getString("wdate"));

											pComList.add(pCom);

										} while (rs.next());

									}

									return pComList;

								}
							}));

		return pComListMap;
	}

	@Override
	public void modifyPostComment(PostComment pCom) {

		jdbcTemplate.update("update postComment set content = ?, media = ?, mdate = sysdate where cno = ?",
				new Object[] { pCom.getContent(), pCom.getMedia(), pCom.getcNo() });

	}

	@Override
	public void addPostComment(PostComment pCom) {

		jdbcTemplate.update("insert into postComment values(com_seq.nextval, ?, ?, ?, ?, sysdate, sysdate, ?)",
				new Object[] { pCom.getPage(), pCom.getpNo(), pCom.getId(), pCom.getContent(), pCom.getMedia() });

	}

	@Override
	public void delPostComment(int cNo) {

		jdbcTemplate.update("delete from postComment where cno = ?", new Object[] { cNo });

	}

	@Override
	public boolean setRecommendPost(int pNo, String id) {

		try {

			jdbcTemplate.update("insert into postrecommendation values(?, ?)", new Object[] { id, pNo });

			return true;

		} catch (DataAccessException e) {

			jdbcTemplate.update("delete from postrecommendation where pno = ? and id = ?", new Object[] { pNo, id });

			return false;

		}

	}

	@Override
	public ArrayList<PostTag> completePosting(ArrayList<PostTag> pTagList) {

		long start = System.currentTimeMillis();

		// try {

		// jdbcTemplate.getDataSource().getConnection().setAutoCommit(false);

		for (PostTag p : pTagList) {

			// // 루트 태그 업로드
			// try {
			//
			// jdbcTemplate.update("insert into tag values(?, 1, 0, sysdate,
			// sysdate)",
			// new Object[] { p.getTag() });
			//
			// } catch (DataAccessException e) {
			//
			// jdbcTemplate.update("update tag set count = count + 1, rdate =
			// sysdate where tag = ?",
			// new Object[] { p.getTag() });
			//
			// }

			// 포스트 태그 업로드
			try {

				jdbcTemplate.update("insert into posttag values(?, ?, 1, 0, sysdate, sysdate)",
						new Object[] { p.getpNo(), p.getTag() });

			} catch (DataAccessException e) {

				System.out.println("시도 했다?");

				jdbcTemplate.update("update posttag set count = count + 1, rdate = sysdate where tag = ? and pno = ?",
						new Object[] { p.getTag(), p.getpNo() });

			}
		}

		if (!pTagList.isEmpty())

			return jdbcTemplate.query("select * from posttag where pno = ? order by count desc",
					new Object[] { pTagList.get(0).getpNo() }, new ResultSetExtractor<ArrayList<PostTag>>() {

						@Override
						public ArrayList<PostTag> extractData(ResultSet rs) throws SQLException, DataAccessException {

							ArrayList<PostTag> pTagList = new ArrayList<>();

							while (rs.next()) {

								PostTag p = new PostTag();

								p.setpNo(rs.getInt("pno"));
								p.setCount(rs.getInt("count"));
								p.setTag(rs.getString("tag"));
								p.setWeight(rs.getInt("weight"));
								p.setfDate(rs.getString("fdate"));
								p.setrDate(rs.getString("rdate"));

								pTagList.add(p);

							}

							long end = System.currentTimeMillis();

							System.out.println("실행 시간 : " + (end - start) / 1000.0);
							System.out.println("태그 개수 : " + pTagList.size());

							// jdbcTemplate.getDataSource().getConnection().commit();
							// jdbcTemplate.getDataSource().getConnection().setAutoCommit(true);

							return pTagList;

						}
					});

		// } catch (SQLException e) {
		// e.printStackTrace();
		// }

		return null;
	}

	@Override
	public void addPostPage(ArrayList<PostContent> pConList) {

		jdbcTemplate.update("delete from postContent where pno = ?", new Object[] { pConList.get(0).getpNo() });

		for (int i = 0; i < pConList.size(); i++)

			jdbcTemplate.update("insert into postContent values(?, ?, ?, ?)", new Object[] { pConList.get(i).getpNo(),
					pConList.get(i).getPage(), pConList.get(i).getContent(), pConList.get(i).getMedia() });

	}

	@Override
	public void setPostState(int pNo) {

		jdbcTemplate.update("update post set state = 1, tdate = null where pno = ?", new Object[] { pNo });

	}

	@Override
	public void modifyTitle(int pNo, String title) {

		jdbcTemplate.update("update post set title = ? where pno = ?", new Object[] { pNo, title });

	}

	@Override
	public void setMaxPostPage(int pNo, int mPage) {

		jdbcTemplate.update("update post set mpage = ? where pno = ?", new Object[] { mPage, pNo });

	}

	@Override
	public void setViewInfo(String id, int pNo) {

		jdbcTemplate.update("update post set count = count + 1 where pno = ?", new Object[] { pNo });

		try {

			jdbcTemplate.update("insert into postlog values(?, ?, 1, sysdate)", new Object[] { pNo, id });

		} catch (DataAccessException e) {

			jdbcTemplate.update("update postlog set count = count + 1, rdate = sysdate where pno=? and id=?",
					new Object[] { pNo, id });

		}

	}

	@Override
	public ArrayList<PostComment> getPostCommentList(int pNo, int page) {

		return jdbcTemplate.query(
				"select p.*, m.id, m.nickName, m.image from postComment p, member m where pno = ? and page = ? and p.id = m.id order by wdate asc",
				new Object[] { pNo, page }, new ResultSetExtractor<ArrayList<PostComment>>() {

					@Override
					public ArrayList<PostComment> extractData(ResultSet rs) throws SQLException, DataAccessException {

						ArrayList<PostComment> pComList = null;

						if (rs.next()) {

							pComList = new ArrayList<>();

							do {

								PostComment pCom = new PostComment();

								pCom.setcNo(rs.getInt("cno"));
								pCom.setContent(rs.getString("content"));
								pCom.setId(rs.getString("id"));
								pCom.setImage("resources/images/" + rs.getString("image"));
								pCom.setmDate(rs.getString("mdate"));
								pCom.setMedia(rs.getString("media"));
								pCom.setNickName(rs.getString("nickname"));
								pCom.setPage(rs.getInt("page"));
								pCom.setpNo(pNo);
								pCom.setwDate(rs.getString("wdate"));

								pComList.add(pCom);

							} while (rs.next());

						}

						return pComList;

					}
				});
	}

	@Override
	public int getPostRecommendationCount(int pNo) {

		return jdbcTemplate.queryForObject("select count(*) from postrecommendation where pno = ?",
				new Object[] { pNo }, Integer.class);

	}

	@Override
	public Post getPostInfo(int no) {

		return jdbcTemplate.query(
				"select pt.*, m.nickname from (select row_number() over (order by wdate desc) no, p.* from post p) pt, member m where no = ? and m.id = pt.id and pt.state = 1",
				new Object[] { no }, new ResultSetExtractor<Post>() {

					@Override
					public Post extractData(ResultSet rs) throws SQLException, DataAccessException {

						if (rs.next()) {

							Post p = new Post();

							p.setpNo(rs.getInt("pno")); // 포스트 번호
							p.setTitle(rs.getString("title")); // 타이틀
							p.setwDate(rs.getString("wdate")); // 작성일
							p.setCount(rs.getInt("count")); // 조회수
							p.setGood(rs.getInt("good")); // 추천
							p.setId(rs.getString("id")); // 아이디
							p.setNickName(rs.getString("nickname")); // 닉네임

							// 내용, 미디어
							jdbcTemplate.queryForObject(
									"select content, media from postContent pc, post p where p.pno = ? and page = 0 and pc.pno = p.pno and state = 1",
									new Object[] { p.getpNo() }, new RowMapper<PostContent>() {

								@Override
								public PostContent mapRow(ResultSet rs, int rowNum) throws SQLException {

									p.setContent(rs.getString("content")); // 내용
									p.setMedia(rs.getString("media").indexOf("https:") == -1
											&& !rs.getString("media").equals("none")
													? "resources/images/" + rs.getString("media")
													: rs.getString("media"));

									return null;
								}
							});

							// 댓글 수
							p.setcCount(jdbcTemplate.queryForObject("select count(*) from postComment where pno = ?",
									new Object[] { p.getpNo() }, Integer.class));

							// 태그
							p.settList((ArrayList<String>) jdbcTemplate.query(
									"select tag from postTag where pno = ? order by count desc",
									new Object[] { p.getpNo() }, new ResultSetExtractor<ArrayList<String>>() {

								@Override
								public ArrayList<String> extractData(ResultSet rs)
										throws SQLException, DataAccessException {

									ArrayList<String> tList = new ArrayList<>();

									for (int i = 0; rs.next(); i++) {
										tList.add(rs.getString("tag"));
										if (i == 9)
											break;
									}
									return tList;
								}
							}));

							return p;

						} else
							return null;
					}
				});
	}

	@Override
	public Post getBestPostInfo(int no) {

		return jdbcTemplate.query(
				"select pt.*, m.nickname from (select row_number() over (order by count desc) no, p.* from post p) pt, member m where no = ? and m.id = pt.id and pt.state = 1",
				new Object[] { no }, new ResultSetExtractor<Post>() {

					@Override
					public Post extractData(ResultSet rs) throws SQLException, DataAccessException {

						if (rs.next()) {

							Post p = new Post();

							p.setpNo(rs.getInt("pno")); // 포스트 번호
							p.setTitle(rs.getString("title")); // 타이틀
							p.setwDate(rs.getString("wdate")); // 작성일
							p.setCount(rs.getInt("count")); // 조회수
							p.setGood(rs.getInt("good")); // 추천
							p.setId(rs.getString("id")); // 아이디
							p.setNickName(rs.getString("nickname")); // 닉네임

							// 내용, 미디어
							jdbcTemplate.queryForObject(
									"select content, media from postContent pc, post p where p.pno = ? and page = 0 and pc.pno = p.pno and state = 1",
									new Object[] { p.getpNo() }, new RowMapper<PostContent>() {

								@Override
								public PostContent mapRow(ResultSet rs, int rowNum) throws SQLException {

									p.setContent(rs.getString("content")); // 내용
									p.setMedia(rs.getString("media").indexOf("https:") == -1
											&& !rs.getString("media").equals("none")
													? "resources/images/" + rs.getString("media")
													: rs.getString("media"));

									return null;
								}
							});

							// 댓글 수
							p.setcCount(jdbcTemplate.queryForObject("select count(*) from postComment where pno = ?",
									new Object[] { p.getpNo() }, Integer.class));

							// 태그
							p.settList((ArrayList<String>) jdbcTemplate.query(
									"select tag from postTag where pno = ? order by count desc",
									new Object[] { p.getpNo() }, new ResultSetExtractor<ArrayList<String>>() {

								@Override
								public ArrayList<String> extractData(ResultSet rs)
										throws SQLException, DataAccessException {

									ArrayList<String> tList = new ArrayList<>();

									for (int i = 0; rs.next(); i++) {
										tList.add(rs.getString("tag"));
										if (i == 9)
											break;
									}
									return tList;
								}
							}));

							return p;

						} else
							return null;
					}
				});
	}

	@Override
	public Post getSearchPostView(ArrayList<MemberTag> mTagList, int no) {
		
		return jdbcTemplate.query(
				"select pt.*, m.nickname from (select row_number() over (order by count desc) no, p.* from post p) pt, member m where no = ? and m.id = pt.id and pt.state = 1",
				new Object[] { no }, new ResultSetExtractor<Post>() {

					@Override
					public Post extractData(ResultSet rs) throws SQLException, DataAccessException {

						if (rs.next()) {

							Post p = new Post();

							p.setpNo(rs.getInt("pno")); // 포스트 번호
							p.setTitle(rs.getString("title")); // 타이틀
							p.setwDate(rs.getString("wdate")); // 작성일
							p.setCount(rs.getInt("count")); // 조회수
							p.setGood(rs.getInt("good")); // 추천
							p.setId(rs.getString("id")); // 아이디
							p.setNickName(rs.getString("nickname")); // 닉네임

							// 내용, 미디어
							jdbcTemplate.queryForObject(
									"select content, media from postContent pc, post p where p.pno = ? and page = 0 and pc.pno = p.pno and state = 1",
									new Object[] { p.getpNo() }, new RowMapper<PostContent>() {

								@Override
								public PostContent mapRow(ResultSet rs, int rowNum) throws SQLException {

									p.setContent(rs.getString("content")); // 내용
									p.setMedia(rs.getString("media").indexOf("https:") == -1
											&& !rs.getString("media").equals("none")
													? "resources/images/" + rs.getString("media")
													: rs.getString("media"));

									return null;
								}
							});

							// 댓글 수
							p.setcCount(jdbcTemplate.queryForObject("select count(*) from postComment where pno = ?",
									new Object[] { p.getpNo() }, Integer.class));

							// 태그
							p.settList((ArrayList<String>) jdbcTemplate.query(
									"select tag from postTag where pno = ? order by count desc",
									new Object[] { p.getpNo() }, new ResultSetExtractor<ArrayList<String>>() {

								@Override
								public ArrayList<String> extractData(ResultSet rs)
										throws SQLException, DataAccessException {

									ArrayList<String> tList = new ArrayList<>();

									for (int i = 0; rs.next(); i++) {
										tList.add(rs.getString("tag"));
										if (i == 9)
											break;
									}
									return tList;
								}
							}));

							return p;

						} else
							return null;
					}
				});
	}
}