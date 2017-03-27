package tw.com.iwow.model.entity.id;

import java.io.Serializable;

@SuppressWarnings("serial")
public class MemRoleId implements Serializable {
	private Long memberId;
	private Long roleId;

	public MemRoleId() {
	}

	public MemRoleId(Long memberId, Long roleId) {
		this.memberId = memberId;
		this.roleId = roleId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result + ((roleId == null) ? 0 : roleId.hashCode());
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
		MemRoleId other = (MemRoleId) obj;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (roleId == null) {
			if (other.roleId != null)
				return false;
		} else if (!roleId.equals(other.roleId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "MemRoleId [memberId=" + memberId + ", roleId=" + roleId + "]";
	}

}
