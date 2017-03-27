package tw.com.iwow.model.entity.id;

import java.io.Serializable;

@SuppressWarnings("serial")
public class PicCollId implements Serializable {
	private Long pictureId;
	private Long collectorId;

	public PicCollId() {
	}

	public PicCollId(Long pictureId, Long collectorId) {
		this.pictureId = pictureId;
		this.collectorId = collectorId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((collectorId == null) ? 0 : collectorId.hashCode());
		result = prime * result + ((pictureId == null) ? 0 : pictureId.hashCode());
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
		PicCollId other = (PicCollId) obj;
		if (collectorId == null) {
			if (other.collectorId != null)
				return false;
		} else if (!collectorId.equals(other.collectorId))
			return false;
		if (pictureId == null) {
			if (other.pictureId != null)
				return false;
		} else if (!pictureId.equals(other.pictureId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "PicCollId [pictureId=" + pictureId + ", collectorId=" + collectorId + "]";
	}

}
