package tw.com.iwow.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.iwow.dao.PictureDao;
import tw.com.iwow.dao.TagDao;
import tw.com.iwow.entity.Picture;
import tw.com.iwow.entity.Tag;

@Service
public class TagService {
	@Autowired
	private TagDao tagDao;
	@Autowired
	private PictureDao pictureDao;

	public Tag insert(Tag tag) {
		return tagDao.save(tag);
	}

	public void delete(Long id) {
		Tag tag = tagDao.findOne(id);
		Collection<Picture> pictures = pictureDao.findAll();
		tag.removeTags(pictures);
		tagDao.delete(tag);
	}

	public void delete(Long tagid, Long id) {
		Tag tag = tagDao.findOne(tagid);
		Picture picture = pictureDao.findOne(id);
		picture.removeTag(tag);
		pictureDao.save(picture);
		tagDao.delete(tagid);

	}

	public Tag update(Tag tag) {
		Tag temp = tagDao.findOne(tag.getId());
		if (temp.getName().equals(tag.getName())) {
			temp = tag;
		} else {
			temp.setId(null);
		}
		return tagDao.save(temp);
	}

	public Collection<Tag> getAll() {
		return tagDao.findAll();
	}

	public Tag getTag(String name) {
		return tagDao.findByName(name);
	}

	public Tag getTag(Long id) {
		return tagDao.findOne(id);
	}

	public Collection<Tag> getTagFive() {
		return tagDao.findOrderByNewid();
	}
}
