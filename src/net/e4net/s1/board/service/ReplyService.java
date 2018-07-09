package net.e4net.s1.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import net.e4net.s1.board.vo.ReplyVO;
import net.e4net.s1.comn.TestService;

@Service("ReplyService")
public class ReplyService extends TestService{
	SqlSession SqlSession;
	
	@SuppressWarnings("unchecked")
	public List<ReplyVO> list(int replyBno){
		SqlSession = null;
		SqlSession = openSession(true);
		return (List<ReplyVO>) SqlSession.selectList("reply.listReply", replyBno);
	}
	
	public void create(ReplyVO vo) {
		SqlSession = null;
		SqlSession = openSession(true);
		SqlSession.insert("reply.insertReply", vo);
	}
	
	public void update(ReplyVO vo) {
		SqlSession = null;
		SqlSession = openSession(true);
		SqlSession.update("reply.updateReply", vo);
	}
	
	public void delete(int replyRno) {
		SqlSession = null;
		SqlSession = openSession(true);
		SqlSession.update("reply.deleteReply", replyRno);		
	}
	
	public ReplyVO detail(int replyRno) {
		SqlSession = null;
		SqlSession = openSession(true);
		return (ReplyVO) SqlSession.selectOne("reply.detailReply", replyRno);
	}
}
