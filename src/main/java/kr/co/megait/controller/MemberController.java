package kr.co.megait.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	/**
	 * 첫번째 메인홈
	 * @param request
	 * @param response
	 * @return
	 */
	
	@RequestMapping(value = "/member_list", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView MemberDefault(HttpServletRequest request, HttpServletResponse respone) {
		ModelAndView mv = new ModelAndView("/Member/member_list");
		return mv;
		
	}
	
	/**
	 * 메인으로 이동
	 * @param request
	 * @param response
	 * @return
	 */
	
	@RequestMapping(value = "/main_index", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView MainIndexDefault(HttpServletRequest request, HttpServletResponse respone) {
		ModelAndView mv = new ModelAndView("/main_index");
		return mv;
		
	}
	
	
	/**
	 * 회원가입 페이지 이동
	 * @param request
	 * @param response
	 * @return
	 */
	
	@RequestMapping(value = "/member_write", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView MemberWriteDefault(HttpServletRequest request, HttpServletResponse respone) {
		ModelAndView mv = new ModelAndView("/Member/member_write");
		return mv;
		
	}
	
	/**
	 * 회원 가입 완료
	 * @param request
	 * @param response
	 * @return
	 */
	
	@RequestMapping(value = "/member_write_ok", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView MemberWriteOk(HttpServletRequest request, HttpServletResponse respone) {
		ModelAndView mv = new ModelAndView("/Member/member_list");
		return mv;
		
	}
	
	
}
