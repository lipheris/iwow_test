package tw.com.iwow.model.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/iwow")
public class IwowController {
 	
 	//iwowwow
	@RequestMapping(value="/index")
	public String indexPage(){
		return "iwow/index";
	}
	
	@RequestMapping(value="/picture")
	public String picturePage(){
		return "iwow/picture";
	}
	
	@RequestMapping(value="/login")
	public String loginPage(){
		return "iwow/login";
	}
 }
