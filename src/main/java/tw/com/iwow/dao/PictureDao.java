package tw.com.iwow.dao;

import java.sql.Blob;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import tw.com.iwow.entity.Picture;
import tw.com.iwow.enums.Visibility;

public interface PictureDao extends JpaRepository<Picture, Long> {
	public static final String FIND_ID_BY_SEARCH =
			"SELECT p FROM Picture p "
			+ "LEFT JOIN p.tags t "
			+ "WHERE p.visibility = 'PUBLIC' "
			+ "AND (p.name LIKE CONCAT('%',:param,'%') "
			+ "OR t.name LIKE CONCAT('%',:param,'%')"
			+ "OR p.uploader IN (SELECT m FROM Member m WHERE m.name LIKE CONCAT('%',:param,'%')))";
	public static final String find_less_id="select top 1 id from pictures order by id desc";
	public Picture findByPictureAddress(String pictureAddress);
	public Picture findByName(String name);
	public Set<Picture> findByTagsName(String tagName);
	public Set<Picture> findByTagsNameAndVisibility(String tagName, Visibility vis);
	public Set<Picture> findByNameOrTagsName(String name, String tagsName);
	public Set<Picture> findByUploaderId(Long uploaderId);
	public Set<Picture> findByCollectorsName(String collName);
	/*
	 * 輸入關鍵字回傳圖片名稱、標籤名稱、上傳者名稱中含有關鍵字的圖片id
	 */
	@Query(FIND_ID_BY_SEARCH)
	public Set<Picture> search(@Param("param")String param);
	@Query(value=find_less_id, nativeQuery = true )
	public Long findOrderById();
}
