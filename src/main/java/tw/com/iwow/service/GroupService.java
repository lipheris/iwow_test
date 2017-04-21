package tw.com.iwow.service;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.microsoft.azure.storage.CloudStorageAccount;
import com.microsoft.azure.storage.blob.CloudBlobClient;
import com.microsoft.azure.storage.blob.CloudBlobContainer;
import com.microsoft.azure.storage.blob.CloudBlockBlob;

import tw.com.iwow.dao.GroupDao;
import tw.com.iwow.entity.Group;

@Service
public class GroupService {
	
	/*建立BLOB connection*/
	private static final String storageConnectionString = 
			"DefaultEndpointsProtocol=https;AccountName=eeit9230;AccountKey=2Vk8Jt+Gs/VtnWQrdb65seTGrpZ6RK/yOq0FsKVx+iQ9JKTWvy8f0/IKwvYL81FdxTTzrS98dTDMcJL6rJF9sQ==;EndpointSuffix=core.windows.net";
	private Gson gson=new GsonBuilder()
			.excludeFieldsWithoutExposeAnnotation()
			.serializeNulls().setDateFormat("yyyy-MM-dd HH:mm:ss:SSS")
			.create();
	
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
	
	public String searchReturnJson(String name){
		return gson.toJson(this.search(name));
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
		return groupDao.save(group);
	}
	
	@Transactional
	public Group uploadPhoto(Group group, CommonsMultipartFile photo){
		if(photo==null){
			  group.setPhotoAd("/images/laope.jpg");
			  return groupDao.save(group);
		    }
				
		try{
		CloudStorageAccount storageAccount = CloudStorageAccount.parse(storageConnectionString);
	    CloudBlobClient blobClient = storageAccount.createCloudBlobClient();
	    CloudBlobContainer container = blobClient.getContainerReference("abencontainer");
	    String name = LocalDateTime.now().toString() + UUID.randomUUID().toString();
	    CloudBlockBlob blob = container.getBlockBlobReference(name + ".jpg");	  
		blob.upload(photo.getInputStream(), photo.getSize());
		group.setPhotoAd(
				"https://eeit9230.blob.core.windows.net/abencontainer/" + name + ".jpg");	
		return groupDao.save(group);
		}
		catch (Exception e)
		{
		    e.printStackTrace();
		}
		return null;
	}
	
	
	

	
	
	
	
}
