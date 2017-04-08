package tw.com.iwow.service;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.iwow.dao.GroupDao;
import tw.com.iwow.entity.Group;

@Service
public class GroupService {
	
	@Autowired GroupDao groupDao;
	@Autowired MemberService memberService;
	
	public Group create(Group group){
		return groupDao.save(group);
	}
	
	public void delete(Long id){
		 groupDao.delete(id);
	}
	public Group getByName(String name){
		return groupDao.findByName(name);
	}
	
	public Set<Group> getById(Long memid){
		return memberService.findById(memid).getGroups();		
	}
	
	
	
	
}
