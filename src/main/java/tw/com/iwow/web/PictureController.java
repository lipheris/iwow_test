package tw.com.iwow.web;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.com.iwow.entity.Picture;
import tw.com.iwow.enums.Assort;
import tw.com.iwow.enums.Visibility;
import tw.com.iwow.service.PictureService;



@Controller
@RequestMapping(value = "/iwow")
public class PictureController {

	@Autowired
	private PictureService pictureService;


	@RequestMapping(method=RequestMethod.GET, value = "/list")
	public String listAJAX(Model model){

		Collection<Picture> pictureList = pictureService.findAll();
		model.addAttribute("pictureList", pictureList);
		return "/iwow/list";


	}

	@RequestMapping(value = "/doUpload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String handleFileUpload(ModelAndView model, Picture picture, BindingResult bindingResult, String name,String tag,
			String update, String visibility,String assort, @RequestParam CommonsMultipartFile pic) throws Exception {
				
				DateTimeFormatter dtf =  DateTimeFormatter.ofPattern("MM/dd/yyyy");
				LocalDate ld=LocalDate.parse(update, dtf);				
				LocalDateTime ldt = LocalDateTime.of(ld, LocalTime.MIN);
				try {
					picture.setVisibility(Visibility.valueOf(visibility));
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					picture.setAssort(Assort.valueOf(assort));				
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
				picture.setUpdate(ldt);
				pictureService.insert(picture,pic);
		return "redirect:/iwow/list";
	}

}
