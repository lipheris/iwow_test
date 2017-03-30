package tw.com.iwow.dao;

import java.sql.Blob;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tw.com.iwow.entity.Picture;

@Repository
public interface PictureDao extends JpaRepository<Picture, Long> {

	public Picture findByFile(Blob file);
}
