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

@Entity
@Table(name = "GROUPS")
public class Group {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;
	@Column(name = "NAME")
	private String name; // group name, ex:line 群組EEIT92的名字
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

	public Set<Member> getMembers() {
		return members;
	}

	public void setMembers(Set<Member> members) {
		this.members = members;
	}
	
	public void addMember(Member member){
		this.members.add(member);
	}
	public void removeMember(Member member){
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
