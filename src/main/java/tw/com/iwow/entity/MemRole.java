package tw.com.iwow.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import tw.com.iwow.entity.id.MemRoleId;

@Entity
@Table(name = "MEM_ROLES")
@IdClass(MemRoleId.class)
public class MemRole {
	@Id
	@Column(name = "mem_id")
	private Long memberId;
	@Id
	@Column(name = "ROLE_ID")
	private Long roleId;
	@ManyToOne
	@PrimaryKeyJoinColumn(name = "ROLE_ID", referencedColumnName = "ID")
	private Role role;

	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

}
