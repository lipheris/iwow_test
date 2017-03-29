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
	@OneToMany(orphanRemoval = true, fetch = FetchType.LAZY, cascade = { CascadeType.MERGE,
			CascadeType.REFRESH }, mappedBy = "uploader")
	private Set<Picture> picUploads;
	// @OneToMany(orphanRemoval = true, fetch = FetchType.LAZY, cascade =
	// CascadeType.ALL, mappedBy = "collector")
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(	name = "PIC_COLLS", 
				joinColumns = @JoinColumn(name = "COL_ID", referencedColumnName = "ID"), 
				inverseJoinColumns = @JoinColumn(name = "PIC_ID", referencedColumnName = "ID"))
	private Set<Picture> picColls;
	@OneToMany(orphanRemoval = true, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "MEM_ID", referencedColumnName = "ID")
	private Set<Order> orders;
	// private Collection<? extends GrantedAuthority> authorities;
	@OneToMany(orphanRemoval = true, fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "MEM_ID", referencedColumnName = "ID")
	private Set<MemRole> memRoles;
	@OneToMany(orphanRemoval = true, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "DONOR_ID", referencedColumnName = "ID")
	private Set<Donation> donations;
	@OneToMany(orphanRemoval = true, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "REC_ID", referencedColumnName = "ID")
	private Set<Donation> recDonations;
	@OneToMany(orphanRemoval = true, fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "member")
	private Set<GroupMem> groups;

}
