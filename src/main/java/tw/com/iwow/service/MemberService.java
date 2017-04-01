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
	@Transactional
	public Member update(Member member) {
		Member mem=findById(member.getId());
		if(mem!=null){
			if(isNotNull(member.getName()))
				mem.setName(member.getName());
			if(isNotNull(member.getNickname()))
				mem.setNickname(member.getNickname());
			if(isNotNull(member.getGender()))
				mem.setGender(member.getGender());
			if(isNotNull(member.getEmail()))
				mem.setEmail(member.getEmail());
			if(isNotNull(member.getPassword()))
				mem.setPassword(member.getPassword());
			if(isNotNull(member.getPhone()))
				mem.setPhone(member.getPhone());
			if(isNotNull(member.getAddress()))
				mem.setAddress(member.getAddress());
			if(isNotNull(member.getBirth()))
				mem.setBirth(member.getBirth());
		}
		return mem;
	}
	private <T> boolean isNotNull(T obj){
		if(obj!=null)
			return true;
		else
			return false;
	}
	public void delete(Long id) {
		memberDao.delete(id);
	}

	public Collection<Member> findAll() {
		return memberDao.findAll();
	}

}
