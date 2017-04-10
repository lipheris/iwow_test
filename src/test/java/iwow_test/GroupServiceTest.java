package iwow_test;

import java.util.HashSet;
import java.util.Set;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import tw.com.iwow.dao.GroupDao;
import tw.com.iwow.dao.MemberDao;
import tw.com.iwow.entity.Group;
import tw.com.iwow.entity.Member;
import tw.com.iwow.service.GroupService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/spring-context.xml"})
@Transactional
public class GroupServiceTest {
	
	@Autowired
	public GroupDao groupDao;
	@Autowired
	public GroupService groupService;
	@Autowired
	public MemberDao memberDao;
	
	@Test
	public void test() {
		Group group = new Group();
		group.setName("cat");
		groupDao.save(group);	
//		Group group2=groupDao.findByName("cat");
//		assertEquals(group, group2);
		
		Set<Group> groups = new  HashSet<Group>();
		Group group2 =new Group();
		group2.setName("animal");
		groupDao.save(group2);
		groups.add(group);
		groups.add(group2);
		Set<Member> members = new HashSet<Member>();
		Member member = new Member();
		member.setGroups(groups);
		member.setName("Qq");
		memberDao.save(member);
		members.add(member);
		group2.setMembers(members);
//		Member member2 = new Member();
//		member2.setGroups(groups);
//		member2.setName("Kk");
//		memberService.insert(member2);
		System.out.println( groupService.getById(member.getId()));
		
	}
	

}
