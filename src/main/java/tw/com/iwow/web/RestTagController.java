package tw.com.iwow.web;

import java.util.Collection;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

import tw.com.iwow.entity.Picture;
import tw.com.iwow.entity.Tag;
import tw.com.iwow.service.PictureService;
import tw.com.iwow.service.TagService;
import tw.com.iwow.web.jsonview.Views;

@RestController
@RequestMapping(value = "/iwow/tags")
public class RestTagController {
	@Autowired
	private TagService tagService;
	@Autowired
	private PictureService pictureService;

	@JsonView(Views.ShowTag.class)
	@RequestMapping(method = RequestMethod.GET, produces = "application/json", value = "/{id}")
	public Tag findTag(@PathVariable(value = "id") Long id) {
		return tagService.getTag(id);
	}

	@JsonView(Views.ShowTag.class)
	@RequestMapping(method = RequestMethod.GET, produces = "application/json")
	public Collection<Tag> findAllTags(@PathVariable(value = "id") Long id) {
		return tagService.getAll();
	}
	@JsonView(Views.ShowTag.class)
	@RequestMapping(value = "/get")
	public Collection<Tag> getTags(Model model,Long id) {
		Collection<Tag> tags = null;
		System.out.println(id);
		if (id == null) {
			tags = tagService.getAll();
		} else {
			tags = pictureService.getById(id).getTags();
		}
		return tags;
	}
	@JsonView(Views.ShowTag.class)
	@RequestMapping(value="/insert")
	public Tag insert(Model model,Long id ,Tag tag){
		Picture picture=pictureService.getById(id);
		Set<Tag> tags=picture.getTags();
		System.out.println(tag.getName().trim());
		if(tagService.getTag(tag.getName())!=null){
		tags.add(tagService.getTag(tag.getName()));}
		else{tags.add(tag);}
		picture.setTags(tags);
		pictureService.update(picture);
		return tagService.getTag(tag.getName());
	}
}
