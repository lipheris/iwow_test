package tw.com.iwow.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.iwow.model.entity.Member;

public interface MemberDao extends JpaRepository<Member, Long> {

}
