package iwow_test;

import static org.junit.Assert.fail;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import tw.com.iwow.service.PictureService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/spring-context.xml"})
public class PictureServiceTest {

	@Autowired
	private PictureService pictureService;
	
	@Test
	public void testFindAll() {
		
		pictureService.findAll();
				
	}

}
