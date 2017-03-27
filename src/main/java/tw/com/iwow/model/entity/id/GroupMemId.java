package tw.com.iwow.model.entity.id;

import java.io.Serializable;

@SuppressWarnings("serial")
public class GroupMemId implements Serializable {
	private Long memberId;
	private Long groupId;

	public GroupMemId() {
	}

	public GroupMemId(Long memberId, Long groupId) {
		this.memberId = memberId;
		this.groupId = groupId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((groupId == null) ? 0 : groupId.hashCode());
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GroupMemId other = (GroupMemId) obj;
		if (groupId == null) {
			if (other.groupId != null)
				return false;
		} else if (!groupId.equals(other.groupId))
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "GroupMemId [memberId=" + memberId + ", groupId=" + groupId + "]";
	}

}
