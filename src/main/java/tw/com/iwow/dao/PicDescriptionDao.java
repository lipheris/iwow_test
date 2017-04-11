package tw.com.iwow.dao;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.iwow.entity.PicsDesccription;

public interface PicDescriptionDao extends JpaRepository<PicsDesccription,Long>{
	
	 List<PicsDesccription> findByPicId(Long picId);
	 List<PicsDesccription> findByPicId(Long picId,Sort sort);
//	 PicsDesccription findByNote(String note);
	 
}
