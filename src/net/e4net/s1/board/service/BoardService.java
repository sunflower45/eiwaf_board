package net.e4net.s1.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import net.e4net.s1.board.vo.BoardVO;
import net.e4net.s1.comn.TestService;

@Service("BoardService")
public class BoardService extends TestService {
	
	SqlSession SqlSession;
	
	public int countArticle(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return (int) SqlSession.selectOne("BoardService.countArticle", map);
	}
	public void create(BoardVO vo) throws Exception {
		SqlSession = openSession(true);
		SqlSession.insert("BoardService.insert", vo);
	}
	
	public BoardVO read(int boardBno) throws Exception{
		SqlSession = openSession(true);
		return (BoardVO) SqlSession.selectOne("BoardService.view", boardBno);
		
	}
	
	public void update(BoardVO vo) throws Exception{
		SqlSession = openSession(true);
		SqlSession.update("BoardService.updateArticle", vo);
	}
	
	public void delete(int boardBno) throws Exception{
		SqlSession = openSession(true);
		SqlSession.delete("BoardService.deleteArticle", boardBno);
	}

	@SuppressWarnings("unchecked")
	public List<BoardVO> listAll(String searchOption, String keyword) throws Exception{
		SqlSession = openSession(true);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return (List<BoardVO>)SqlSession.selectList("BoardService.listAll", map);
	}

	public void increaseViewcnt(int boardBno, HttpSession session) throws Exception{
		SqlSession = openSession(true);
		long update_time = 0;
		if(session.getAttribute("update_time_"+boardBno)!=null) {
			update_time = (long)session.getAttribute("update_time_"+boardBno);
			
		}
		long current_time = System.currentTimeMillis();
		if(current_time - update_time > 5*1000) {
			SqlSession.update("BoardService.increaseViewcnt", boardBno);
			session.setAttribute("update_time_"+boardBno, current_time);
		}
	}
}