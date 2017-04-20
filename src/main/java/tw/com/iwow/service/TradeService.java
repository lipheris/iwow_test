package tw.com.iwow.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import tw.com.iwow.dao.MemberDao;
import tw.com.iwow.dao.RoleDao;
import tw.com.iwow.entity.Member;
import tw.com.iwow.entity.Role;

@Service
public class TradeService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private RoleDao roleDao;
public Boolean advancedMember(){
	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	String currentPrincipalName = authentication.getName();
	Member member = memberDao.findByEmail(currentPrincipalName);
	Role role = roleDao.findOne(3L);
	member.addRole(role);
	memberDao.save(member);
	return true;
}
}
