package net.e4net.s1.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.e4net.eiwaf.common.Status;
import net.e4net.eiwaf.web.util.WebUtil;
import net.e4net.s1.board.service.MemberService;
import net.e4net.s1.board.vo.MemberVO;
import net.e4net.s1.comn.PublicController;

@Controller
@RequestMapping("/member/*")
public class MemberController extends PublicController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="idCheck.do", method=RequestMethod.POST)
	public ModelAndView idCheck(HttpServletRequest request) throws Exception {
		String id = request.getParameter("memberId");
		MemberVO vo = new MemberVO();
		vo.setMemberId(id);
		String idList = memberService.idCheck(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("cnt", idList);
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}	
	}
	@RequestMapping("find.do")
	public ModelAndView find(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/find");
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}
	
	@RequestMapping(value="findId.do", method=RequestMethod.POST)
	public ModelAndView findId(HttpServletRequest request)throws Exception {
		String email = request.getParameter("memberEmail");
		String name = request.getParameter("memberName");
		MemberVO vo = new MemberVO();
		vo.setMemberEmail(email);
		vo.setMemberName(name);
		String idList = memberService.findId(vo); 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("memberId", idList);
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}	
	}
	@RequestMapping(value="findPw.do", method=RequestMethod.POST)
	public ModelAndView findPw(HttpServletRequest request) throws Exception{
		String name = request.getParameter("memberName");
		String id = request.getParameter("memberId");
		MemberVO vo = new MemberVO();
		vo.setMemberId(id);
		vo.setMemberName(name);
		String pwList = memberService.findPw(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("memberPw", pwList);
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}
	@RequestMapping("loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute MemberVO vo, HttpSession session, HttpServletRequest request) throws Exception {
		String name = memberService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		session = request.getSession(true);
		session.setAttribute("member", vo);
		if(name != null) {
			MemberVO vo2 = memberService.viewMember(vo);
			mav.setViewName("main/main");
			mav.addObject("msg", "success");
			session.setAttribute("memberId", vo2.getMemberId());
			session.setAttribute("memberName", vo2.getMemberName());
		} else {
			mav.setViewName("main/main");
			mav.addObject("msg", "failure");
		}
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}
	@RequestMapping("join.do")
	public ModelAndView join(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/join");

		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}
	
	@RequestMapping(value="joinUpdate.do", method=RequestMethod.POST)
	public ModelAndView joinUpdate(@ModelAttribute MemberVO vo, HttpServletRequest request) throws Exception{
		memberService.joinUpdate(vo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/main");
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}

	
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, HttpServletRequest request) throws Exception{
		memberService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/main");
		mav.addObject("msg", "logout");
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}
}
