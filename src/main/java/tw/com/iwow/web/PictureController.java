package tw.com.iwow.web;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.com.iwow.entity.Member;
import tw.com.iwow.entity.Picture;
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
	@RequestMapping(method = {RequestMethod.GET,RequestMethod.POST}, produces = {
			"application/json" }, value = "/picture/{id}")
	public String pictureAJAX(@PathVariable(value = "id") Long id, Model model)
			throws SQLException, UnsupportedEncodingException {
		String pictureAd = pictureService.getById(id).getPictureAddress();
		model.addAttribute("pictureAd", pictureAd);
		model.addAttribute("pictureId", id);
		return "/iwow/picture";
	}

	@RequestMapping(method = RequestMethod.GET, produces = { "application/json" }, value = "/listajax")
	public String listAJAX(Model model) throws SQLException, UnsupportedEncodingException {
		Collection<Picture> pictureList = pictureService.findAll();
		model.addAttribute("pictureList", pictureList);
		return "/iwow/list";
	}

	/*-------------------index page 接圖用----------------*/
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String methodPost(Model model) throws Exception {
		Collection<Picture> pictureList = pictureService.findAll();
		Collection<Picture> picsT = new ArrayList<Picture>();
		for (Picture pics : pictureList) {
			if (pics.getPictureAddress() != null) {
				picsT.add(pics);
			}
		}
		model.addAttribute("picMsg", picsT);
		return "iwow/index";
	}

	/*-------------------picture page 對應圖for description----------------*/
	// @RequestMapping(value = "/picture/{id}", method = RequestMethod.POST)
	// public String picturePage(Model model,@RequestParam(name="picId") String
	// jId){
	// Picture pic = pictureService.getById(Long.valueOf(jId));
	// String picNmae=pic.getName();
	// model.addAttribute("picMsgs", picNmae);
	// return "iwow/picture";
	// }

	@RequestMapping(value = "/doUpload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String handleFileUpload(ModelAndView model, Picture picture, BindingResult bindingResult, String name,
			String tag, String update, String visibility, String assort, @RequestParam CommonsMultipartFile pic)
			throws Exception {

		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy");
		LocalDate ld = LocalDate.parse(update, dtf);
		LocalDateTime ldt = LocalDateTime.of(ld, LocalTime.MIN);

		try {
			picture.setVisibility(Visibility.valueOf(visibility));
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			picture.setAssort(Assort.valueOf(assort));
		} catch (Exception e) {
			e.printStackTrace();
		}

		picture.setUpdate(ldt);
		pictureService.insert(picture, pic);

		return "redirect:/iwow/list";
	}

}
