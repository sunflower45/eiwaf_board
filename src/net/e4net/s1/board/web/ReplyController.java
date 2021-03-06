package net.e4net.s1.board.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.e4net.eiwaf.common.Status;
import net.e4net.eiwaf.web.util.WebUtil;
import net.e4net.s1.board.service.ReplyService;
import net.e4net.s1.board.vo.ReplyVO;
import net.e4net.s1.comn.PublicController;

@Controller
@RequestMapping("/reply/*")
public class ReplyController extends PublicController {
	
	@Autowired
	ReplyService replyService;
	
	@RequestMapping(value="insert.do", method=RequestMethod.POST)
	public ModelAndView insert( ReplyVO vo, HttpSession session, HttpServletRequest request) {

		String memberId = (String)session.getAttribute("memberId");
		vo.setReplyer(memberId);
		
		int replyBno = Integer.parseInt(request.getParameter("boardBno"));
		
		
		String replyText = request.getParameter("replyText");
		vo.setReplyBno(replyBno);
		vo.setReplyText(replyText);
		replyService.create(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		Status status = WebUtil.getAttributeStatus(request);
		if(status.isOk()) {
    		return getOkModelAndView(mav, status);
    	} else {
    		return getFailModelAndView(mav, status);
    	}
	}
	
	@RequestMapping(value="list.do", method=RequestMethod.GET)
	public ModelAndView list(@RequestParam int replyBno, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<ReplyVO> list = replyService.list(replyBno);
		mav.setViewName("board/replyList");
		mav.addObject("list", list);
    	Status status = WebUtil.getAttributeStatus(request);
		if(status.isOk()) {
    		return getOkModelAndView(mav, status);
    	} else {
    		return getFailModelAndView(mav, status);
    	}
	}
	
	@RequestMapping("listJson.do")
	@ResponseBody
	public List<ReplyVO> listJson(@RequestParam int replyBno, HttpServletRequest request) {
		List<ReplyVO> list = replyService.list(replyBno);
		return list;
	}
	
	@RequestMapping(value="detail.do", method=RequestMethod.GET)
	public ModelAndView replyDetail(@RequestParam  int replyRno, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		ReplyVO vo = replyService.detail(replyRno);
		mav.setViewName("board/replyDetail");
		mav.addObject("vo", vo);
		Status status = WebUtil.getAttributeStatus(request);
		if(status.isOk()) {
    		return getOkModelAndView(mav, status);
    	} else {
    		return getFailModelAndView(mav, status);
    	}
	}
	
	@RequestMapping(value="update.do", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView replyUpdate(ReplyVO vo, HttpServletRequest request) {
		int replyRno = Integer.parseInt(request.getParameter("replyRno"));
		String replyText =  request.getParameter("replyText");
		
		System.out.println("replyRno : "+replyRno+" replyText : "+replyText);
		vo.setReplyRno(replyRno);
		vo.setReplyText(replyText);
		replyService.update(vo);

		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("jsonView");
		Status status = WebUtil.getAttributeStatus(request);
		if(status.isOk()) {
    		return getOkModelAndView(mav, status);
    	} else {
    		return getFailModelAndView(mav, status);
    	}
	
}
	
	@RequestMapping(value="delete.do")
	public ModelAndView replyDelete(@RequestParam String replyRno,  HttpServletRequest request) {
		System.out.println("delete1");
		int rno = Integer.parseInt(replyRno);
		ModelAndView mav = new ModelAndView();
		replyService.delete(rno);
		System.out.println("delete3");

		mav.addObject("msg", "success");
		mav.setViewName("jsonView");
		Status status = WebUtil.getAttributeStatus(request);
		if(status.isOk()) {
			System.out.println("delete3");

    		return getOkModelAndView(mav, status);
    	} else {
    		return getFailModelAndView(mav, status);
    	}
		
	}	
}
