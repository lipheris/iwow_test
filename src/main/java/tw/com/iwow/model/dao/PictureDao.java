package tw.com.iwow.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.iwow.model.entity.Picture;

public interface PictureDao extends JpaRepository<Picture,Long> {

}
