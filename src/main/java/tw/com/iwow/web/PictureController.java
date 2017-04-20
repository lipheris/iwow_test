package tw.com.iwow.web;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.com.iwow.entity.PicsDescription;
import tw.com.iwow.entity.Picture;
import tw.com.iwow.entity.Report;
import tw.com.iwow.entity.Tag;
import tw.com.iwow.enums.Assort;
import tw.com.iwow.enums.Visibility;
import tw.com.iwow.service.MemberService;
import tw.com.iwow.service.PictureService;
import tw.com.iwow.service.ReportService;
import tw.com.iwow.service.TagService;

@Controller
@RequestMapping(value = "/iwow")
@SessionAttributes(names = { "pictexts", "username","tx" })
public class PictureController {

	@Autowired
	private PictureService pictureService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ReportService reportService;
	@Autowired
	private TagService tagService;

	/*----單張圖片超連結-----*/
	@RequestMapping(method = RequestMethod.GET, value = "/picture/{id}")
	public String picturePage(@PathVariable(value = "id") Long id, Model model,
			@CookieValue(value = "buyCar", required = false) String buyCarCookie, HttpServletResponse response)
			throws SQLException, UnsupportedEncodingException {
		model.addAttribute("picId", id);

		Picture picture = pictureService.getById(id);
		model.addAttribute("picture", picture);

		if (StringUtils.isEmpty(buyCarCookie) || buyCarCookie == null) {

			response.addCookie(new Cookie("buyCar", null));
			System.out.println("buyCarCookieP=" + buyCarCookie);
		}

		return "/iwow/picture";

	}

	/* 導向多張圖片修改 */
	@RequestMapping(method = RequestMethod.GET, produces = { "application/json" }, value = "/member/picturesedit")
	public String listAJAX(Model model) throws SQLException, UnsupportedEncodingException {
		Collection<Picture> pictureList = pictureService.findAll();
		model.addAttribute("pictureList", pictureList);
		return "/iwow/member/picturesEdit";
	}

	/*-------------------index page 接圖用----------------*/
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String methodPost(Model model) throws Exception {
		Collection<Picture> pictureList = pictureService.findAll();
		// 處理null
		Collection<Picture> picsT = new ArrayList<Picture>();
		for (Picture pics : pictureList) {
			if (pics.getPictureAddress() != null) {
				picsT.add(pics);
			}
		}
		model.addAttribute("picMsg", picsT);
		return "iwow/index";
	}

	@RequestMapping(value = "/member/upload")
	public String uploadPage(Model model) {
		Collection<Tag> tags = tagService.getTagFive();
		model.addAttribute("tags", tags);
		return "iwow/member/pictureUpload";
	}

	/* 執行上傳圖片 */
	@RequestMapping(value = "/doUpload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String handleFileUpload(ModelAndView model, Picture picture, BindingResult bindingResult, String update,
			@RequestParam CommonsMultipartFile pic, String[] tags) {

		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy");
		LocalDate ld = LocalDate.parse(update, dtf);
		LocalDateTime ldt = LocalDateTime.of(ld, LocalTime.MIN);
		picture.setUpdate(ldt);

		if (tags == null) {
			pictureService.insert(picture, pic);
		} else {
			pictureService.insert(picture, pic, tags);
		}
		return "redirect:/iwow/index";
	}

	/* 圖片刪除 */
	@RequestMapping(method = RequestMethod.GET, produces = { "application/json" }, value = "/delete")
	@ResponseBody
	public Boolean deletePicture(Model model, Long id) {
		pictureService.delete(id);
		Collection<Picture> pictureList = pictureService.findAll();
		model.addAttribute("pictureList", pictureList);
		return true;
//		return "/iwow/member/picturesEdit";
	}

	/*多張圖片修改起中幾張*/
	@RequestMapping(method = RequestMethod.GET, produces = { "application/json" }, value = "/update")
	@ResponseBody
	public Boolean updatePicture(Model model, String picName, String visibility, String assort, Long id)
			throws SQLException, UnsupportedEncodingException {
		System.out.println(picName+" "+visibility+" "+assort+" "+id);
		Picture pic = pictureService.getById(id);
		pic.setName(picName);
		pic.setVisibility(Visibility.valueOf(visibility));
		pic.setAssort(Assort.valueOf(assort));
		pictureService.update(pic);
		Collection<Picture> pictureList = pictureService.findAll();
		model.addAttribute("pictureList", pictureList);
		return true;
//		return "/iwow/member/picturesEdit";
	}

	/*-------------------insert picture description----------------*/
	@RequestMapping(value = "/insertDescription", method = RequestMethod.GET)
	public String picturePage(Model model, @RequestParam(name = "getId") Long picId, String typein,
			PicsDescription picsDescription, Picture picture) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Long memid = memberService.getByEmail(authentication.getName()).getId();
		String username = memberService.findById(memid).getName();
		picture.setId(picId);
		picsDescription.setNote(typein);
		picsDescription.setNoteUpdate(LocalDateTime.now());
		picsDescription.setPicture(picture);
		picsDescription.setMemId(memid);
		picsDescription.setUsername(username);

		pictureService.insertText(picsDescription);

		List<PicsDescription> pics = pictureService.getbyPicIdSort(picture, new Sort(Direction.DESC, "id"));
		model.addAttribute("pictexts", pics);

		return "redirect:/iwow/picture/" + picId;
	}

	/*-------------------sendEport----------------*/
	@RequestMapping(value = "/sendEport", method = RequestMethod.GET)
	public String sendEport(Model model, @RequestParam(name = "reportId") Long picId) {

		System.out.println(picId);
		model.addAttribute("picId", picId);
		return "/iwow/admin/report";
	}

	/*-------------------接收檢舉page----------------*/
	@RequestMapping(value = "/insertReport", method = RequestMethod.POST)
	public String insertReport(Model model, String reason, @RequestParam(name = "textReport") String textReport,
			@RequestParam(name = "reportId") Long picId, Report report, Picture picture) {

		picture.setId(picId);
		report.setDesc(reason + " " + textReport);
		report.setDate(LocalDateTime.now());
		report.setState(false);
		;
		report.setPicture(picture);

		reportService.insert(report);
		return "redirect:/iwow/index";
	}

	/*-------------------先行讀取Comment----------------*/
	@RequestMapping(value = "/getOnloadComment/{getId}", method = RequestMethod.GET)
	public String getOnloadComment(Model model, @PathVariable(value = "getId") Long id, PicsDescription picsDescription,
			Picture picture) {

		picture.setId(id);
		List<PicsDescription> pics = pictureService.getbyPicIdSort(picture, new Sort(Direction.DESC, "id"));
		model.addAttribute("pictexts", pics);

		return "redirect:/iwow/picture/" + id;

	}

	/*-------------------先行讀取report 以便修改----------------*/
	@RequestMapping(value = "/admin/manager", method = RequestMethod.GET)
	public String manager(Model model) {

		// System.out.println("test report page");
		List<Report> reportAll = reportService.getReportAll();
		model.addAttribute("reportAll", reportAll);
		return "/iwow/admin/manager";
	}
	/*---------------處理report 留言後刪除----------------*/
	 @RequestMapping(value = "/admin/deleteManager", method = RequestMethod.GET)
	 public String deleteManager(@RequestParam(name="reportId") String[] id){
		 for(String e:id){

			 reportService.delete(Long.parseLong(e));
		 }
	 return "redirect:/iwow/admin/manager";
	 }
	 
	 /*---------------作者刪除圖片留言----------------*/
	 @RequestMapping(value = "/admin/deleteComment", method = RequestMethod.GET)
	 public String deleteComment(Model model,@RequestParam(name="getId") Long picId,@RequestParam("commentId") Long commentId){	
		 Authentication authentication = SecurityContextHolder.getContext().getAuthentication();		
		 Long memid = memberService.getByEmail(authentication.getName()).getId();//登入id
		 Long aothorId=pictureService.getById(picId).getUploader().getId();
		 
		 if(memid == aothorId){
			 pictureService.deleteText(commentId);
		 }else{
			 model.addAttribute("tx", "非作者無法刪除 有問題請洽管理員");
		 }					 
	 return "redirect:/iwow/getOnloadComment/"+picId;
	 }
}
