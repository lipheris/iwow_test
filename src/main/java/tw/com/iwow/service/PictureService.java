package tw.com.iwow.service;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.microsoft.azure.storage.CloudStorageAccount;
import com.microsoft.azure.storage.blob.CloudBlobClient;
import com.microsoft.azure.storage.blob.CloudBlobContainer;
import com.microsoft.azure.storage.blob.CloudBlockBlob;

import tw.com.iwow.dao.MemberDao;
import tw.com.iwow.dao.PicDescriptionDao;
import tw.com.iwow.dao.PictureDao;
import tw.com.iwow.dao.TagDao;
import tw.com.iwow.entity.Member;
import tw.com.iwow.entity.PicsDescription;
import tw.com.iwow.entity.Picture;
import tw.com.iwow.entity.Stats;
import tw.com.iwow.entity.Tag;

@Service
public class PictureService {

	private static final String storageConnectionString = "DefaultEndpointsProtocol=https;AccountName=iwowblob;AccountKey=aSzX3lBzin0MehMzxDUo0jULu2A7PhtrH+0WxEaFuyj1AwpXwnwjkcOLM3BJwBFKZNVxDGza8f4t4JNcUlQNUA=="
			+ "AccountName=iwowblob;"
			+ "AccountKey=aSzX3lBzin0MehMzxDUo0jULu2A7PhtrH+0WxEaFuyj1AwpXwnwjkcOLM3BJwBFKZNVxDGza8f4t4JNcUlQNUA==";
	@Autowired
	private PictureDao pictureDao;
	@Autowired
	private TagDao tagDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private PicDescriptionDao picDescriptionDao;
	private Gson gson=new GsonBuilder()
			.excludeFieldsWithoutExposeAnnotation()
			.serializeNulls().setDateFormat("yyyy-MM-dd HH:mm:ss:SSS")
			.create();
	public Picture getById(Long id) {
		return pictureDao.findOne(id);
	}
	public Collection<Picture> getByUploaderId(){
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentPrincipalName = authentication.getName();
		Member uploader = memberDao.findByEmail(currentPrincipalName);
		Long id=uploader.getId();
		return pictureDao.findByUploaderId(id);
	}

	public Picture insert(Picture picture, CommonsMultipartFile pic, String[] tags) {
		Set<Tag> temptags = new HashSet<Tag>();
		Collection<Tag> tagsSQL = tagDao.findAll();
		test: for (String tag : tags) {
			Tag temp = new Tag();
			for (Tag tagSQL : tagsSQL) {
				if (tagSQL.getName().equals(tag)) {
					temptags.add(tagSQL);
					continue test;
				}
			}
			temp.setName(tag);
			temptags.add(temp);
		}
		picture.setTags(temptags);
		return insert(picture, pic);
	}

	public Picture insert(Picture picture, CommonsMultipartFile pic) {
		// 圖片上傳到雲端的語法
		try {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String currentPrincipalName = authentication.getName();
			Member uploader = memberDao.findByEmail(currentPrincipalName);
			// Retrieve storage account from connection-string. 和microsoft取得連線
			CloudStorageAccount storageAccount = CloudStorageAccount.parse(storageConnectionString);

			// Create the blob client. 說明我們是要上傳圖片的
			CloudBlobClient blobClient = storageAccount.createCloudBlobClient();

			// Retrieve reference to a previously created container.
			// 選擇到哪一個container
			CloudBlobContainer container = blobClient.getContainerReference("mycontainer");

			// Create or overwrite the "myimage.jpg" blob with contents from a
			// local file. 存取為什麼檔案
			String name = LocalDateTime.now().toString() + UUID.randomUUID().toString(); // 只要UUID.randomUUID
																							// Java可以自動產生出一組亂碼
			CloudBlockBlob blob = container.getBlockBlobReference(name + uploader.getId() + ".jpg");
			blob.upload(pic.getInputStream(), pic.getSize());
			picture.setPictureAddress(
					"https://iwowblob.blob.core.windows.net/mycontainer/" + name + uploader.getId() + ".jpg");
			picture.setUploader(uploader);
			Stats stat = new Stats();
//			statsDao.save(stat);
			picture.setStats(stat);
			stat.setPic(picture);
			pictureDao.save(picture);
			return picture;
		} catch (Exception e) {
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

	public Set<Picture> search(String param) {
		return pictureDao.search(param);
	}
	public String searchReturnJson(String param){
		return gson.toJson(this.search(param));
	}

	public PicsDescription insertText(PicsDescription picsDescription) {
		return picDescriptionDao.save(picsDescription);
	}

	public List<PicsDescription> getbyPicIdSort(Picture picture,Sort sort){
		return picDescriptionDao.findByPicture(picture,sort);
	}
	public Set<Picture> getRelatedPicture(Long id) {
		Set<Picture> result = new HashSet<>();
		Picture picture = this.getById(id);
		for (Tag tag : picture.getTags())
			result.addAll(tag.getPictures());
		result.remove(picture);
		return result;
	}
	public void deleteText(Long id) {
		picDescriptionDao.delete(id);;
	}
	public Long getTop() {
		return pictureDao.findOrderById();
	}
}