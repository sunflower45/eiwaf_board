package net.e4net.s1.board.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import net.e4net.s1.board.vo.BoardVO;
import net.e4net.s1.comn.TestService;

@Service("BoardService")
public class BoardService extends TestService {
	
	SqlSession SqlSession;
	
	//@Override
	public void create(BoardVO vo) throws Exception {
		SqlSession.insert("board.insert", vo);
	}
	//@Override
	public BoardVO read(int boardBno) throws Exception{
		return (BoardVO) SqlSession.selectOne("board.view", boardBno);
	}
	//@Override
	public void update(BoardVO vo) throws Exception{
		SqlSession.update("board.updateArticle", vo);
	}
	//@Override
	public void delete(int boardBno) throws Exception{
		SqlSession.delete("board.deleteArticle", boardBno);
	}
	//@Override
	@SuppressWarnings("unchecked")
	public List<BoardVO> listAll() throws Exception{
		SqlSession = openSession(true);
		return (List<BoardVO>)SqlSession.selectList("board.listAll");
	}
	//@Override
	public void increaseViewcnt(int boardBno, HttpSession session) throws Exception{
		long update_time = 0;
		if(session.getAttribute("update_time_"+boardBno)!=null) {
			update_time = (long)session.getAttribute("update_time_"+boardBno);
			
		}
		long current_time = System.currentTimeMillis();
		if(current_time - update_time > 5*1000) {
			SqlSession.update("board.increaseViewcnt", boardBno);
			session.setAttribute("update_time_"+boardBno, current_time);
		}
	}
}