package tw.com.iwow.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.com.iwow.entity.Member;

public interface MemberDao extends JpaRepository<Member, Long> {

	public Member findByEmail(String email);
}
