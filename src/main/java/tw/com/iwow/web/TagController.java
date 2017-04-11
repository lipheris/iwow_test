package tw.com.iwow.web;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

import tw.com.iwow.entity.Tag;
import tw.com.iwow.service.PictureService;
import tw.com.iwow.service.TagService;
import tw.com.iwow.web.jsonview.Views;

@RestController
@RequestMapping(value = "/iwow/tags")
public class TagController {
	@Autowired
	private TagService tagService;
	@Autowired
	private PictureService pictureService;

	@RequestMapping(value = "/")
	public String getAll(Model model) {
		Collection<Tag> tags = tagService.getAll();
		model.addAttribute("tags", tags);
		return "/iwow/tags";
	}

	@RequestMapping(value = "/update")
	public String update(Tag tag, BindingResult bindingResult) {

		tagService.update(tag);
		return "redirect:/iwow/tags/";
	}

	@RequestMapping(value = "/delete")
	public String delete(Long id) {
		tagService.getAll().removeAll(pictureService.findAll());
		tagService.delete(id);
		return "redirect:/iwow/tags/";
	}
	@JsonView(Views.ShowTag.class)
	@RequestMapping(method=RequestMethod.GET, produces="application/json", value="/{id}")
	public Tag findTag(@PathVariable(value="id")Long id){
		return tagService.getById(id);
	}
}
