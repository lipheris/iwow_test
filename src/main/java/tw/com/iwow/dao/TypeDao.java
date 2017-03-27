package tw.com.iwow.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.iwow.entity.Type;

public interface TypeDao extends JpaRepository<Type, Long> {

}
