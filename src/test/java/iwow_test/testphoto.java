package iwow_test;

import java.io.File;
import java.io.FileInputStream;

import com.microsoft.azure.storage.CloudStorageAccount;
import com.microsoft.azure.storage.blob.BlobContainerPermissions;
import com.microsoft.azure.storage.blob.BlobContainerPublicAccessType;
import com.microsoft.azure.storage.blob.CloudBlobClient;
import com.microsoft.azure.storage.blob.CloudBlobContainer;
import com.microsoft.azure.storage.blob.CloudBlockBlob;

public class testphoto {
	
	private static final String storageConnectionString = "DefaultEndpointsProtocol=https;AccountName=eeit9230;AccountKey=2Vk8Jt+Gs/VtnWQrdb65seTGrpZ6RK/yOq0FsKVx+iQ9JKTWvy8f0/IKwvYL81FdxTTzrS98dTDMcJL6rJF9sQ==;EndpointSuffix=core.windows.net;";
			
	public static void test() {
		try
		{
		    CloudStorageAccount storageAccount = CloudStorageAccount.parse(storageConnectionString);
		    CloudBlobClient blobClient = storageAccount.createCloudBlobClient();
		    CloudBlobContainer container = blobClient.getContainerReference("abencontainer");
//		    container.createIfNotExists();
/**/		    
//		    BlobContainerPermissions containerPermissions = new BlobContainerPermissions();
//		    containerPermissions.setPublicAccess(BlobContainerPublicAccessType.CONTAINER);
//		    container.uploadPermissions(containerPermissions);
	
		    final String filePath = "E:\\1003.jpg";
		    CloudBlockBlob blob = container.getBlockBlobReference("myimage.jpg");
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
	public static void main(String[] args) {
		test();

	}

}
