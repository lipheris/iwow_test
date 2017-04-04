package tw.com.iwow.dao;

import java.sql.Blob;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.iwow.entity.Picture;
import tw.com.iwow.enums.Visibility;

public interface PictureDao extends JpaRepository<Picture, Long> {

	public Picture findByFile(Blob file);
	public Picture findByName(String name);
	public Set<Picture> findByTagsName(String tagName);
	public Set<Picture> findByTagsNameAndVisibility(String tagName, Visibility vis);
	public Set<Picture> findByNameOrTagsName(String name, String tagsName);
	public Set<Picture> findByUploaderId(Long uploaderId);
	public Set<Picture> findByCollectorsName(String collName);
}
