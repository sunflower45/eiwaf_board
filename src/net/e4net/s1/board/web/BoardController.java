package net.e4net.s1.board.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.e4net.eiwaf.common.Status;
import net.e4net.eiwaf.web.util.WebUtil;
import net.e4net.s1.board.service.BoardService;
import net.e4net.s1.board.vo.BoardPager;
import net.e4net.s1.board.vo.BoardVO;
import net.e4net.s1.comn.PublicController;
  
@Controller
@RequestMapping("/board/*")
public class BoardController extends PublicController {
	
//	@Resource(name="BoardService")
	@Autowired
	BoardService boardService;
	
	
    @RequestMapping(value="list.do")
	public ModelAndView list(@RequestParam(defaultValue="board_title") String searchOption,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="1") int curPage, 
			HttpServletRequest request) throws Exception {
    	HttpSession session = request.getSession();
    	String memberName = (String) session.getAttribute("memberName");
    	
    	int count = boardService.countArticle(searchOption, keyword);
    	
    	BoardPager boardPager = new BoardPager(count, curPage);
    	int start = boardPager.getPageBegin();
    	int end = boardPager.getPageEnd();
    	List<BoardVO> list = boardService.listAll(start, end, searchOption, keyword);
    	
    	
    	
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("list", list);
    	map.put("count", count);
    	map.put("searchOption", searchOption);
    	map.put("keyword", keyword);
    	map.put("boardPager", boardPager);
    	
    	
    	ModelAndView mav = new ModelAndView();
		mav.setViewName("board/list");
		mav.addObject("map", map);
		mav.addObject("memberName", memberName);
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}
    @RequestMapping(value="view.do", method=RequestMethod.GET)
    public ModelAndView view(@RequestParam int boardBno, HttpSession session, HttpServletRequest request)throws Exception{
    	boardService.increaseViewcnt(boardBno, session);
    	BoardVO dto = boardService.read(boardBno);
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("board/view");
    	mav.addObject("dto", dto);
    	Status status = WebUtil.getAttributeStatus(request);
    	if(status.isOk()) {
    		return getOkModelAndView(mav, status);
    	} else {
    		return getFailModelAndView(mav, status);
    	}
    }
    @RequestMapping(value="write.do", method=RequestMethod.GET)
    public ModelAndView write(HttpServletRequest request) throws Exception{
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("board/write");
    	Status status = WebUtil.getAttributeStatus(request);
    	if(status.isOk()) {
    		return getOkModelAndView(mav, status);
    	} else {
    		return getFailModelAndView(mav, status);
    	}
    }
    @RequestMapping(value="modify.do", method=RequestMethod.GET)
    public ModelAndView modify(@RequestParam int boardBno, HttpServletRequest request) throws Exception {
    	BoardVO dto = boardService.read(boardBno);
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("board/modify");
    	mav.addObject("dto", dto);
    	Status status = WebUtil.getAttributeStatus(request);
    	if(status.isOk()) {
    		return getOkModelAndView(mav, status);
    	} else {
    		return getFailModelAndView(mav, status);
    	}
    }
    
    @RequestMapping(value="insert.do", method=RequestMethod.POST)
    public ModelAndView insert(@ModelAttribute BoardVO vo, HttpSession session) throws Exception{
    	String writer = (String)session.getAttribute("memberId");
    	vo.setBoardWriter(writer);
    	boardService.create(vo);
    	return getOkModelAndView("redirect:/board/list.do");
    }
    
    
    @RequestMapping(value="update.do", method=RequestMethod.POST)
    public ModelAndView update(@ModelAttribute BoardVO vo) throws Exception{
    	System.out.println("**********update controller**********");
    	boardService.update(vo);
    	return getOkModelAndView("redirect:/board/list.do");
    }
    
    @RequestMapping("delete.do")
    public ModelAndView delete(@RequestParam int boardBno) throws Exception{
    	boardService.delete(boardBno);
    	return getOkModelAndView("redirect:/board/list.do");
    }
}
