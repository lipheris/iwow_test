package tw.com.iwow.service;

import java.sql.Blob;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.iwow.dao.PictureDao;
import tw.com.iwow.dao.TagDao;
import tw.com.iwow.entity.Picture;
import tw.com.iwow.entity.Tag;

@Service
public class PictureService {

	@Autowired
	private PictureDao pictureDao;
	@Autowired
	private TagDao tagDao;

	public Picture findById(Long id) {
		return pictureDao.findOne(id);
	}

	public Picture insert(Picture picture) {
		return pictureDao.save(picture);
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

	public Picture getByFile(Blob file) {
		return pictureDao.findByFile(file);
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
