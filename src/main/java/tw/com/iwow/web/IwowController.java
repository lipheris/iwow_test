package tw.com.iwow.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IwowController {
 	
 	//iwowwow
	@RequestMapping(value="/iwow/index")
	public String indexPage(){
		return "iwow/index";
	}
	
	@RequestMapping(value="/iwow/picture")
	public String picturePage(){
		return "iwow/picture";
	}
	
	@RequestMapping(value="/iwow/login")
	public String loginPage(){
		return "iwow/index_user";
	}
	
	@RequestMapping(value="/iwow/index_user")
	public String index_userPage(){
		return "iwow/index_user";
	}
	
	@RequestMapping(value="/iwow/user")
	public String userPage(){
		return "iwow/user";
	}
	
	@RequestMapping(value="/iwow/search")
	public String searchPage(){
		return "iwow/search";
	}
	
	@RequestMapping(value="/iwow/upload")
	public String uploadPage(){
		return "iwow/upload";
	}
	
	@RequestMapping(value="/iwow/report")
	public String reportPage(){
		return "iwow/report";
	}
 }
