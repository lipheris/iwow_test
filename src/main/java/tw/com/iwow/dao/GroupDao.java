package tw.com.iwow.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.iwow.entity.Group;

public interface GroupDao extends JpaRepository<Group, Long> {

}
