package tw.com.iwow.dao;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import tw.com.iwow.entity.Group;
@Repository
public interface GroupDao extends JpaRepository<Group, Long> {
	public static final String  FIND_RELATED_BY_NAME=
			"SELECT g FROM Group g"			
			+" WHERE g.name LIKE CONCAT ('%',:groupname,'%')";
			// 注意空格 
	
	public Group findByName(String name);
	
	@Query(FIND_RELATED_BY_NAME)
	public Set<Group> search(@Param("groupname")String name);
}
