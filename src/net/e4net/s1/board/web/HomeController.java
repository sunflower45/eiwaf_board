package net.e4net.s1.board.web;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.e4net.eiwaf.common.Status;
import net.e4net.eiwaf.web.util.WebUtil;
import net.e4net.s1.comn.PublicController;

@Controller
@RequestMapping("/*")
public class HomeController extends PublicController{

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	@Resource(name="uploadPath")
    String uploadPath;
	
	
	@RequestMapping("/main.do")
	public ModelAndView main(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/main");
		mav.addObject("msg", "홈페이지 방문을 환영합니다.");
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}
	
	@RequestMapping("/test.do")
	public ModelAndView test(HttpServletRequest request)throws Exception{
		ModelAndView mav = new ModelAndView("main/test");
		Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}
	
	@RequestMapping(value="upload.do", method=RequestMethod.POST)
	public ModelAndView uploadForm(@RequestParam MultipartFile file, @RequestParam String name , HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
        logger.info("파일이름 :"+file.getOriginalFilename());
        logger.info("파일크기 : "+file.getSize());
        logger.info("컨텐트 타입 : "+file.getContentType());

        String savedName = file.getOriginalFilename();
        File target = new File(uploadPath, savedName);
        // 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
        // FileCopyUtils.copy(바이트배열, 파일객체)
        FileCopyUtils.copy(file.getBytes(), target);
        mav.setViewName("main/uploadResult");
        mav.addObject("savedName", savedName);
        mav.addObject("name", name);
        Status status = WebUtil.getAttributeStatus(request);
		if (status.isOk()) {
			return getOkModelAndView(mav, status);
		} else {
			return getFailModelAndView(mav, status);
		}
	}
}
