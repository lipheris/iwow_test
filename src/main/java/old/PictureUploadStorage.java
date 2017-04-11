package old;

import java.io.File;
import java.io.FileInputStream;

import org.springframework.stereotype.Controller;

//Include the following imports to use blob APIs.
import com.microsoft.azure.storage.CloudStorageAccount;
import com.microsoft.azure.storage.blob.BlobContainerPermissions;
import com.microsoft.azure.storage.blob.BlobContainerPublicAccessType;
import com.microsoft.azure.storage.blob.CloudBlobClient;
import com.microsoft.azure.storage.blob.CloudBlobContainer;
import com.microsoft.azure.storage.blob.CloudBlockBlob;


@Controller
public class PictureUploadStorage {
	// Define the connection-string with your values
	public static final String storageConnectionString =
	    "DefaultEndpointsProtocol=https;AccountName=iwowblob;AccountKey=aSzX3lBzin0MehMzxDUo0jULu2A7PhtrH+0WxEaFuyj1AwpXwnwjkcOLM3BJwBFKZNVxDGza8f4t4JNcUlQNUA==" +
	    "AccountName=iwowblob;" +
	    "AccountKey=aSzX3lBzin0MehMzxDUo0jULu2A7PhtrH+0WxEaFuyj1AwpXwnwjkcOLM3BJwBFKZNVxDGza8f4t4JNcUlQNUA==";
	// Retrieve storage account from connection-string.
//	static String storageConnectionString =
//	    RoleEnvironment.getConfigurationSettings().get("StorageConnectionString");
	public static void runSample(){
		try
		{
		    // Retrieve storage account from connection-string.
		    CloudStorageAccount storageAccount = CloudStorageAccount.parse(storageConnectionString);

		    // Create the blob client.
		    CloudBlobClient blobClient = storageAccount.createCloudBlobClient();

		    // Get a reference to a container.
		    // The container name must be lower case
		    CloudBlobContainer container = blobClient.getContainerReference("mycontainer");
		    
		    // Create a permissions object.
		    BlobContainerPermissions containerPermissions = new BlobContainerPermissions();

		    // Include public access in the permissions object.
		    containerPermissions.setPublicAccess(BlobContainerPublicAccessType.CONTAINER);

		    // Set the permissions on the container.
		    container.uploadPermissions(containerPermissions);
		    // Create the container if it does not exist.
		    container.createIfNotExists();
		}
		catch (Exception e)
		{
		    // Output the stack trace.
		    e.printStackTrace();
		}
		try
		{
		    // Retrieve storage account from connection-string.
		    CloudStorageAccount storageAccount = CloudStorageAccount.parse(storageConnectionString);

		    // Create the blob client.
		    CloudBlobClient blobClient = storageAccount.createCloudBlobClient();

		    // Retrieve reference to a previously created container.
		    CloudBlobContainer container = blobClient.getContainerReference("mycontainer");

		    // Define the path to a local file.
		    final String filePath = "E:\\1003.jpg";

		    // Create or overwrite the "myimage.jpg" blob with contents from a local file.
		    CloudBlockBlob blob = container.getBlockBlobReference("myimage.jpg");
		    File source = new File(filePath);
		    blob.upload(new FileInputStream(source), source.length());
		}
		catch (Exception e)
		{
		    // Output the stack trace.
		    e.printStackTrace();
		}
	}
	public static void getImg(){
		
	}
	public static void main(String[] args){
		runSample();
	}
	
	
}
