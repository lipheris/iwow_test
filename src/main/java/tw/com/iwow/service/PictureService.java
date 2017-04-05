package tw.com.iwow.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.microsoft.azure.storage.CloudStorageAccount;
import com.microsoft.azure.storage.blob.CloudBlobClient;
import com.microsoft.azure.storage.blob.CloudBlobContainer;
import com.microsoft.azure.storage.blob.CloudBlockBlob;

import tw.com.iwow.dao.PictureDao;
import tw.com.iwow.dao.TagDao;
import tw.com.iwow.entity.Picture;
import tw.com.iwow.entity.Tag;

@Service
public class PictureService {

    private static final String storageConnectionString =
			"DefaultEndpointsProtocol=https;AccountName=iwowblob;AccountKey=aSzX3lBzin0MehMzxDUo0jULu2A7PhtrH+0WxEaFuyj1AwpXwnwjkcOLM3BJwBFKZNVxDGza8f4t4JNcUlQNUA==" +
					"AccountName=iwowblob;" +
					"AccountKey=aSzX3lBzin0MehMzxDUo0jULu2A7PhtrH+0WxEaFuyj1AwpXwnwjkcOLM3BJwBFKZNVxDGza8f4t4JNcUlQNUA==";
	@Autowired
	private PictureDao pictureDao;
	@Autowired
	private TagDao tagDao;

	public Picture findById(Long id) {
		return pictureDao.findOne(id);
	}

	public Picture insert(Picture picture,CommonsMultipartFile file) {
		
		try{
			  // Retrieve storage account from connection-string.	和microsoft取得連線
		    CloudStorageAccount storageAccount = CloudStorageAccount.parse(storageConnectionString);

		    // Create the blob client.
		    CloudBlobClient blobClient = storageAccount.createCloudBlobClient();

		    // Retrieve reference to a previously created container.		選擇到哪一個container
		    CloudBlobContainer container = blobClient.getContainerReference("mycontainer");

		    // Create or overwrite the "myimage.jpg" blob with contents from a local file.	存取為什麼檔案
		    CloudBlockBlob blob = container.getBlockBlobReference(picture.getName().trim()+".jpg");
		    blob.upload(file.getInputStream(), file.getSize());
			return pictureDao.save(picture);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	public Picture update(Picture picture) {
		return pictureDao.save(picture);
	}

	public void delete(Long id) {
		pictureDao.delete(id);
	}

	public Collection<Picture> findAll() {
		return pictureDao.findAll();
	}

	public Picture getByFile(String file) {
		return pictureDao.findByPictureAddress(file);
	}

	public void addTag(Picture picture, String tagName) {
		Tag tag = tagDao.findByName(tagName);
		if (tag == null) {
			tag = new Tag();
			tag.setName(tagName);
		}
		picture.addTag(tag);
	}
	
}
