package tw.com.iwow.web;

import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import tw.com.iwow.entity.Picture;
import tw.com.iwow.entity.Tag;
import tw.com.iwow.service.PictureService;
import tw.com.iwow.service.TagService;

@Controller
public class IwowController {

	@Autowired
	private PictureService picService;
	@Autowired
	private TagService tagservice;

	// iwowwow
	@RequestMapping(value = "/iwow/index")
	public String indexPage(Model model) {
		Collection<Picture> pictures = picService.findAll();
		model.addAttribute("pictureList", pictures);
		return "iwow/index";
	}

	/* 登出後重新導向登入頁面 */
	@RequestMapping(value = "/iwow/login")
	public String loginPage() {
		return "redirect:index";
	}

	@RequestMapping(value = "/iwow/member")
	public String userPage() {
		return "iwow/member";
	}

	@RequestMapping(value = "/iwow/search", method = RequestMethod.GET)
	public String searchPage(@RequestParam(value = "ctx") String param, Model model) {
		if (param.isEmpty() || param == null)
			return null;
		Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().serializeNulls()
				.setDateFormat("yyyy-MM-dd HH:mm:ss:SSS").create();
		model.addAttribute("result", gson.toJson(picService.search(param)));
		return "/iwow/picture/search";
	}

	@RequestMapping(value = "/iwow/report")
	public String reportPage() {
		return "iwow/report";
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

	/*--------------------- 以下合併或待修改------------------------ */
	
	/*馬哥首頁未完成*/
	@RequestMapping(method = RequestMethod.GET, value = "/iwow/picture")
	public String picturePage(@RequestParam(value = "id", required = false, defaultValue = "-1") Long id, Model model) {
		if (id == -1l) {
			return indexPage(model);
		}
		model.addAttribute("picId", id);
		return "iwow/picture";
	}
	
	/*發糕未完成*/
	@RequestMapping(value = "/iwow/signup")
	public String signupPage() {
		return "iwow/signup";
	}
	
	@RequestMapping(value = "/iwow/index_user")
	public String index_userPage() {
		return "iwow/old/index_user";
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

	@RequestMapping(value = "/iwow/collectionlist")
	public String collectionlist() {
		return "iwow/collectionlist";
	}

}
