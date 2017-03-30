package tw.com.iwow.web;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import tw.com.iwow.entity.Picture;
import tw.com.iwow.service.PictureService;

@RestController
@RequestMapping(value="iwow/pictures")
public class PictureRESTful {
	
	@Autowired
	private PictureService pictureService;
	
	@RequestMapping(method=RequestMethod.GET, produces={"application/json"})
	public Collection<Picture> listPictures(){
		return pictureService.findAll();
	}
	
	@RequestMapping(method=RequestMethod.GET, produces={"application/json"}, value="{id}")
	public Picture findPicture(@PathVariable(value="id") Long id){
		return pictureService.findById(id);
	}
	
	@RequestMapping(method=RequestMethod.POST, consumes={"application/json"})
	public Picture insertPicture(@RequestBody Picture picture){
		return pictureService.insert(picture);
	}
	
	@RequestMapping(method=RequestMethod.PUT, consumes={"application/json"})
	public Picture updatePicture(@RequestBody Picture picture){
		return pictureService.update(picture);
	}
	
	@RequestMapping(method=RequestMethod.DELETE, value="{id}")
	public void deletePicture(@PathVariable("id") Long id){
		pictureService.delete(id);
	}
}
