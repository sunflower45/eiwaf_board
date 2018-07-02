package net.e4net.s1.board.service;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import net.e4net.s1.board.vo.MemberVO;
import net.e4net.s1.comn.TestService;

@Service
public class MemberService extends TestService{

	SqlSession SqlSession;
	
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
