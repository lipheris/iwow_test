package tw.com.iwow.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tw.com.iwow.entity.Group;
@Repository
public interface GroupDao extends JpaRepository<Group, Long> {
	public Group findByName(String name);
}
