package tw.com.iwow.web;

import java.util.Collection;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

import tw.com.iwow.entity.Picture;
import tw.com.iwow.entity.Tag;
import tw.com.iwow.service.PictureService;
import tw.com.iwow.service.TagService;
import tw.com.iwow.web.jsonview.Views;

@RestController
@RequestMapping(value = "/iwow/picture/tags")
public class TagController {
	@Autowired
	private TagService tagService;
	@Autowired
	private PictureService pictureService;

	@RequestMapping
	public String getAll(Model model,Long id) {
		Collection<Tag> tags = tagService.getAll();
		if (id == null) {
			tags = tagService.getAll();
		} else {
			tags = pictureService.getById(id).getTags();
		}

		model.addAttribute("tags", tags);
		return "/iwow/picture/tags";
	}

	@RequestMapping(value = "/update")
	public String update(Tag tag, BindingResult bindingResult) {

		tagService.update(tag);
		return "redirect:/iwow/picture/tags/";
	}

	@RequestMapping(value = "/delete")
	@ResponseBody
	public Boolean delete(Long id,Long tagId){
		System.out.println(id);
		if(id!=null){
		tagService.delete(tagId,id);
		}else{
		tagService.delete(id);
		}
		return true;
//		return "redirect:/iwow/picture/tags?id="+id;
	}
	@RequestMapping(value="/insert")
	public String insert(Model model,Long id ,Tag tag){
		Picture picture=pictureService.getById(id);
		Set<Tag> tags=picture.getTags();
		System.out.println(tag.getName());
		if(tagService.getTag(tag.getName())!=null){
		tags.add(tagService.getTag(tag.getName()));}
		else{tags.add(tag);}
		picture.setTags(tags);
		pictureService.update(picture);

		return "redirect:/iwow/picture/tags?id=" + id;
	}
	@JsonView(Views.ShowTag.class)
	@RequestMapping(method=RequestMethod.GET, produces="application/json", value="/{id}")
	public Tag findTag(@PathVariable(value="id")Long id){
		return tagService.getTag(id);
	}
}
