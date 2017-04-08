package tw.com.iwow.service;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import tw.com.iwow.dao.GroupDao;
import tw.com.iwow.entity.Group;
import tw.com.iwow.entity.Member;

public class GroupService {
	@Autowired GroupDao groupDao;
	@Autowired MemberService memberService;
	
	public Group create(Group group){
		return groupDao.save(group);
	}
	
	public Set<Group> getById(Long id){
		return memberService.findById(id).getGroups();		
	}
}
