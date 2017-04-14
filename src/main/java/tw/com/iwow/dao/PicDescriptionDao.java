package tw.com.iwow.dao;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.iwow.entity.PicsDescription;
import tw.com.iwow.entity.Picture;

public interface PicDescriptionDao extends JpaRepository<PicsDescription,Long>{	
	List<PicsDescription> findByNoteUpdate(LocalDateTime noteupdate,Sort sort);
//	List<PicsDescription> findByPicIdSort(Picture picture,Sort sort);
	List<PicsDescription> findByPicture(Picture picture,Sort sort);
}
