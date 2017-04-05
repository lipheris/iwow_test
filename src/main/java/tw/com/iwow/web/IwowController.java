package tw.com.iwow.web;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import tw.com.iwow.entity.Picture;
import tw.com.iwow.service.PictureService;

@Controller
public class IwowController {
	
	
	private PictureService picService;
	// iwowwow
	@RequestMapping(value = "/iwow/index")
	public String indexPage() {
		return "iwow/index";
	}

	@RequestMapping(value = "/iwow/picture")
	public String picturePage() {
		return "iwow/picture";
	}
	
	@RequestMapping(value = "/iwow/login")
	public String loginPage() {
		return "iwow/index_user";
	}

	@RequestMapping(value = "/iwow/index_user")
	public String index_userPage() {
		return "iwow/index_user";
	}

	@RequestMapping(value = "/iwow/user")
	public String userPage() {
		return "iwow/user";
	}

	@RequestMapping(value = "/iwow/search", method = RequestMethod.GET)
	public String searchPage(@RequestParam(value="searchContext")String param, Model model) {
		if(param.isEmpty()||param==null)
			return "iwow/index";
		
		return "iwow/search";
	}

	@RequestMapping(value = "/iwow/upload")
	public String uploadPage() {
		return "iwow/upload";
	}

	@RequestMapping(value = "/iwow/report")
	public String reportPage() {
		return "iwow/report";
	}

	@RequestMapping(value = "/iwow/signup")
	public String signupPage() {
		return "iwow/signup";
	}

	@RequestMapping(value = "/iwow/setting_profile")
	public String setting_profilePage() {
		return "iwow/setting_profile";
	}

	/*-------------------for 403 access denied page----------------*/
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String accesssDenied(Model model) {
		// check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);

			model.addAttribute("username", userDetail.getUsername());

		}
		return "/iwow/403";

	}

	@RequestMapping(value = "/iwow/admin", method = RequestMethod.GET)
	public String adminPage(Model model) {

		model.addAttribute("title", "Spring Security Login Form - Database Authentication");
		model.addAttribute("message", "This page is for ROLE_ADMIN only!");
		return "/iwow/admin";

	}

	@RequestMapping(value = "/iwow/test")
	public String test() {
		return "iwow/test";

	}
	
}
