package tw.com.iwow.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/")
public class LoginController {
	
	@RequestMapping(value = "/login")
	public String login(){
		return "/iwow/login";
	}
		
	@RequestMapping(value="/logout") 
	public String logoutPage(){
		return "/iwow/login"; 
	}
	
//	@RequestMapping(value = "/signup")
//	public String signup(){
//		return "/iwow/signup";
//	}
	
	/*------------------錯誤顯示--------------------------*/
	
	@RequestMapping(value = "/login",method=RequestMethod.GET)
	public String login(HttpServletRequest req,
			@RequestParam(value="error",required=false) String error,
			@RequestParam(value="logout",required=false) String logout
			) {
		if(error!=null){
			req.setAttribute("error", "帳號密碼錯誤");
		}
		if(logout!=null){
			req.setAttribute("msg", "成功登出!!");
		}
		return "/iwow/login";
	}

}
