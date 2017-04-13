package tw.com.iwow.web;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonView;

import tw.com.iwow.entity.Group;
import tw.com.iwow.entity.Member;
import tw.com.iwow.service.GroupService;
import tw.com.iwow.service.MemberService;
import tw.com.iwow.web.jsonview.Views;

//@RestController
@Controller
@RequestMapping(value="/iwow/group")
public class GroupController {
	
	@Autowired
	public GroupService groupService;
	
	@Autowired
	public MemberService memberService;
	

	@RequestMapping(method = RequestMethod.GET,produces={"application/json"})
	@JsonView(Views.ShowGroups.class)
	@ResponseBody
	public Collection<Group> listGroups(){
		//Authentication authentication = SecurityContextHolder.getContext().getAuthentication();		
		//Long memid = memberService.getByEmail(authentication.getName()).getId();
		// model.addAttribute("groupList",groupService.getById(memid));		
		return groupService.findAll();
	}

	
	
	@RequestMapping(value="/search")
	public String search(){	
		return "/iwow/group/groupAdd";
	}
	
	@RequestMapping(value="/add")
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
			Group groupNew=groupService.create(group);
			groupNew.addMember(member);
			groupService.update(groupNew);
			return true;
		}
		return false;
	}		
		//return "/iwow/group/groupIndex";
	
	@RequestMapping(method=RequestMethod.DELETE, value="/{name}")
	public void deletePicture(@PathVariable("name") String name){
		groupService.delete(name);
	}	

	
}
