package tw.com.iwow.web;


import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tw.com.iwow.entity.Picture;
import tw.com.iwow.service.PictureService;


@Controller
@RequestMapping(value="/iwow")
public class GetPictureController extends HttpServlet{

	@Autowired
	private PictureService pictureService;
	
	/*-------------------index page 接圖用----------------*/
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String methodPost(Model model)
			throws ServletException, IOException, SQLException {
		Iterator<Picture> itr = pictureService.findAll().iterator();
		Map<Long,String> picMsg=new HashMap<Long,String>();
		while(itr.hasNext()){
			Long n = itr.next().getId();
			byte[] bytes = pictureService.findById(n).getFile().getBytes(1,
					(int) pictureService.findById(n).getFile().length());
			byte[] encodeBase64 = Base64.encodeBase64(bytes);
			String  base64En= new String(encodeBase64, "UTF-8");
			picMsg.put(n, base64En);
		}
		model.addAttribute("enbase64", picMsg);
	
		return "iwow/index";
	}
	
	/*-------------------picture page 對應圖for description----------------*/
	@RequestMapping(value = "/picture", method = RequestMethod.POST)
	public String picturePage(Model model) throws Exception  {
		Map<String,String> picMsg=new HashMap<String,String>();
		Iterator<Picture> itr = pictureService.findAll().iterator();

		while(itr.hasNext()){
			Long n = itr.next().getId();
			String nparse=String.valueOf(n);
			String description=pictureService.findById(n).getDescription();	
			picMsg.put(nparse, description);			
		}
		
		model.addAttribute("picMsg", picMsg);	
		return "iwow/picture";
	}
	
	
}