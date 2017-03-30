package tw.com.iwow.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.iwow.dao.PictureDao;
import tw.com.iwow.entity.Picture;

@Service
public class PictureService {
	
	@Autowired
	private PictureDao pictureDao;
	
	public Picture findById(Long id){
		return pictureDao.findOne(id);
	}
	
	public Picture insert(Picture picture){
		return pictureDao.save(picture);
	}
	
	public Picture update(Picture picture){
		return pictureDao.save(picture);
	}
	
	public void delete(Long id){
		pictureDao.delete(id);
	}
	
	public Collection<Picture> findAll(){
		return pictureDao.findAll();
	}

}
