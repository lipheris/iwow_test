package tw.com.iwow.web;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.com.iwow.entity.Picture;
import tw.com.iwow.entity.Tag;
import tw.com.iwow.enums.Assort;
import tw.com.iwow.enums.Visibility;
import tw.com.iwow.service.MemberService;
import tw.com.iwow.service.PictureService;

@Controller
@RequestMapping(value = "/iwow")
public class PictureController {

	@Autowired
	private PictureService pictureService;
	@Autowired
	private MemberService memberService;

	/*----單張圖片超連結-----*/
	@RequestMapping(method = RequestMethod.GET, value = "/picture/{id}")
	public String pictureAJAX(@PathVariable(value = "id") Long id, Model model)
			throws SQLException, UnsupportedEncodingException {
		model.addAttribute("picId", id);
		return "/iwow/picture";
	}

	@RequestMapping(method = RequestMethod.GET, produces = { "application/json" }, value = "/list")
	public String listAJAX(Model model) throws SQLException, UnsupportedEncodingException {
		Collection<Picture> pictureList = pictureService.findAll();
		model.addAttribute("pictureList", pictureList);
		return "/iwow/member/listupdate";
	}

	/*-------------------index page 接圖用----------------*/
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String methodPost(Model model) throws Exception {
		Collection<Picture> pictureList = pictureService.findAll();
		//處理null
		Collection<Picture> picsT = new ArrayList<Picture>();
		for (Picture pics : pictureList) {
			if (pics.getPictureAddress() != null) {
				picsT.add(pics);
			}
		}
		model.addAttribute("picMsg", picsT);
		return "iwow/index";
	}


	@RequestMapping(value = "/doUpload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String handleFileUpload(ModelAndView model, Picture picture, BindingResult bindingResult,
			String update ,@RequestParam CommonsMultipartFile pic,String[] tags)
			 {
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy");
		LocalDate ld = LocalDate.parse(update, dtf);
		LocalDateTime ldt = LocalDateTime.of(ld, LocalTime.MIN);
		picture.setUpdate(ldt);
		
		if(tags==null){
			pictureService.insert(picture, pic);
		}else{
		pictureService.insert(picture, pic,tags);
		}
		return "redirect:/iwow/member/picturesEdit";
	}
	@RequestMapping(method = RequestMethod.GET, produces = { "application/json" }, value = "/delete")
	public String deletePicture(Model model,Long id){
		pictureService.delete(id);
		Collection<Picture> pictureList = pictureService.findAll();
		model.addAttribute("pictureList", pictureList);
		return "/iwow/member/picturesEdit";
	}@RequestMapping(method = RequestMethod.GET, produces = { "application/json" }, value = "/update")
	public String updatePicture(Model model,String picName,String visibility,String assort,Long id) throws SQLException, UnsupportedEncodingException {
		Picture pic=pictureService.getById(id);
		pic.setName(picName);
		pic.setVisibility(Visibility.valueOf(visibility));
		pic.setAssort(Assort.valueOf(assort));
		pictureService.update(pic);
		Collection<Picture> pictureList = pictureService.findAll();
		model.addAttribute("pictureList", pictureList);
		return "/iwow/member/picturesEdit";
	}
}
