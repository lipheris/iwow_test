package tw.com.iwow.web;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.com.iwow.entity.Picture;
import tw.com.iwow.service.PictureService;


@Controller
@RequestMapping(value="/iwow")
public class GetPictureController{

	@Autowired
	private PictureService pictureService;

	/*-------------------index page 接圖用----------------*/
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String methodPost(Model model) throws Exception {
		Collection<Picture> pictureList = pictureService.findAll();
		Collection<Picture> picsT = new ArrayList<Picture>();
		for(Picture pics:pictureList){
			if(pics.getPictureAddress()!=null){
				picsT.add(pics);
			}
		}
			model.addAttribute("picMsg", picsT);	
		return "iwow/index";
	}
	
	/*-------------------picture page 對應圖for description----------------*/
	@RequestMapping(value = "/picture/{id}", method = RequestMethod.POST)
	public String picturePage(Model model,@RequestParam(name="jId") String jId){
		Picture pic = pictureService.getById(Long.valueOf(jId));
		String picNmae=pic.getName();
		model.addAttribute("picMsgs", picNmae);
		return "iwow/picture";
	}
}
