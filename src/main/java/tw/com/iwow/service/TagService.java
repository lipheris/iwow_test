package tw.com.iwow.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.iwow.dao.TagDao;
import tw.com.iwow.entity.Tag;

@Service
public class TagService {
@Autowired
private TagDao tagDao;
public Tag insert(Tag tag){
	return tagDao.save(tag);
}
public void delete(Long id){
	Tag tag=tagDao.findOne(id);
	tagDao.delete(tag);
}
public Tag update(Tag tag){
	Tag temp = tagDao.findByName(tag.getName());
	temp.setDsc(tag.getDsc());
	return tagDao.save(temp);
} 
public Collection<Tag> getAll(){
	return tagDao.findAll();
}
public Tag getTag(String name){
	return tagDao.findByName(name);
} 
}
