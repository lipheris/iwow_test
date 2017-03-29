package tw.com.iwow.entity;

import java.time.LocalDateTime;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import tw.com.iwow.entity.enums.Gender;

@Entity
@Table(name = "MEMBERS")

public class Member {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;
	@Column(name = "EMAIL")
	private String email;
	@Column(name = "PASSWORD")
	private String password;
	@Column(name = "NAME")
	private String name;
	@Column(name = "NICKNAME")
	private String nickname;
	@Enumerated(EnumType.STRING)
	@Column(name = "GENDER")
	private Gender gender;
	@Column(name = "BIRTH")
	private LocalDateTime birth;
	@Column(name = "PHONE")
	private String phone;
	@Column(name = "ADDRESS")
	private String address;
	// private Blob photo;
	/*
	 * 以上傳者身分對Picture建立@OneToMany雙向關聯，Picture為主控方
	 */
	@OneToMany(orphanRemoval = true, fetch = FetchType.LAZY, mappedBy = "uploader")
	private Set<Picture> picUploads;
	/*
	 * 以收藏者身分對Picture建立@ManyToMany單向關聯
	 */
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(	name = "PIC_COLLS", 
				joinColumns = @JoinColumn(name = "COL_ID", referencedColumnName = "ID"), 
				inverseJoinColumns = @JoinColumn(name = "PIC_ID", referencedColumnName = "ID"))
	private Set<Picture> picColls;
	/*
	 * 以下單者身分對Order建立@OneToMany雙向關聯
	 */
	@OneToMany(orphanRemoval = true, fetch = FetchType.LAZY, mappedBy = "orderMem")
	private Set<Order> orders;
	/*
	 * 對角色身分table建立@ManytoMany單向關聯
	 */
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable( name = "MEM_ROLES", 
				joinColumns = @JoinColumn(name = "MEM_ID", referencedColumnName = "ID"), 
				inverseJoinColumns = @JoinColumn(name = "ROLE_ID", referencedColumnName = "ID"))
	private Set<Role> roles;
	/*
	 * 斗內雙方與斗內資料建立@OneToMany關聯,主控方在Donation
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "donor")
	@JoinColumn(name = "DONOR_ID", referencedColumnName = "ID")
	private Set<Donation> donations;
	@OneToMany(orphanRemoval = true, fetch = FetchType.LAZY, mappedBy = "receiver")
	@JoinColumn(name = "REC_ID", referencedColumnName = "ID")
	private Set<Donation> recDonations;
	@OneToMany(orphanRemoval = true, fetch = FetchType.LAZY, mappedBy = "member")
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
	public Gender getGender() {
		return gender;
	}
	public void setGender(Gender gender) {
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
	public Set<Picture> getPicUploads() {
		return picUploads;
	}
	public void setPicUploads(Set<Picture> picUploads) {
		this.picUploads = picUploads;
	}
	public Set<Picture> getPicColls() {
		return picColls;
	}
	public void setPicColls(Set<Picture> picColls) {
		this.picColls = picColls;
	}
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
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
