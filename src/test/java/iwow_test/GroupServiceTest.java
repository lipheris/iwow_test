package iwow_test;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import tw.com.iwow.dao.GroupDao;
import tw.com.iwow.entity.Group;
import tw.com.iwow.service.GroupService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/spring-context.xml"})
@Transactional
public class GroupServiceTest {
	
	@Autowired
	public GroupDao groupDao;
	@Autowired
	public GroupService groupService;
	
	@Test
	public void test() {
		Group group = new Group();
		group.setName("cat");
		
		groupDao.save(new Group());
		Group group2=groupDao.findByName("cat");
		assertEquals(group, group2);
		
		
	}

}
