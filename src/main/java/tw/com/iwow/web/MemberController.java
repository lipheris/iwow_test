package tw.com.iwow.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.com.iwow.entity.Member;
import tw.com.iwow.service.MemberService;

@RequestMapping(value="/iwow/member")
@Controller
@SessionAttributes(names={"correctMsg"})
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/checkUserEmail")
	@ResponseBody
	public String checkUserEmail(Member form){
		String UserEmail = form.getEmail(); //取得使用者輸入的Email	
		if(UserEmail != null && UserEmail.trim().length() != 0){ //檢查使用者輸入的Email不為null與空白
			Member member = memberService.getByEmail(UserEmail); //測試使用者輸入的email是否可抓取資料庫內的資料
			if(member == null){ //如果member為null代表資料庫內沒該筆email，帳號可註冊
				return "帳號不存在";	
			} else {
				return "帳號已存在";
			}//如果member不為null代表資料庫內有該筆email的資料，帳號不可註冊				
		}
		return null;
	}
	
	@RequestMapping(value="/edit")
	 public String editPage(Model model, Member form){
		String email = form.getEmail(); //取得使用者輸入的email(securrity的username)
		Member member = memberService.getByEmail(email); //從資料庫內抓取該email的資料
	 	model.addAttribute("editMember",member);
	 	return "iwow/setting_profile";
	 }
		
	@RequestMapping(value="/insert")
	public String insert(Member member, Model model){
		
		Member tempMen = memberService.insert(member);
		
		if(tempMen == null){
			Map<String,String> errorMsg = new HashMap<String,String>();
			errorMsg.put("error", "error");
			model.addAttribute("errorMsg",errorMsg);
			return "/iwow/signup";
		} 

		Map<String,String> correctMsg = new HashMap<String,String>(); 
		correctMsg.put("correct", "correct");
		model.addAttribute("correctMsg",correctMsg);
		
		return "redirect:/iwow/index_user";
	}
	
	@RequestMapping(value="/update")
	public String update(Member member){
		Member mem=memberService.findById(member.getId());
		memberService.update(member);
		return "redirect:/iwow/index_user";
	}
}
