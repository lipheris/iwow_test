package tw.com.iwow.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/iwow/member/group")
public class GroupController {
	@RequestMapping
	public String createGroup(){
		return "";
	}
}
