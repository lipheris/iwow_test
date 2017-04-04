package iwow_test;

import static org.junit.Assert.assertEquals;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.method.P;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import tw.com.iwow.dao.MemberDao;
import tw.com.iwow.dao.PictureDao;
import tw.com.iwow.entity.Member;
import tw.com.iwow.entity.Picture;
import tw.com.iwow.entity.Tag;
import tw.com.iwow.enums.Visibility;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/spring-context.xml"})
@Transactional
public class PicDaoTest {
	@Autowired
	private PictureDao picDao;
	@Autowired
	private MemberDao memDao;
//	@Test
//	public void testLoadClass() {
//		Class<?> cls = PictureDao.class;
//			assertNotNull(cls);
//	}
//	@Test
//	public void test2(){
//		try {
//			Class<?> cls=PictureDao.class;
//			Method mtd=cls.getM
//		} catch (ClassNotFoundException e) {
//			fail("ClassNotFound");
//		}
//		
//	}
	@Test
	public void testPicInsert(){
		Picture pic=new Picture();
		pic.setName("testPic");
		picDao.save(pic);
		Picture pic2=picDao.findByName("testPic");
		assertEquals(pic, pic2);
	}
	@Test
	public void testFindByNameOrTags(){
		Collection<Picture> picColl=new HashSet<>();
		Picture pic=new Picture();
		Tag tag=new Tag();
		Set<Tag> tagSet=new HashSet<>();
		pic.setName("testPic");
		tag.setName("testTag");
		pic.setTags(tagSet);
		pic.addTag(tag);
		picDao.save(pic);
		picColl.add(pic);
		Collection<Picture> picColl2=picDao.findByNameOrTagsName("","testTag");
		assertEquals(picColl, picColl2);
	}
	@Test
	public void testFindByTagsName(){
		Picture pic =new Picture();
		picDao.save(pic);
		Set<Tag> testTags=new HashSet<>();
		pic.setTags(testTags);
		Tag testTag=new Tag();
		testTag.setName("testTag");
		pic.addTag(testTag);
		pic.setVisibility(Visibility.PUBLIC);
		Set<Picture> picSet=new HashSet<>();
		picSet.add(pic);
		Set<Picture> picSet2=picDao.findByTagsNameAndVisibility("testTag",Visibility.PUBLIC);
		assertEquals(picSet, picSet2);
	}
	@Test
	public void testFindByUploaderId(){
		Picture pic=new Picture();
		picDao.save(pic);
		pic.setUploaderId(3L);
		Set<Picture> picSet=new HashSet<>();
		picSet.add(pic);
		Set<Picture> picSet2=picDao.findByUploaderId(3L);
		assertEquals(picSet, picSet2);
	}
	@Test
	public void testFindByCollectorsName(){
		Picture pic=new Picture();
		picDao.save(pic);
		Member mem=new Member();
		memDao.save(mem);
		mem.addPicColl(pic);
		mem.setName("testName");
		Set<Picture> picSet=new HashSet<>();
		picSet.add(pic);
		Set<Picture> picSet2=picDao.findByCollectorsName("testName");
		assertEquals(picSet, picSet2);
	}
//	@Test
//	public void testFindByNameAndVisibilityOrTagsNameAndVisibility(){
//		Collection<Picture> picColl=new HashSet<>();
//		Picture pic=new Picture();
//		Tag tag=new Tag();
//		Set<Tag> tagSet=new HashSet<>();
//		pic.setName("testPic");
//		pic.setVisibility(Visibility.PUBLIC);
//		tag.setName("testTag");
//		pic.setTags(tagSet);
//		pic.addTag(tag);
//		picDao.save(pic);
//		picColl.add(pic);
//		Collection<Picture> picColl2=picDao.findByNameAndVisibilityOrTagsNameAndVisibility("","testTag", Visibility.PUBLIC);
//		assertEquals(picColl, picColl2);
//	}
}
