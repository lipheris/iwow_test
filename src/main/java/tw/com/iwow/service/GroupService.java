package tw.com.iwow.service;

import java.util.Collection;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.iwow.dao.GroupDao;
import tw.com.iwow.entity.Group;

@Service
public class GroupService {
	
	@Autowired GroupDao groupDao;
	@Autowired MemberService memberService;
	
	public Group create(Group group){
		return groupDao.save(group);
	}
	
	public void delete(String name){
		Long id = groupDao.findByName(name).getId();
		groupDao.delete(id);
	}
	public Set<Group> search(String name){
		return groupDao.search(name);
	}
	public Group getByName(String name){
		return groupDao.findByName(name);
	}
	
	public Set<Group> getById(Long memid){
		return memberService.findById(memid).getGroups();		
	}
	
	public Collection<Group> findAll(){
		return groupDao.findAll();
	}
	
	@Transactional
	public Group update(Group group){
		Group temp=groupDao.findOne(group.getId());		
		temp.setMembers(group.getMembers());		
		return temp;
	}
	
	
	
	
}
