package iwow_test;

import java.time.LocalDateTime;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import tw.com.iwow.entity.PicsDescription;
import tw.com.iwow.entity.Picture;
import tw.com.iwow.entity.Report;
import tw.com.iwow.service.PictureService;
import tw.com.iwow.service.ReportService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/spring-context.xml"})
@Transactional //有才可rollback 不會動到db
public class PaiPictureServiceTest {
	@Autowired
	private PictureService pictureService;
	@Autowired
	private ReportService reportService;
	
//	@Test
//	public void testReportInsert() {	
//		Report report=new Report();
//		Picture picture=new Picture();
//		picture.setId(new Long(158));
//		report.setDesc("test");
//		report.setDate(LocalDateTime.now());
//		report.setState(false);
//		report.setPicture(picture);
//		
//		reportService.insertTest(report, picture);		
//	}
//	@Test
//	public void testReportInsert() {	
//		Report report=new Report();
//		Picture picture=new Picture();
//		picture.setId(new Long(158));
//		report.setDesc("test");
//		report.setDate(LocalDateTime.now());
//		report.setState(false);
//		report.setPicture(picture);
//		reportService.insert(report);		
//	}
	
//	@Test
//	public void testGetDec() {	
//		PicsDescription picsDescription=new PicsDescription();
//		Picture picture=new Picture();
//		picture.setId(new Long(158));
//		picsDescription.setNote("test");//set into 內容
//	 	picsDescription.setPicture(picture);
//	 	picsDescription.setMemId(new Long(456));
//		pictureService.insertText(picsDescription);
//	}
	
//	@Test
//	public void testGetDec2() {	
//		Picture picture =pictureService.getById(new Long(158));
//		
//		
//		pictureService.getbyPicIdSort(picture, new Sort(Direction.DESC,"id"));
//	}
	@Test
	public void testDelete(){
		pictureService.deleteText(new Long(79));
//		reportService.delete(new Long(14));
	}

}
