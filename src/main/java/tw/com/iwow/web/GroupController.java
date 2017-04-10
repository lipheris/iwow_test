package tw.com.iwow.web;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.com.iwow.entity.Group;
import tw.com.iwow.entity.Member;
import tw.com.iwow.service.GroupService;
import tw.com.iwow.service.MemberService;

@Controller
@RequestMapping(value="/iwow/group")
public class GroupController {
	
	@Autowired
	public GroupService groupService;
	
	@Autowired
	public MemberService memberService;
	
	@RequestMapping
	public String groupPage(Model model){
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();		
		Long memid = memberService.getByEmail(authentication.getName()).getId();
		model.addAttribute("groupList",groupService.getById(memid));
		return "/iwow/group/groupIndex";
	}
	
	@RequestMapping(value="/groupAdd")
	public String addGroup(){	
		return "/iwow/group/groupAdd";
	}
	
	@RequestMapping(value="/create",method = RequestMethod.GET)
	@ResponseBody
	public Boolean createGroup(Group group){
		Group temp = groupService.getByName(group.getName());
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(temp==null){
		Member member=memberService.getByEmail(authentication.getName());
		
		Group group2=groupService.create(group);
		Set<Member> members=group2.getMembers();
		if (members.contains(member)) {
			return false;
		}
		
		group2.addMember(member);
		groupService.update(group2);
		return true;
		}
		return false;
	}

		
		//return "/iwow/group/groupIndex";
	
	
//	@RequestMapping(value="")
//	public String deleteGroup(Long id){
//		groupService.delete(id);
//		return "";
//	}
}
