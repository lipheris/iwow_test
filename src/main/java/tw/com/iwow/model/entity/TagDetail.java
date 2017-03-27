package tw.com.iwow.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import tw.com.iwow.model.entity.id.TagDetailId;

@Entity
@Table(name = "TAG_DETAILS") // tag與picture 為多對多關係 透過此來分拆成一對多
@IdClass(TagDetailId.class)
public class TagDetail {
	@Id
	@Column(name = "PIC_ID")
	private Long pictureId;
	@Id
	@Column(name = "TAG_ID")
	private Long tagId;
	@ManyToOne
	@PrimaryKeyJoinColumn(name = "PIC_ID", referencedColumnName = "ID")
	private Picture picture;
	@ManyToOne
	@PrimaryKeyJoinColumn(name = "TAG_ID", referencedColumnName = "ID")
	private Tag tag;

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

	public Picture getPicture() {
		return picture;
	}

	public void setPicture(Picture picture) {
		this.picture = picture;
	}

	public Tag getTag() {
		return tag;
	}

	public void setTag(Tag tag) {
		this.tag = tag;
	}

}
