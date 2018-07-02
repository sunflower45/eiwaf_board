package net.e4net.s1.board.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping("loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute MemberVO vo, HttpSession session, HttpServletRequest request) throws Exception {
		String name = memberService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		
		if(name != null) {
			MemberVO vo2 = memberService.viewMember(vo);
			mav.setViewName("main/home");
			mav.addObject("msg", "success");
			mav.addObject("memberId", vo2.getMemberId());
			mav.addObject("memberName", vo2.getMemberName());
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
	
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, HttpServletRequest request) throws Exception{
		memberService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/home");
		mav.addObject("msg", "logout");
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}
}
