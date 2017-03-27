package tw.com.iwow.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tw.com.iwow.entity.Type;
@Repository
public interface TypeDao extends JpaRepository<Type, Long> {

}
