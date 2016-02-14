package com.angle.service.impl;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.angle.dao.MemberDao;
import com.angle.domain.Member;
import com.angle.domain.Post;
import com.angle.mail.Email;
import com.angle.mail.EmailSender;
import com.angle.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private EmailSender emailSender;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public Member getMember(String id) {

		return memberDao.getMember(id);
	}

	@Override
	public void insertMemberJoin(HttpServletRequest request) throws IOException {

		/*
		 * GregorianCalendar now = new GregorianCalendar(); String date =
		 * String.format("%TF", now); // 날짜 String time = String.format("%TT",
		 * now); // 시간 String dateTime = date + " " + time;
		 * 
		 * System.out.println(dateTime);
		 */

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nickname = request.getParameter("nickname");

		System.out.println("MemberService : id - " + id);
		System.out.println("MemberService : pw - " + pw);
		System.out.println("MemberService : nickname - " + nickname);

		int vcount = 0;

		String image = "";
		String pComment = "";

		Member m = new Member();
		m.setId(id);
		m.setPw(pw);
		m.setNickName(nickname);
		m.setjDate("");
		m.setlDate("");
		m.setvCount(vcount);
		m.setState(true);
		m.setImage(image);
		m.setpComment(pComment);

		memberDao.insertMemberJoin(m);

	}

	@Override
	public int checkId(HttpServletRequest request) {

		String id = request.getParameter("id");
		int result = memberDao.checkId(id);
		return result;
	}

	@Override
	public int checkNickName(HttpServletRequest request) {

		String nickname = request.getParameter("nickname");
		int result = memberDao.checkNickName(nickname);
		return result;
	}

	//패스워드 검색일경우 db접속을 불필요 하게 하여 세션에 저장된 비밀번호를 가져와 비교하는것으로 바꿈
	@Override
	public int modifyCheckPw(String pass, HttpSession session) {
		Member m = (Member) session.getAttribute("member");
		String pw = m.getPw();
		int result = 1;
		if (pass.equals(pw)) {
			result = 0;
		}
		return result;
	}

	@Override
	public int checkPw(HttpServletRequest request) {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		int result = memberDao.checkPw(id, pw);

		return result;
	}

	@Override
	public void deleteMember(String id) {
		
		memberDao.deleteMember(id);
	}

	/*
	 * @Override public void memberLoginCheck(HttpSession session,
	 * HttpServletRequest request) throws IOException {
	 * 
	 * String id = request.getParameter("id"); String pw =
	 * request.getParameter("pw"); Member m = new Member();
	 * 
	 * if(memberDao.memberLoginCheck(id, pw)) { session.setAttribute("member",
	 * memberDao.getMember(id).getId()); memberDao.updateLdate(m);
	 * 
	 * int result = memberDao.getVcount(id); if(result != 1) {
	 * memberDao.updateVcount(m); } }
	 * 
	 * }
	 */

	/*
	 * @Override public void updateMemberInfo(HttpServletRequest request) throws
	 * IOException {
	 * 
	 * Member member = new Member();
	 * 
	 * member.setId(request.getParameter("id"));
	 * member.setNickName(request.getParameter("nickname"));
	 * member.setPw(request.getParameter("pw"));
	 * 
	 * memberDao.updateMemberInfo(member);
	 * 
	 * }
	 */

	@Override
	public Member getMember(HttpServletRequest request) {

		Member member = new Member();
		String id = request.getParameter("id");
		member = memberDao.getMember(id);

		return member;
	}

	//아이디 수정에서 바꾸는 아이디와 바뀔 아이디 구분 되어 있지 않고 바꾸는 아이디만 들어 있어서 수정.
	@Override
	public void updateMemberInfoId(HttpServletRequest request, HttpSession session) throws IOException {

		Member member = (Member)session.getAttribute("member");
		String idModify = request.getParameter("id");

		memberDao.updateMemberInfoId(member, idModify);
		member.setId(idModify);
		session.setAttribute("member", member);

	}

	@Override
	public void updateMemberInfoNickName(HttpServletRequest request, HttpSession session) throws IOException {

		Member member = (Member)session.getAttribute("member");
		String nickNameModify = request.getParameter("nick");

		memberDao.updateMemberInfoNickName(member, nickNameModify);
		member.setNickName(nickNameModify);
		session.setAttribute("member", member);

	}

	//세션에서 맴버를 가져오는게 아니라 new로 새로 생성해버려서 잘못됨 그래서 수정함.
	@Override
	public void updateMemberInfoPw(HttpServletRequest request, HttpSession session) throws IOException {

		Member member = (Member)session.getAttribute("member");
		System.out.println(member.getId());
		System.out.println(request.getParameter("pass1"));
		member.setPw(request.getParameter("pass1"));

		memberDao.updateMemberInfoPw(member);
	}

	//로그인 세션을 잘못잡음 id와 패스워드만 잡아 놨음. 맴버 최근 접속 쿼리도 이상하여 수정. 
	@Override
	public int memberLoginCheck(String id, String pw, HttpServletRequest request, HttpSession session) {

		int result = 1;

		Member member = memberDao.memberLogin(id);
		System.out.println(member);
		if (member == null || member.getId().equals("")) {
			result = -1;
		} else {
			if (member.getPw().equals(pw)) {
				session.setAttribute("member", member);
				System.out.println(member.getId());
				int v_result = memberDao.getVcount(id);
				if (v_result != -1) {
					memberDao.updateVcount(member);
				}
				memberDao.updateLdate(member);
				result = 0;
			} else if (!member.getPw().equals(pw)) {
				result = 1;
			}
		}

		return result;		
		
	}

	// 내가 최근에 작성한 포인트
	@Override
	public void getMyLatelyPost(String id) {
		List<Post> pList = null;

		if (!pList.isEmpty() || pList != null) {
			pList = memberDao.getMyLatelyPost(id);
		}

	}

	//파일 업로드 처리 안해놨음. 파일 경로도 없고 그냥 셋 이미지만 되어 있었음. 폼태그에다가 enctype="multipart/form-data"이거 안해놓음.
	@Override
	public String modifyMember(MultipartHttpServletRequest request, String path, HttpSession session) throws IllegalStateException, IOException {

		Member m = (Member) session.getAttribute("member");
		MultipartFile multipartFile = request.getFile("image");
		String comment = request.getParameter("pcomment");
		if (!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			multipartFile.transferTo(file);
			m.setImage(multipartFile.getOriginalFilename());
			m.setpComment(comment);
		}else{
			m.setImage(null);
			m.setpComment(comment);
		}
		int result = memberDao.modifyMember(m);
		request.setAttribute("result", result);
		session.setAttribute("member", m);
		
		return multipartFile.getOriginalFilename() + ",," + m.getpComment();
	}

	@Override
	public void getMyConcernPost(String id) {
		List<Post> pList = null;
		pList = memberDao.getMyConcernPost(id);
		
	}
	@Override
	public List<Post> getMyLatelyLookupPost(String id) {
		List<Post> pList = null;
			pList = memberDao.getMyLatelyLookupPost(id);
		return pList;
	}

	@Override
	public List<Post> getMyMostLookupPost(String id) {
		List<Post> pList = null;
			pList = memberDao.getMyMostLookupPost(id);
		return pList;
	}

	@Override
	public void emailCheck(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		/*PrintWriter out = response.getWriter();*/
		Email email = new Email();
		String id = request.getParameter("id");
		System.out.println(id);
		Random random = new Random();
		// 0~999999 수를 받는다
		int cipher = 1000000;
		int randomInteger = random.nextInt(cipher);
		String support = "";
		for (int i = 5; i != 1; i--) {
			if (randomInteger < Math.pow(10, i)) {
				support += "0";
			}
		}
		String sendCode = (support + randomInteger).trim();
		request.getServletContext().setAttribute("sendCode", sendCode);
		System.out.println("(어플 저장함)sendCode : " + sendCode);
		String reciver = id;
		String subject = "안녕하세요 세상의 모든 노하우 KnowHow 입니다.";
		String content = "KnowHow 회원가입 인증 - \nhttp://172.20.10.2:8181/KnowhowApp/checkMemberJoin.do?id="+id+"&code="+sendCode;
		
		email.setReciver(reciver);
		email.setSubject(subject);
		email.setContent(content);
		emailSender.sendEmail(email);
		/*out.println("<script type=\'text/javascript'>"); 
		out.println("alert('인증메일을 확인하여 주십시오.');"); 
		out.println("</script>"); 
		out.close();*/

	}

	@Override
	public int getSendCodeCheck(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

		String id = request.getParameter("id");
		System.out.println("id"+id);
		String getCode = request.getParameter("code").trim();
		System.out.println("getCode : " + getCode);
		String sendCode = (String)request.getServletContext().getAttribute("sendCode");
		System.out.println("어플 - sendCode : " + sendCode);
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		
		int result = 0;
		
		if(getCode.equals(sendCode)){
			memberDao.acceptJoin(id);
			result = 1;
		}
		
		/*PrintWriter out = response.getWriter();*/
		/*String result = "<font color='red'>인증번호가 일치하지 않습니다</font>";
		if (sendCode.equals(getCode)) {
			memberDao.acceptJoin(id);
			result = "<font color='green'>확인 되었습니다.</font>";
		}*/
		/*out.println("<script type=\'text/javascript'>"); 
		out.println("alert("+ result +");"); 
		out.println("</script>"); 
		out.close();*/
		
		
		
		
		return result;
	}

	@Override
	public void getMyPostByViews(HttpServletRequest req, HttpSession session) {
		Member m = (Member) session.getAttribute("member");
		String id = m.getId();
		List<Post> pList = null;
		if (!pList.isEmpty() || pList != null) {
			pList = memberDao.getMyPostByViews(id);
		}

	}

	@Override
	public void getMyPostByRecommand(HttpServletRequest req, HttpSession session) {
		Member m = (Member) session.getAttribute("member");
		String id = m.getId();
		List<Post> pList = null;
		if (!pList.isEmpty() || pList != null) {
			pList = memberDao.getMyPostByRecommand(id);
		}

	}

	@Override
	public void getMyPostByComments(HttpServletRequest req, HttpSession session) {
		Member m = (Member) session.getAttribute("member");
		String id = m.getId();
		List<Post> pList = null;
		if (!pList.isEmpty() || pList != null) {
			pList = memberDao.getMyPostByComments(id);
		}

	}

	@Override
	public String getId(HttpServletRequest request) {
		
		String nickname = request.getParameter("nickname");		
		String pass = request.getParameter("pw");
		
		String id = memberDao.getId(nickname, pass);
		
		return id;
	}

	@Override
	public String getPw(HttpServletRequest request) {
		
		String id = request.getParameter("id");		
		
		String pw = memberDao.getPw(id);
		
		return pw;
	}

	@Override
	public String getEmail(HttpServletRequest request) {
		
		String nickname = request.getParameter("nickname");
		String pw = request.getParameter("pass");
		
		String id = memberDao.getEmail(nickname, pw);
		
		return id;
	}

}