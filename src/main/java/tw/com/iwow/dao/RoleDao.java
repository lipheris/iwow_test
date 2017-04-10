package tw.com.iwow.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.iwow.entity.Role;

public interface RoleDao extends JpaRepository<Role, Long> {

}
