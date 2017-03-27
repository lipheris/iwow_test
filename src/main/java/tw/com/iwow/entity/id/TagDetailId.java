package tw.com.iwow.entity.id;

import java.io.Serializable;

@SuppressWarnings("serial")
public final class TagDetailId implements Serializable {
	private Long pictureId;
	private Long tagId;

	public TagDetailId() {
	}

	public TagDetailId(Long pictureId, Long tagId) {
		this.pictureId = pictureId;
		this.tagId = tagId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((pictureId == null) ? 0 : pictureId.hashCode());
		result = prime * result + ((tagId == null) ? 0 : tagId.hashCode());
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
		TagDetailId other = (TagDetailId) obj;
		if (pictureId == null) {
			if (other.pictureId != null)
				return false;
		} else if (!pictureId.equals(other.pictureId))
			return false;
		if (tagId == null) {
			if (other.tagId != null)
				return false;
		} else if (!tagId.equals(other.tagId))
			return false;
		return true;
	}

	public Long getPictureId() {
		return pictureId;
	}

	public void setPictureId(Long pictureId) {
		this.pictureId = pictureId;
	}

	public Long getTagId() {
		return tagId;
	}

	public void setTagId(Long tagId) {
		this.tagId = tagId;
	}

	@Override
	public String toString() {
		return "TagDetailPk [pictureId=" + pictureId + ", tagId=" + tagId + "]";
	}

}
