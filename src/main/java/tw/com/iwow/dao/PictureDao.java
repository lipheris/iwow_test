package tw.com.iwow.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.iwow.entity.Picture;

public interface PictureDao extends JpaRepository<Picture,Long> {

}
