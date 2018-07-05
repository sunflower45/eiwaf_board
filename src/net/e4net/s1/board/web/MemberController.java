package net.e4net.s1.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping(value="test.do")
	public ModelAndView test(@RequestBody String id, HttpServletRequest request) throws Exception {
		System.out.println("********controller 1*********");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/test");
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}
	
	@RequestMapping(value="ajax.do", method=RequestMethod.POST)
	public ModelAndView ajax(HttpServletRequest request) throws Exception {
		System.out.println("******controller 2*******");
//		ResponseEntity<String> entity = null;
		String msg = request.getParameter("id");
//		entity = new ResponseEntity<String>(msg, HttpStatus.OK);
//		return entity;
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("id", msg);
		mav.setViewName("jsonView");
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
		mav.setViewName("/board/find");
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}
	
	@ResponseBody
	@RequestMapping(value="findId.do", method=RequestMethod.POST)
	public ModelAndView findId(@RequestBody MemberVO vo, HttpServletResponse response, HttpServletRequest request)throws Exception {
		System.out.println("******controller in **********");
		String idList = memberService.findId(vo); 
		System.out.println("idList : "+idList);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/find");
		mav.addObject("memberId", idList);
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}	}
	
	@RequestMapping(value="findPw.do", method=RequestMethod.POST)
	public ModelAndView findPw(@ModelAttribute MemberVO vo, HttpServletRequest request) throws Exception {
		String pwList = memberService.findPw(vo);
		ModelAndView mav = new ModelAndView();
		if(pwList != null) {
			mav.setViewName("board/find");
			mav.addObject("memberPw", pwList);
			
		} else {
			mav.setViewName("board/find");
			mav.addObject("memberPw", null);
		}
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
