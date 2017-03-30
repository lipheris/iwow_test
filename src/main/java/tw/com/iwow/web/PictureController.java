package tw.com.iwow.web;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.iwow.entity.Picture;
import tw.com.iwow.service.PictureService;

@Controller
@RequestMapping(value="/iwow")
public class PictureController {
	
	@Autowired
	private PictureService pictureService;
		
	@RequestMapping(value="/list")
	public String listPage(Model model){
		Collection<Picture> pictureList = pictureService.findAll();
		model.addAttribute("pictureList", pictureList);
		return "iwow/list";
	}
		
}
