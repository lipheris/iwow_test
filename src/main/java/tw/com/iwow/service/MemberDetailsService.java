package tw.com.iwow.service;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import tw.com.iwow.entity.MemRole;
import tw.com.iwow.entity.Member;

@Service
public class MemberDetailsService implements UserDetailsService {

	@Autowired
	private MemberService memberService;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		Member user;

		try {
			user = memberService.getByEmail(email);

		} catch (Exception e) {
			throw new UsernameNotFoundException("user select fail");
		}
		if (user == null) {
			throw new UsernameNotFoundException("no user found");
		} else {

			try {
				Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
				for (MemRole memRole : user.getMemRoles()) {
					String auth = memRole.getRole().getAuthority();
					if ("ROLE_USER".equals(auth))
						authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
					else if ("ROLE_ADMIN".equals(auth))
						authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
				}
				return new User(user.getEmail(), user.getPassword(), authorities);
			} catch (Exception e) {
				throw new UsernameNotFoundException("user is denied ");
			}

		}

	}

}
