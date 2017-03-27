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

import tw.com.iwow.entity.Member;

@Service("memberDetailsService")
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
				if (user.getPriority() == 1) {
					authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
				}
				if (user.getPriority() == 2) {
					authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
					authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
				}
				return new User(user.getEmail(), user.getPassword(), authorities);
			} catch (Exception e) {
				throw new UsernameNotFoundException("user is denied ");
			}

		}

	}

}
