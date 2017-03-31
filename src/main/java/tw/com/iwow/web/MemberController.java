package tw.com.iwow.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.iwow.entity.Member;
import tw.com.iwow.service.MemberService;

@Controller
@RequestMapping(value="/iwow")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/insert")
	public String insert(Member member){
		memberService.insert(member);
		return "redirect:/iwow/index_user";
	}
	
	@RequestMapping(value="/update")
	public String update(Member member){
		memberService.update(member);
		return "redirect:/iwow/index_user";
	}
}
