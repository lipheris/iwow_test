package tw.com.iwow.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

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
		System.out.println(member);
		//準備存放錯誤訊息的Map物件
		Map<String,String> errorMsg = new HashMap<String,String>(); //存放錯誤訊息

		//檢查使用者輸入的資料
		if(member.getEmail().trim().length() == 0 || member.getEmail() == null){
			errorMsg.put("error", "error");
		}
		if(member.getPassword().trim().length() == 0 || member.getPassword() == null){
			errorMsg.put("error", "error");
		}
		if(member.getName().trim().length() == 0 || member.getName() == null){
			errorMsg.put("error", "error");
		}
		if(member.getNickname().trim().length() == 0 || member.getNickname() == null){
			errorMsg.put("error", "error");
		}
		if(member.getGender() == null){
			errorMsg.put("error", "error");
		}
		if(member.getBirth() == null){
			errorMsg.put("error", "error");
		}
		if(member.getPhone().trim().length() == 0 || member.getPhone() == null){
			errorMsg.put("error", "error");
		}
		if(member.getAddress().trim().length() == 0 || member.getAddress() == null){
			errorMsg.put("error", "error");
		}
		
		if (!errorMsg.isEmpty()) { //如果資料輸入有誤
			return null;
		}
		
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
