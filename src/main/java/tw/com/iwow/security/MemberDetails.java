package tw.com.iwow.security;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.StringUtils;

import tw.com.iwow.entity.Member;
import tw.com.iwow.entity.Role;

public class MemberDetails extends Member implements UserDetails {
	
	private static final long serialVersionUID = 1L;
	private Set<String> auths = new HashSet<>();
	public MemberDetails(Member member) {
		super(member);
		for(Role role:member.getRoles()){
			auths.add(role.getAuth());
		}
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		String authString = StringUtils.collectionToCommaDelimitedString(auths);
		return AuthorityUtils.commaSeparatedStringToAuthorityList(authString);
	}

	@Override
	public String getUsername() {
		return super.getEmail();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	public Set<String> getAuths() {
		return auths;
	}

	public void setAuths(Set<String> auths) {
		this.auths = auths;
	}

}
