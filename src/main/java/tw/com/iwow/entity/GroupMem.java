package tw.com.iwow.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import tw.com.iwow.entity.id.GroupMemId;
import tw.com.iwow.entity.Group;
import tw.com.iwow.entity.Member;

@Entity
@Table(name = "GROUP_MEM")
@IdClass(GroupMemId.class)
public class GroupMem {
	@Id
	@Column(name = "MEM_ID")
	private Long memberId;
	@Id
	@Column(name = "GROUP_ID")
	private Long groupId;
	@ManyToOne
	@PrimaryKeyJoinColumn(name = "MEM_ID", referencedColumnName = "ID")
	private Member member;
	@ManyToOne
	@PrimaryKeyJoinColumn(name = "GROUP_ID", referencedColumnName = "ID")
	private Group group;

	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public Long getGroupId() {
		return groupId;
	}

	public void setGroupId(Long groupId) {
		this.groupId = groupId;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

}
