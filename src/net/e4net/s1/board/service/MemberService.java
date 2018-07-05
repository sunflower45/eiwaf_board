package net.e4net.s1.board.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import net.e4net.s1.board.vo.MemberVO;
import net.e4net.s1.comn.TestService;

@Service
public class MemberService extends TestService{

	SqlSession SqlSession;
	public String findId(MemberVO vo) throws Exception {
		SqlSession = null;
		SqlSession = openSession(true);
		System.out.println("IDFIND name : "+vo.getMemberName());
		System.out.println("IDFIND email : "+vo.getMemberEmail());
		return (String) SqlSession.selectOne("member.findId", vo);
	}
	
	public String findPw(MemberVO vo) throws Exception {
		SqlSession = null;
		SqlSession = openSession(true);
		System.out.println("IDFIND name : "+vo.getMemberName());
		System.out.println("IDFIND id : "+vo.getMemberId());
		return (String) SqlSession.selectOne("member.findPw", vo);
	}
	public void joinUpdate(MemberVO vo) throws Exception {

		SqlSession = openSession(true);
		SqlSession.update("member.joinMember", vo);
	}
	
	public String loginCheck(MemberVO vo, HttpSession session) throws Exception{
		SqlSession = null;
		SqlSession = openSession(true);
		String name = (String) SqlSession.selectOne("member.loginCheck", vo);
		
		return name;
	}
	
	public MemberVO viewMember(MemberVO vo)  throws Exception{
		SqlSession = openSession(true);
		return (MemberVO) SqlSession.selectOne("member.viewMember", vo);
	}
	
	public void logout(HttpSession session)  throws Exception{
		SqlSession = openSession(true);

		session.invalidate();
	}
}
