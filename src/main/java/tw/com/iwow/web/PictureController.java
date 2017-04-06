package tw.com.iwow.web;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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


//restController不適用SpringMVC
//先把Gson註解
@Controller
@RequestMapping(value = "/iwow")
public class PictureController {

	@Autowired
	private PictureService pictureService;
	@Autowired
	private MemberService memberService;

	

/*----單張圖片超連結-----*/
/*前端請求----<a href="<c:url value="/iwow/indexPicture/${list.id}"/>"><img src='${list.pictureAddress}' /></a>---*/	
	@RequestMapping(method=RequestMethod.GET, produces={"application/json"}, value = "/indexPicture/{id}")
	public String pictureAJAX(@PathVariable(value="id") Long id, Model model) throws SQLException, UnsupportedEncodingException {
		String pictureAd = pictureService.getById(id).getPictureAddress();	
		model.addAttribute("pictureAd",pictureAd);
		return "/iwow/index_user";		
	}

	
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
//				LocalDate ld=LocalDate.parse(update, dtf);				沒有時分秒適用
//				LocalDateTime ldt = LocalDateTime.parse(update,dtf);	要有時分秒
				try {
					picture.setVisibility(Visibility.valueOf(visibility)); 	//set要用emun的形式
				} catch (Exception e) {
					e.printStackTrace();
				}
				try {
					picture.setAssort(Assort.valueOf(assort));				//set要用emun的形式
				} catch (Exception e) {
					e.printStackTrace();
				}
				picture.setUpdate(LocalDateTime.now());
				//直接把路徑寫死	要記得寫.jsp
				picture.setPictureAddress("https://iwowblob.blob.core.windows.net/mycontainer/"+picture.getName().trim()+".jpg");
//				Blob blob = new javax.sql.rowset.serial.SerialBlob(pic.getBytes());
//				picture.setFile(blob);
//				System.out.println(name);
				// picture.setName(aFile.getOriginalFilename());
				// uploadFile.setData(aFile.getBytes());
				
				pictureService.insert(picture,pic);
				
			
		return "redirect:/iwow/list";
	}

	
	
	// CollectionList頁面
		@RequestMapping("/collectionlist")
		public String wishListPage(HttpServletRequest request, Model model){
			Long Id = (Long)request.getSession().getAttribute("Id");
			Member member = memberService.getById(Id);
			Set<Picture> collectionList = member.getPicColls();
			model.addAttribute("collectionList", collectionList);
			model.addAttribute("member", member);
			return "/iwow/collectionlist";
		}
		
		
		//insert Collection
		@RequestMapping("/collect/picture/{picId}")
		@ResponseBody
		public Boolean wishListInsert(@PathVariable Long picId, HttpServletRequest request, Model model){
			Long Id = (Long)request.getSession().getAttribute("Id");
			Member member = memberService.getById(Id);
			Picture picture = pictureService.getById(picId);
			Set<Picture> pictures = member.getPicColls();
			if(pictures.contains(picture)){
				return false;
			}
			pictures.add(picture);
			member.setPicColls(pictures);
			memberService.update(member);
			return true;
		}
		
		//delete Collection
		@RequestMapping("/collect/picture/delete")
		@ResponseBody
		public Integer wishListDelete(@RequestParam Long picId, HttpServletRequest request, Model model){
			Long Id = (Long)request.getSession().getAttribute("Id");
			Member member = memberService.getById(Id);
			Set<Picture> pictures = member.getPicColls();
			Picture picture = pictureService.getById(picId);
			if(pictures.contains(picture)){
				pictures.remove(picture);
				member.setPicColls(pictures);
				memberService.update(member);
			}
			return pictures.size();
		}
}
