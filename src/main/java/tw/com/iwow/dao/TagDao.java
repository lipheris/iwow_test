package tw.com.iwow.dao;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.com.iwow.entity.Tag;

public interface TagDao extends JpaRepository<Tag, Long> {
	public static final String tagExist="";
	public static final String tagFive="select Top 5 * from tags order by newid()";
	public Tag findByName(String name);
	@Query(value=tagFive, nativeQuery = true )
	public Collection<Tag> findOrderByNewid();
}
