package tw.com.iwow.service;

import static org.junit.Assert.fail;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.iwow.dao.MemberDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/spring-context.xml"})
public class MemberServiceTest {
//	@Autowired
//	private MemberService memberService;
	
	@Autowired
	private MemberDao memberDao;

	@Test
	public void testFindAll() {
		try {
			
			memberDao.findAll();
			//memberService.findById(new Long(1));
			//memberService.findByMember("QQ");

		} catch (Exception e) {		
			fail("Not yet implemented");
			
		}
	
	}

}



