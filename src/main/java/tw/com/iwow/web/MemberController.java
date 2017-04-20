package tw.com.iwow.web;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.annotation.JsonView;

import tw.com.iwow.dao.RoleDao;
import tw.com.iwow.entity.Member;
import tw.com.iwow.entity.Picture;
import tw.com.iwow.entity.Role;
import tw.com.iwow.service.MemberService;
import tw.com.iwow.service.PictureService;
import tw.com.iwow.web.jsonview.Views;


@Controller
@RequestMapping(value="/iwow/member")
@SessionAttributes(names={"correctMsg"})
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private PictureService pictureService;
	@Autowired
	private RoleDao roleDao;
	
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
	
	@RequestMapping(method = RequestMethod.GET, produces = { "application/json" }, value = "/user_profile")
	@JsonView(Views.UserDetails.class)
	@ResponseBody
	public Member userProfile(){
		return memberService.getByUser();
	}
	
	@RequestMapping(value="/edit")
	 public String editPage(Model model, Member form){
		String email = form.getEmail(); //取得使用者輸入的email(securrity的username)
		Member member = memberService.getByEmail(email); //從資料庫內抓取該email的資料
	 	model.addAttribute("editMember",member);
	 	return "iwow/member/memberEdit";
	 }
		
	@RequestMapping(value="/insert")
	public String insert(Member member,BindingResult bindingResult, Model model,String birth){
		
		DateTimeFormatter dtf =  DateTimeFormatter.ofPattern("MM/dd/yyyy");
		LocalDate ld=LocalDate.parse(birth, dtf);				
		LocalDateTime ldt = LocalDateTime.of(ld, LocalTime.MIN);
		member.setBirth(ldt);
		Set<Role> roles =member.getRoles();
		roles.add(roleDao.findOne(new Long(1)));
		member.setRoles(roles);
		Member tempMen = memberService.insert(member);
		if(tempMen == null){
			Map<String,String> errorMsg = new HashMap<String,String>();
			errorMsg.put("error", "error");
			model.addAttribute("errorMsg",errorMsg); //signup頁面的javascript可抓這裡的資訊判斷是否註冊失敗
			return "/iwow/signup";
		} 

		Map<String,String> correctMsg = new HashMap<String,String>(); 
		correctMsg.put("correct", "correct");
		model.addAttribute("correctMsg",correctMsg);  //index_user頁面的javascript可抓這裡的資訊判斷是否註冊成功
		
		return "redirect:/iwow/index_user";
	}
	
	@RequestMapping(value="/update")
	public String update(Member member){
		Member mem = memberService.findById(member.getId());
		memberService.update(mem);
		return "redirect:/iwow/index_user";
	}
	
	// CollectionList頁面
		@RequestMapping("/collectionlist")
		public String collectionListPage( Model model) {
			String currentPrincipalName = SecurityContextHolder.getContext().getAuthentication().getName();
			Long Id = memberService.getByEmail(currentPrincipalName).getId();
			Member member = memberService.findById(Id);
			Set<Picture> collectionList = member.getPicColls();
			model.addAttribute("collectionList", collectionList);
			model.addAttribute("member", member);
			return "/iwow/member/collectionIndex";
		}

		// insert Collection
		@RequestMapping("/collect/picture/{picId}")
		@ResponseBody
		public Boolean collectionListInsert(@PathVariable Long picId, Model model) {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();		
			Long Id = memberService.getByEmail(authentication.getName()).getId();
			Member member = memberService.findById(Id);
			Picture picture = pictureService.getById(picId);
			Set<Picture> pictures = member.getPicColls();
			if (pictures.contains(picture)) {
				return false;
			}
			member.addPicColl(picture);
			memberService.update(member);
			return true;
		}

		// delete Collection
		@RequestMapping(value="/collect/picture/delete",method = RequestMethod.GET)
		@ResponseBody
		public Boolean collectionListDelete(@RequestParam("picId") Long picId,Model model) {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();		
			Long Id = memberService.getByEmail(authentication.getName()).getId();
			Member member = memberService.findById(Id);
			Set<Picture> pictures = member.getPicColls();
			Picture picture = pictureService.getById(picId);
			if (pictures.contains(picture)) {
				member.removePicColl(picture);
				memberService.update(member);			
			}
			return true;
		}

		
}
