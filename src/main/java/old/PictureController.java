package old;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
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

//有保留GSON
//restController不適用SpringMVC先使用一般Controller
//@Controller
@RequestMapping(value = "/iwow")
public class PictureController {

	@Autowired
	private PictureService pictureService;

	//先把Gson註解

	

	@RequestMapping(method=RequestMethod.GET, produces={"application/json"}, value = "/listajax")
	public String listAJAX(Model model) throws SQLException, UnsupportedEncodingException {
		Collection<Picture> pictureList = pictureService.findAll();

		model.addAttribute("pictureList", pictureList);
//		Map<Long,String>getPic=new HashMap<Long,String>();
//		for(Picture temp:pictureList){
//			Long id=temp.getId();
//			byte[] testbyte = pictureService.findById(id).getFile().getBytes(1,
//					(int) pictureService.findById(id).getFile().length());
//			byte[] encodeBase64 = Base64.encodeBase64(testbyte);
//			String base64Encoded = new String(encodeBase64, "UTF-8");
//			System.out.println(base64Encoded);
//			getPic.put(id,base64Encoded);
//		}		
//		Gson gson = new Gson();
//		String json = gson.toJson(getPic);
//		return json;
		return "/iwow/list";

	}
		
	@InitBinder
	public void InitBinder(WebDataBinder binder){
		//需要額外的寫法
//		binder.registerCustomEditor(LocalDateTime.class, new CustomDateEditor(DateTimeFormatter.ofPattern("MM/dd/yyyy"), true));
		
	}
/*
 * Picture排程需要有時間
 * picture寫在參數內可以自動接收到form表單的傳入的值
 * 但是localdatetime、enum、file無法自動塞還需額外寫參數取出
 */
	@RequestMapping(value = "/doUpload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String handleFileUpload(ModelAndView model, Picture picture, BindingResult bindingResult, String name,String tag,
			String update, String visibility,String assort, @RequestParam CommonsMultipartFile pic) throws Exception {
				
				
				System.out.println("-------------------------------------------");
				System.out.println(name+update+visibility+assort+tag+picture);
				
				DateTimeFormatter dtf =  DateTimeFormatter.ofPattern("MM/dd/yyyy");
				LocalDate ld=LocalDate.parse(update, dtf);				
				LocalDateTime ldt = LocalDateTime.of(ld, LocalTime.MIN);
				try {
					picture.setVisibility(Visibility.valueOf(visibility)); 	//set要用emun的形式
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					picture.setAssort(Assort.valueOf(assort));				//set要用emun的形式
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
				
				picture.setUpdate(ldt);
				//直接把路徑寫死	要記得寫.jsp
//				Blob blob = new javax.sql.rowset.serial.SerialBlob(pic.getBytes());	保留database64 encode
//				picture.setFile(blob);
//				System.out.println(name);
				// picture.setName(aFile.getOriginalFilename());
				// uploadFile.setData(aFile.getBytes());
				
				pictureService.insert(picture,pic);
				
			
		return "redirect:/iwow/list";
	}

}
