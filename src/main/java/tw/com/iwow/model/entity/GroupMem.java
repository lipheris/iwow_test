package tw.com.iwow.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import tw.com.iwow.model.entity.id.GroupMemId;

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

}
