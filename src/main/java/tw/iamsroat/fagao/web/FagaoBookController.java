package tw.iamsroat.fagao.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/fagao/iwowwow")
public class FagaoBookController {
 	
 	//iwowwow
	@RequestMapping(value="/index")
	public String indexPage(){
		return "fagao/iwowwow/index";
	}
	
	@RequestMapping(value="/photo")
	public String photoPage(){
		return "fagao/iwowwow/photo";
	}
 }
