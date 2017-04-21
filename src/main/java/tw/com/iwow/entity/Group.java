package tw.com.iwow.entity;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonView;

import tw.com.iwow.web.jsonview.Views;

@Entity
@Table(name = "GROUPS")
public class Group {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;
	
	@JsonView(value = {Views.ShowGroups.class})
	@Column(name = "NAME")
	private String name; 
	
	@JsonView(value = {Views.ShowGroups.class})
	@Column(name="PHOTO_ADDRESS")
	private String photoAd;
	
	@JsonView(value = {Views.ShowGroups.class})	
	@Column(name="GROUP_CREATOR")
	private Long memid;
	
	@JsonView(value = {Views.ShowGroups.class,Views.MemDetails.class })
	@ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.MERGE, CascadeType.REFRESH})
	@JoinTable(	name = "GROUP_MEMS", 
				joinColumns = @JoinColumn(name = "GROUP_ID", referencedColumnName = "ID"), 
				inverseJoinColumns = @JoinColumn(name = "MEM_ID", referencedColumnName = "ID"))
	private Set<Member> members=new HashSet<Member>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhotoAd() {
		return photoAd;
	}

	public void setPhotoAd(String photoAd) {
		this.photoAd = photoAd;
	}
	
	public Long getMemid() {
		return memid;
	}

	public void setMemid(Long memid) {
		this.memid = memid;
	}

	public Set<Member> getMembers() {
		return members;
	}

	public void setMembers(Set<Member> members) {
		this.members = members;
	}
	
	public void addMember(Member member){
		if (!(this.members.contains(member)))
		this.members.add(member);
//		if(member.getGroups()!=this)
//			member.setGroups(this);
		
	}
	public void removeMember(Member member){
		if (this.members.contains(member))
			this.members.remove(member);
	}
	
	public void addMembers(Collection<Member> members){
		this.members.addAll(members);
	}
	public void removeMembers(Collection<Member> members){
		this.members.removeAll(members);
	}

	@Override
	public String toString() {
		return "Group [id=" + id + ", name=" + name + ", members=" + members + "]";
	}
}
