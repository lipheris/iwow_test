package tw.com.iwow.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.iwow.entity.Tag;

public interface TagDao extends JpaRepository<Tag, Long> {

}
