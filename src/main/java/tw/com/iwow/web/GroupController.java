package tw.com.iwow.web;

import java.util.Collection;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	/*找全部Group*/
	@RequestMapping(method = RequestMethod.GET,produces={"application/json"})
	@JsonView(Views.ShowGroups.class)
	@ResponseBody
	public Collection<Group> listGroups(){		
		return groupService.findAll();
	}
	
	/*找個人所有Group*/
	@RequestMapping(method = RequestMethod.GET,produces={"application/json"},value="/find_groups")
	@JsonView(Views.ShowGroups.class)
	@ResponseBody
	public Set<Group> personGroups(){
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();		
		Long memid = memberService.getByEmail(authentication.getName()).getId();			
		return groupService.getById(memid);
	}
	
	/*找Group所有人*/
	@RequestMapping(method = RequestMethod.GET,produces={"application/json"},value="/find_members")
	@JsonView(Views.ShowGroups.class)
	@ResponseBody
	public Set<Member> groupPersons(@RequestParam(value="name",required = false) String name){
		Group result =groupService.getByName(name);
		return result.getMembers();
	}

	/*找單一Group*/
	@JsonView(Views.ShowGroups.class)
	@RequestMapping(method = RequestMethod.GET, produces = { "application/json" }, value = "/{name}")
	@ResponseBody
	public Group findGroup(@PathVariable(value = "name") String name) {
		Group result = groupService.getByName(name);
		if (result == null)
			return null;
		else
			return result;
	}
	
	/*找個人所有Group by REST*/
	@JsonView(Views.ShowGroups.class)
	@RequestMapping(method = RequestMethod.GET, produces = { "application/json" }, value = "/member/{id}")
	@ResponseBody
	public Set<Group> findPersonGroup(@PathVariable(value = "id") Long memid) {
		Set<Group> result = groupService.getById(memid);
		if (result == null)
			return null;
		else
			return result;
	}
		
	@RequestMapping(value="/index")
	public String indexPage(){	
		return "/iwow/group/groupIndex";
	}
	
	/*Group 關鍵字搜尋*/
	@JsonView(Views.ShowGroups.class)
	@RequestMapping(method = RequestMethod.GET,produces = { "application/json" },value="/search")
	@ResponseBody
	public Set<Group> search(@RequestParam(value="ctx",required = false) String param){			
		return groupService.search("ctx");
	}
	
	@RequestMapping(value="/add")
	public String addGroup(){	
		return "/iwow/group/groupAdd";
	}
	
	/*Group新增(包含創建者)*/
	@RequestMapping(value="/create",method = RequestMethod.GET)
	@ResponseBody
	public Boolean createGroup(Group group){		
		Group temp = groupService.getByName(group.getName());
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();		
		if(temp==null){
			Member member=memberService.getByEmail(authentication.getName());		
			Group groupNew=groupService.create(group);
			groupNew.setMemid(member.getId());
			groupNew.addMember(member);
			groupService.update(groupNew);
			return true;
		}
		return false;
	}		//return "/iwow/group/groupIndex";
		
	/*Group新增會員*/
	@RequestMapping(value="/update",method = RequestMethod.GET)
	@ResponseBody
	public Boolean addMember(@RequestParam(value="name",required = false) String name){		
		Group temp = groupService.getByName(name);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();		
		if(temp!=null){
			Member member=memberService.getByEmail(authentication.getName());							
			temp.addMember(member);
			groupService.update(temp);
			return true;
		}
		return false;
	}
	
	/*Group刪除會員*/
	@RequestMapping(value="/exit",method=RequestMethod.GET)
	@ResponseBody
	public Boolean removeMember(@RequestParam(value="name",required = false) String name){
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();		
		Member member = memberService.getByEmail(authentication.getName());
		Group temp = groupService.getByName(name);
		if(temp!=null){
			temp.removeMember(member);
			groupService.update(temp);
			return true;
		}
		return false;
	}
	
	/*Group刪除*/
	@RequestMapping(method=RequestMethod.DELETE, value="/{name}")
	public void deletePicture(@PathVariable("name") String name){
		groupService.delete(name);
	}	

	
}
