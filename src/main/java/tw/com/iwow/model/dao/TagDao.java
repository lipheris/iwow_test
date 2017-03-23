package tw.com.iwow.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.iwow.model.entity.Tag;

public interface TagDao extends JpaRepository<Tag, Long> {

}
