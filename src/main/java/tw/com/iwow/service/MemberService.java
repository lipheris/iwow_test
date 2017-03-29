package tw.com.iwow.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.com.iwow.dao.MemberDao;
import tw.com.iwow.entity.Member;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	public Member getByEmail(String email){
		return memberDao.findByEmail(email);
	}

	public Member findById(Long id) {
		return memberDao.findOne(id);
	}
	@Transactional
	public Member insert(Member member) {
		return memberDao.save(member);
	}

	public Member update(Member member) {
		return memberDao.save(member);
	}

	public void delete(Long id) {
		memberDao.delete(id);
	}

	public Collection<Member> findAll() {
		return memberDao.findAll();
	}

}
