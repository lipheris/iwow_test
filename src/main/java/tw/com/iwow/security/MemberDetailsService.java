package tw.com.iwow.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import tw.com.iwow.dao.MemberDao;
import tw.com.iwow.entity.Member;

@Service
public class MemberDetailsService implements UserDetailsService {
	@Autowired
	private MemberDao memberDao;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		Member member = memberDao.findByEmail(email);
		if(member != null){
			return new MemberDetails(member);
		}else{
			throw new UsernameNotFoundException("user is denied");
		}
	}

}
