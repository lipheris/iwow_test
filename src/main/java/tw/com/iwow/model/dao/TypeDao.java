package tw.com.iwow.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.iwow.model.entity.Type;

public interface TypeDao extends JpaRepository<Type, Long> {

}
