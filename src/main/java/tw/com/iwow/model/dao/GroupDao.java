package tw.com.iwow.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.iwow.model.entity.Group;

public interface GroupDao extends JpaRepository<Group, Long> {

}
