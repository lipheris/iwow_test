package tw.com.iwow.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.iwow.entity.Group;
import tw.com.iwow.service.GroupService;

@Controller
@RequestMapping(value="/iwow/member/group")
public class GroupController {
	
	@Autowired
	public GroupService groupService;
	
	@RequestMapping(value="/create")
	public String createGroup(Group group){
		groupService.create(group);
		return "/iwow/member/group";
	}
	
	@RequestMapping(value="")
	public String deleteGroup(Long id){
		groupService.delete(id);
		return "";
	}
}
