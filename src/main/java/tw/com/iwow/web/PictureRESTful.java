package tw.com.iwow.web;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

import tw.com.iwow.entity.Picture;
import tw.com.iwow.enums.Visibility;
import tw.com.iwow.service.PictureService;
import tw.com.iwow.web.jsonview.Views;

@RestController
@RequestMapping(value = "iwow/pictures")
public class PictureRESTful {

	@Autowired
	private PictureService pictureService;

	@JsonView(Views.PictureDetails.class)
	@RequestMapping(method = RequestMethod.GET, produces = { "application/json" })
	public Collection<Picture> listPictures() {
		return pictureService.findAll();
	}

	@JsonView(Views.ShowPicture.class)
	@RequestMapping(method = RequestMethod.GET, produces = { "application/json" }, value = "/{id}")
	public Picture findPicture(@PathVariable(value = "id") Long id) {
		Picture result = pictureService.getById(id);
		if (result.getVisibility() == Visibility.PRIVATE)
			return null;
		else
			return result;
	}
	
	@JsonView(Views.ShowPicture.class)
	@RequestMapping(method = RequestMethod.GET, produces = { "application/json" }, value = "/{id}/related_pictures")
	public Collection<Picture> findRelatedPicture(@PathVariable(value = "id") Long id) {
		return pictureService.getRelatedPicture(id);
	}
	// @RequestMapping(method=RequestMethod.POST, consumes={"application/json"})
	// public Picture insertPicture(@RequestBody Picture picture){
	// return pictureService.insert(picture);
	// }

	@RequestMapping(method = RequestMethod.PUT, consumes = { "application/json" })
	public Picture updatePicture(@RequestBody Picture picture) {
		return pictureService.update(picture);
	}

	@RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
	public void deletePicture(@PathVariable("id") Long id) {
		pictureService.delete(id);
	}
	@JsonView(Views.ShowPicture.class)
	@RequestMapping(method = RequestMethod.GET, value = "/edit", produces = { "application/json" })
	public Collection<Picture> memberPictures() {
		return pictureService.getByUploaderId();
	}
}
