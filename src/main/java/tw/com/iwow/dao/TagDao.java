package tw.com.iwow.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tw.com.iwow.entity.Tag;
@Repository
public interface TagDao extends JpaRepository<Tag, Long> {

}
