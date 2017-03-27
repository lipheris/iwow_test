package tw.com.iwow.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tw.com.iwow.entity.Member;
@Repository
public interface MemberDao extends JpaRepository<Member, Long> {

	public Member findByEmail(String email);
}
