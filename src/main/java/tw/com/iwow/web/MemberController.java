package tw.com.iwow.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.iwow.entity.Member;
import tw.com.iwow.service.MemberService;

@Controller
@RequestMapping(value="/iwow/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
//	@RequestMapping(value="/edit")
//	public String editPage(Model model, Member form){
//		Long id = form.getId();
//		Member member = memberService.findById(id);
//		model.addAttribute("member",member);
//		return "iwow/setting_profile";
//	}
	
	@RequestMapping(value="/getByEmail")
	public String getdByEmailPage(Model model, Member form){
		String email = form.getEmail();
		System.out.println(email);
		Member member = memberService.getByEmail(email);
		model.addAttribute("member",member);
		return "iwow/setting_profile";
	}
	
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
