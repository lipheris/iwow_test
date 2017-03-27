package tw.com.iwow.entity;

import java.sql.Blob;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
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

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name = "MEMBERS")

public class Member {
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
	//private LocalDateTime birth;
	private String phone;
	private String address;
	private Integer priority;//會員等級 以數字區分方便擴充
	// enum?
	//private Blob photo;
	@OneToMany(orphanRemoval=true, fetch = FetchType.LAZY, cascade = CascadeType.REMOVE, mappedBy = "uploader")
	private Set<Picture> uploadPics;
	@OneToMany(orphanRemoval=true, fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "collector")
	private Set<PicColl> picColls;
	@OneToMany(orphanRemoval=true, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "MEM_ID", referencedColumnName = "ID")
	private Set<Order> orders;
	// private Collection<? extends GrantedAuthority> authorities;
	@OneToMany(orphanRemoval=true, fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "MEM_ID", referencedColumnName = "ID")
	private Set<MemRole> memRoles;
	@OneToMany(orphanRemoval=true, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "DONOR_ID", referencedColumnName = "ID")
	private Set<Donation> donations;
	@OneToMany(orphanRemoval=true, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "REC_ID", referencedColumnName = "ID")
	private Set<Donation> recDonations;
	@OneToMany(orphanRemoval=true, fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "member")
	private Set<GroupMem> groups;
	
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
	public Set<Picture> getUploadPics() {
		return uploadPics;
	}
	public void setUploadPics(Set<Picture> uploadPics) {
		this.uploadPics = uploadPics;
	}
	public Set<PicColl> getPicColls() {
		return picColls;
	}
	public void setPicColls(Set<PicColl> picColls) {
		this.picColls = picColls;
	}
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	public Set<MemRole> getMemRoles() {
		return memRoles;
	}
	public void setMemRoles(Set<MemRole> memRoles) {
		this.memRoles = memRoles;
	}
	public Set<Donation> getDonations() {
		return donations;
	}
	public void setDonations(Set<Donation> donations) {
		this.donations = donations;
	}
	public Set<Donation> getRecDonations() {
		return recDonations;
	}
	public void setRecDonations(Set<Donation> recDonations) {
		this.recDonations = recDonations;
	}
	public Set<GroupMem> getGroups() {
		return groups;
	}
	public void setGroups(Set<GroupMem> groups) {
		this.groups = groups;
	}



	
	

}
