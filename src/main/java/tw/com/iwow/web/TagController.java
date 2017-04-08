package tw.com.iwow.web;

import java.sql.SQLException;
import java.util.Collection;

import javax.sql.rowset.serial.SerialClob;
import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.iwow.entity.Tag;
import tw.com.iwow.service.PictureService;
import tw.com.iwow.service.TagService;

@Controller
@RequestMapping(value="/iwow/tags")
public class TagController {
@Autowired
private TagService tagService;
@Autowired
private PictureService pictureService;
@RequestMapping(value="/")
public String getAll(Model model){
	Collection<Tag> tags= tagService.getAll();
	model.addAttribute("tags", tags);
	return"/iwow/tags";
}
@RequestMapping(value="/update")
public String update(Tag tag , BindingResult bindingResult){

	tagService.update(tag);
	return "redirect:/iwow/tags/";
}
@RequestMapping(value="/delete")
public String delete(Long id){
	tagService.getAll().removeAll(pictureService.findAll());
	tagService.delete(id);
	return "redirect:/iwow/tags/";
}
}
