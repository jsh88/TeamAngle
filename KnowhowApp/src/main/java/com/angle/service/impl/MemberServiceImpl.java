package com.angle.service.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
	            
	      /*GregorianCalendar now = new GregorianCalendar();
	      String date = String.format("%TF", now);   // 날짜
	      String time = String.format("%TT", now);   // 시간
	      String dateTime = date + " " + time;
	      
	      System.out.println(dateTime);  */
	               
	      String id = request.getParameter("id");
	      String pw = request.getParameter("pw");
	      String nickname = request.getParameter("nickname");      
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

	@Override
	public int checkPw(HttpServletRequest request) {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		int result = memberDao.checkPw(id, pw);

		return result;
	}

	@Override
	public void deleteMember(HttpServletRequest request) {

		String id = request.getParameter("id");
		memberDao.deleteMember(id);		
	}

	/*@Override
	public void memberLoginCheck(HttpSession session, HttpServletRequest request) throws IOException {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		Member m = new Member();

		if(memberDao.memberLoginCheck(id, pw)) {
			session.setAttribute("member", memberDao.getMember(id).getId());
			memberDao.updateLdate(m);

			int result = memberDao.getVcount(id);
			if(result != 1) {
				memberDao.updateVcount(m);
			}
		}

	}*/

	/*@Override
	public void updateMemberInfo(HttpServletRequest request) throws IOException {

		Member member = new Member();

		member.setId(request.getParameter("id"));
		member.setNickName(request.getParameter("nickname"));
		member.setPw(request.getParameter("pw"));

		memberDao.updateMemberInfo(member);

	}*/

	@Override
	public Member getMember(HttpServletRequest request) {

		Member member = new Member();
		String id = request.getParameter("id");
		member = memberDao.getMember(id);

		return member;
	}

	@Override
	public void updateMemberInfoId(HttpServletRequest request) throws IOException {

		Member member = new Member();

		member.setId(request.getParameter("id"));

		memberDao.updateMemberInfoId(member);

	}

	@Override
	public void updateMemberInfoNickName(HttpServletRequest request) throws IOException {

		Member member = new Member();

		member.setNickName(request.getParameter("nickname"));

		memberDao.updateMemberInfoNickName(member);

	}

	@Override
	public void updateMemberInfoPw(HttpServletRequest request) throws IOException {

		Member member = new Member();

		member.setPw(request.getParameter("pw"));

		memberDao.updateMemberInfoPw(member);
	}

	@Override
	public int memberLoginCheck(HttpServletRequest request) {

		HttpSession session = request.getSession();
		int result = 1;

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		Member member = memberDao.memberLogin(id);

		if(member.getId().equals("")) {
			result = -1;
		} else {
			if(member.getPw().equals(pw)) {
//				session.setAttribute("isLogin", true);
				session.setAttribute("member", id);
				result = 0;
				memberDao.updateLdate(member);

				int v_result = memberDao.getVcount(id);
				if(v_result != 1) {
					memberDao.updateVcount(member);
				}
			} else if(!member.getPw().equals(pw)) {
				result = 1;
			}
		}

		return result;
	}

	// 내가 최근에 작성한 포인트
	@Override
	public List<Post> getMyLatelyPost(String id) {
		List<Post> pList = null;

		if(!pList.isEmpty() || pList != null){
			pList = memberDao.getMyLatelyPost(id);
		}

		return pList;
	}

	@Override
	public void modifyMember(MultipartHttpServletRequest req) {
		HttpSession session = req.getSession();
		Member m = (Member) session.getAttribute("member");
		String image = req.getParameter("image");
		String comment = req.getParameter("pComment");

		if(!image.isEmpty()){
			m.setImage(image);
		}
		if(!comment.isEmpty()){
			m.setpComment(comment);
		}

		memberDao.modifyMember(m);
	}

	@Override
	public List<Post> getMyConcernPost(String id) {
		List<Post> pList = null;

		if(!pList.isEmpty() || pList != null){
			pList = memberDao.getMyConcernPost(id);
		}
		return pList;
	}

	@Override
	public List<Post> getMyLatelyLookupPost(String id) {
		List<Post> pList = null;
		if(!pList.isEmpty()){
			pList = memberDao.getMyLatelyLookupPost(id);
		}
		return pList;
	}

	@Override
	public List<Post> getMyMostLookupPost(String id) {
		List<Post> pList = null;
		if(!pList.isEmpty()){
			pList = memberDao.getMyMostLookupPost(id);
		}
		return pList;
	}


	@Override
	public String emailCheck(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		Email email = new Email();
		String id = request.getParameter("id");
		System.out.println(id);
		Random random = new Random();
		//0~999999 수를 받는다
		int cipher = 1000000;
		int randomInteger = random.nextInt(cipher);
		String support = "";
		for(int i = 5; i != 1 ; i--){
			if(randomInteger < Math.pow(10, i)){
				support += "0";
			}
		}
		String sendCode = (support + randomInteger).trim();
		session.setAttribute("emailSendCode", sendCode);
		System.out.println("(세션 저장함)sendCode : " + sendCode);
		String reciver = id;
		String subject = "ProjectCall Email인증입니다";
		String content = "ProjectCall Email인증번호 :  " + sendCode ;

		email.setReciver(reciver);
		email.setSubject(subject);
		email.setContent(content);
		emailSender.sendEmail(email);
		out.println("인증메일을 전송하였습니다");
		out.close();


		return sendCode;
	}

	@Override
	public void getSendCodeCheck(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

		String getCode = request.getParameter("getCode").trim();
		System.out.println("getCode : "+ getCode);
		String emailSendCode = (String)session.getAttribute("emailSendCode");
		System.out.println("emailSendCode" + emailSendCode);
		response.setContentType("text/html;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		String result = "<font color='red'>인증번호가 일치하지 않습니다</font>";
		if(emailSendCode.equals(getCode)){
			result = "<font color='green'>확인 되었습니다.</font>";
		}
		out.println(result);
		out.close();
	}





}