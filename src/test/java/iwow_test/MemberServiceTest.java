package iwow_test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import tw.com.iwow.dao.MemberDao;
import tw.com.iwow.entity.Member;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/spring-context.xml"})
@Transactional //有才可rollback 不會動到db
public class MemberServiceTest {
//	@Autowired
//	private MemberService memberService;
	
	@Autowired
	private MemberDao memberDao;

	@Test
//	@Rollback
	public void testFindAll() {
//		Member member =new Member();
//		member.setEmail("QQ");
//			memberDao.save(member);
//			memberDao.findAll();
//			memberDao.delete(new Long(18));
			memberDao.findByEmail("123");
			//memberService.findById(new Long(1));
			//memberService.findByMember("QQ");

		
	
	}

}



