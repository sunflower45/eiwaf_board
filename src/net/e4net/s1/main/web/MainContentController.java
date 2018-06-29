package net.e4net.s1.main.web;

import javax.servlet.http.HttpServletRequest;

import net.e4net.eiwaf.common.Status;
import net.e4net.eiwaf.service.resource.RequestProperty;
import net.e4net.eiwaf.web.RequestContext;
import net.e4net.eiwaf.web.util.WebUtil;
import net.e4net.s1.comn.LoginController;
import net.e4net.s1.comn.TestUserEtt;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 메인 컨트롤러.
 * @author E4NET
 * @version 1.0
 */
@RequestProperty(title = "메인", layout = "empty")
@Controller
public class MainContentController extends LoginController {

	private static final long serialVersionUID = 2525244630168443366L;

	/**
	 * 메인화면
	 * @param request
	 * @param requestContext
	 * @return
	 * @throws Exception
	 */
	@RequestProperty(title = "메인화면", layout="main")
	@RequestMapping("/main/main.do")
	public ModelAndView main(HttpServletRequest request,
			RequestContext requestContext) throws Exception {
		ModelAndView mav = new ModelAndView("main/main");

		TestUserEtt userEtt = requestContext.getUserEntity();

		mav.addObject("userId", userEtt.getUserId());
		mav.addObject("userNm", userEtt.getName());
		mav.addObject("grpCl", userEtt.getGrpCl());
		mav.addObject("clientIp", requestContext.getClientIp());

		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}

	/**
	 * 메인서브화면
	 * @param request
	 * @param requestContext
	 * @return
	 * @throws Exception
	 */
	@RequestProperty(title = "메인서브화면")
	@RequestMapping("/main/mainContent.do")
	public ModelAndView mainContent(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("main/mainContent");

		return getOkModelAndView(mav);
	}
}