package iwow_test;

import java.io.File;
import java.io.FileInputStream;
import java.util.HashSet;
import java.util.Set;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.microsoft.azure.storage.CloudStorageAccount;
import com.microsoft.azure.storage.blob.BlobContainerPermissions;
import com.microsoft.azure.storage.blob.BlobContainerPublicAccessType;
import com.microsoft.azure.storage.blob.CloudBlobClient;
import com.microsoft.azure.storage.blob.CloudBlobContainer;
import com.microsoft.azure.storage.blob.CloudBlockBlob;

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
	
	private static final String storageConnectionString = "DefaultEndpointsProtocol=https;AccountName=eeit9230;AccountKey=2Vk8Jt+Gs/VtnWQrdb65seTGrpZ6RK/yOq0FsKVx+iQ9JKTWvy8f0/IKwvYL81FdxTTzrS98dTDMcJL6rJF9sQ==;EndpointSuffix=core.windows.net";
	
	@Test
	public void test() {
		try
		{
		    CloudStorageAccount storageAccount = CloudStorageAccount.parse(storageConnectionString);
		    CloudBlobClient blobClient = storageAccount.createCloudBlobClient();
		    CloudBlobContainer container = blobClient.getContainerReference("abencontainer");	    
		    container.createIfNotExists();		    
//		    BlobContainerPermissions containerPermissions = new BlobContainerPermissions();
//		    containerPermissions.setPublicAccess(BlobContainerPublicAccessType.CONTAINER);
//		    container.uploadPermissions(containerPermissions);
		    final String filePath = "E:\\1003.jpg";
		    CloudBlockBlob blob = container.getBlockBlobReference("myimage2.jpg");
		    File source = new File(filePath);
		    blob.upload(new FileInputStream(source), source.length());
//		    CloudBlockBlob blob2 = container.getBlockBlobReference("myimage2.jpg");
//		    blob2.uploadFromFile(filePath);
		}
		catch (Exception e)
		{
		    e.printStackTrace();
		}
		
	}
	
	public void test1() {
//		Group group=groupDao.findByName("EEIT92");
//		groupDao.delete(group);
		groupDao.search("EIT9");
	}
	
	
	public void test2() {
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
