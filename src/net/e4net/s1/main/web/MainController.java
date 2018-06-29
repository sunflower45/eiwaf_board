package net.e4net.s1.main.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.e4net.eiwaf.common.Status;
import net.e4net.eiwaf.service.resource.RequestProperty;
import net.e4net.eiwaf.web.RequestContext;
import net.e4net.eiwaf.web.handler.RuntimeRequestContext;
import net.e4net.eiwaf.web.handler.WebHandlerUtil;
import net.e4net.eiwaf.web.util.WebUtil;
import net.e4net.s1.comn.PublicController;
import net.e4net.s1.comn.TestUserEtt;
import net.e4net.s1.main.service.MainService;
import net.e4net.s1.main.vo.LoginPVO;
import net.e4net.s1.main.vo.LoginDVO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * 로그인 컨트롤러.
 * @author E4NET
 * @version 1.0
 */
@RequestProperty(title = "로그인", layout = "main")
@Controller
public class MainController extends PublicController {

	private static final long serialVersionUID = 2525244630168443366L;
    
	@Resource(name = "MainService")
	private MainService mainService;

	/**
	 * 로그인화면
	 * @param request
	 * @param requestContext
	 * @return
	 * @throws Exception
	 */
	@RequestProperty(title = "로그인화면")
	@RequestMapping("/main/intro.do")
	public ModelAndView intro(HttpServletRequest request,
			RequestContext requestContext) throws Exception {
		ModelAndView mav = new ModelAndView();

		if (requestContext.isLogin()) {
			mav.setViewName("redirect:/main/main.do");
		} else {
			mav.setViewName("main/intro");
		}

		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}

    
	/**
	 * 로그인 처리.
	 * @param request
	 * @param requestContext
	 * @param loginPVO 로그인 VO
	 * @return
	 * @throws Exception
	 */
	@RequestProperty(title = "로그인")
	@RequestMapping("/main/login.do")
	public ModelAndView login(HttpServletRequest request,
			RuntimeRequestContext requestContext,
			@ModelAttribute("loginPVO") LoginPVO loginPVO) throws Exception {

		ModelAndView mav = new ModelAndView("jsonView");

		Status status = new Status();

		LoginDVO loginDVO = mainService.selectLogin(loginPVO);

		if (loginDVO == null) {
			status.fail("MAIN0001"); // 등록된 사용자가 아닙니다. 관리자에게 문의 바랍니다.
			return super.getFailModelAndView(mav, status);
		}

		// USER_STATUS => 00:비회원, 10:정상회원, 31:패스워드5회오류, 90:사용정지회원
		String userStatus = loginDVO.getUser_status();
		if (!"10".equals(userStatus)) {
			if ("31".equals(userStatus)) {
				status.fail("MAIN0052"); // 패스워드 5회 이상 입력 오류입니다. 관리자에게 문의 바랍니다.
			} else {
				status.fail("MAIN0002"); // 사이트 접근권한이 없습니다. 관리자에게 문의 바랍니다.
			}
			return getFailModelAndView(mav, status);
		}

		loginDVO.setLogin_ip(requestContext.getClientIp());

		int pwdFailCnt = loginDVO.getFail_count();
		String dbPwd = loginDVO.getLogin_passwd();
		String pmPwd = loginPVO.getLogin_passwd();
		if (pmPwd == null || !pmPwd.equals(dbPwd)) {
			loginDVO.setFail_count(++pwdFailCnt);
			if (pwdFailCnt < 5) {
				status.fail("MAIN0051", pwdFailCnt); // 입력하신 패스워드가 {0}회 일치하지 않습니다.<br/>확인 후 이용하여 주십시오.
			} else {
				loginDVO.setUser_status("31");
				status.fail("MAIN0052"); // 패스워드 5회 이상 입력 오류입니다. 관리자에게 문의 바랍니다.
			}

			mainService.updateLogin(loginDVO);

			return getFailModelAndView(mav, status);
		}

		loginDVO.setFail_count(0);
		loginDVO.setUser_status("10");

		mainService.updateLogin(loginDVO);

		TestUserEtt userEtt = new TestUserEtt(loginDVO.getUser_id());
		userEtt.setName(loginDVO.getName());
		userEtt.setGrpCl(loginDVO.getGrp_cl());
		userEtt.setLogin(true);

		WebHandlerUtil.setSessionOuterUserEntity(request, requestContext, userEtt);

		return getOkModelAndView(mav);
	}

	/**
	 * 로그아웃
	 * @param request
	 * @param requestContext
	 * @return
	 * @throws Exception
	 */
	@RequestProperty(title = "로그아웃")
	@RequestMapping("/main/logout.do")
	public ModelAndView logout(HttpServletRequest request,
			RuntimeRequestContext requestContext) throws Exception {

		WebHandlerUtil.setSessionOuterUserEntity(request, requestContext, null);

		return getOkModelAndView("redirect:/");
	}

}