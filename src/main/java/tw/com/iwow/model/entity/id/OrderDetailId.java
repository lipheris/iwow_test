package tw.com.iwow.model.entity.id;

import java.io.Serializable;

@SuppressWarnings("serial")
public class OrderDetailId implements Serializable {
	private Long orderId;
	private Long specId;

	public OrderDetailId() {
	}

	public OrderDetailId(Long orderId, Long specId) {
		this.orderId = orderId;
		this.specId = specId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((orderId == null) ? 0 : orderId.hashCode());
		result = prime * result + ((specId == null) ? 0 : specId.hashCode());
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
		OrderDetailId other = (OrderDetailId) obj;
		if (orderId == null) {
			if (other.orderId != null)
				return false;
		} else if (!orderId.equals(other.orderId))
			return false;
		if (specId == null) {
			if (other.specId != null)
				return false;
		} else if (!specId.equals(other.specId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "OrderDetailPk [orderId=" + orderId + ", specId=" + specId + "]";
	}

}
