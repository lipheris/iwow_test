package tw.com.iwow.entity;

import java.sql.Blob;
import java.time.LocalDateTime;
<<<<<<< HEAD
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
=======
>>>>>>> branch 'master' of https://github.com/FaGao/iwow_test.git
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

<<<<<<< HEAD
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

=======
>>>>>>> branch 'master' of https://github.com/FaGao/iwow_test.git
@Entity
@Table(name = "MEMBERS")
public class Member implements UserDetails {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private Long id;
	private String email;
	private String password;
	private String name;
	private String nickname;
	private Integer gender;
	// enum?
	private LocalDateTime birth;
	private String phone;
	private String address;
	// more detail?
	private Integer priority;
	// enum?
	private Blob photo;
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.REMOVE, mappedBy = "uploader")
	private Set<Picture> uploadPics;
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "collector")
	private Set<PicColl> picColls;
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "MEM_ID", referencedColumnName = "ID")
	private Set<Order> orders;
	// private Collection<? extends GrantedAuthority> authorities;
	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "MEM_ID", referencedColumnName = "ID")
	private Set<MemRole> memRoles;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public LocalDateTime getBirth() {
		return birth;
	}

	public void setBirth(LocalDateTime birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getPriority() {
		return priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public Blob getPhoto() {
		return photo;
	}

	public void setPhoto(Blob photo) {
		this.photo = photo;
	}

	public Set<MemRole> getMemRoles() {
		return memRoles;
	}

	public void setMemRoles(Set<MemRole> memRoles) {
		this.memRoles = memRoles;
	}
<<<<<<< HEAD
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		Iterator<MemRole> memRoles = getMemRoles().iterator();
		while(memRoles.hasNext()){
			MemRole memRole = ((MemRole)memRoles.next());
			authorities.add(new SimpleGrantedAuthority(memRole.getRole().getAuthority()));
		}
		return authorities;
	}
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return name;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
	
=======

>>>>>>> branch 'master' of https://github.com/FaGao/iwow_test.git
}
