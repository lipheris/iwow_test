package tw.com.iwow.web;

import java.util.Collection;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

import tw.com.iwow.entity.Tag;
import tw.com.iwow.service.TagService;
import tw.com.iwow.web.jsonview.Views;

@RestController
@RequestMapping(value = "/iwow/tags")
public class RestTagController {
	@Autowired
	private TagService tagService;

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

}
