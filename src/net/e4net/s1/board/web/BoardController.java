package net.e4net.s1.board.web;

import java.util.List;

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
import net.e4net.eiwaf.web.RequestContext;
import net.e4net.eiwaf.web.util.WebUtil;
import net.e4net.s1.board.service.BoardService;
import net.e4net.s1.board.vo.BoardVO;
import net.e4net.s1.comn.PublicController;
  
@Controller
@RequestMapping("/board/*")
public class BoardController extends PublicController {
	
//	@Resource(name="BoardService")
	@Autowired
	BoardService boardService;
	
    @RequestMapping("/list.do")
	public ModelAndView list(HttpServletRequest request,RequestContext requestContext) throws Exception {
    	List<BoardVO> list = boardService.listAll();
    	
    	
    	ModelAndView mav = new ModelAndView();
		mav.setViewName("board/list");
		mav.addObject("list", list);
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
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
    
    @RequestMapping(value="insert.do", method=RequestMethod.POST)
    public String insert(@ModelAttribute BoardVO vo) throws Exception{
    	boardService.create(vo);
    	return "redirect:list.do";
    }
    
    @RequestMapping(value="view.do", method=RequestMethod.GET)
    public ModelAndView view(@RequestParam int boardBno, HttpSession session, HttpServletRequest request)throws Exception{
    	System.out.println("**********view controller**********");
    	boardService.increaseViewcnt(boardBno, session);
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("board/view");
    	mav.addObject("dto", boardService.read(boardBno));
    	Status status = WebUtil.getAttributeStatus(request);
    	if(status.isOk()) {
    		return getOkModelAndView(mav, status);
    	} else {
    		return getFailModelAndView(mav, status);
    	}
    }
    
    @RequestMapping(value="update.do", method=RequestMethod.POST)
    public String update(@ModelAttribute BoardVO vo) throws Exception{
    	boardService.update(vo);
    	return "redirect:list.do";
    }
    
    @RequestMapping("delete.do")
    public String delete(@RequestParam int boardBno) throws Exception{
    	boardService.delete(boardBno);
    	return "redirect:list.do";
    }
}
