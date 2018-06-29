package net.e4net.s1.main.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import net.e4net.eiwaf.common.Status;
import net.e4net.eiwaf.web.RequestContext;
import net.e4net.eiwaf.web.util.WebUtil;
import net.e4net.s1.comn.PublicController;
  
@Controller
@RequestMapping("/board/*")
public class BoardController extends PublicController {
  
    @RequestMapping("/list.do")
	public ModelAndView hello(HttpServletRequest request,RequestContext requestContext) throws Exception {
    	
    	ModelAndView mav = new ModelAndView();

		mav.setViewName("board/list");
		

		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}
}
