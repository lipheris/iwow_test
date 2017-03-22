package tw.com.iwow.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "TAG_DETAILS")
public class TagDetail {
	@Id
	private Long id;
	// use composite primary key?
	// use joinTable?
	@ManyToOne(fetch = FetchType.LAZY, cascade =  CascadeType.REFRESH)
	@JoinColumn(name = "PIC_ID")
	private Picture picture;
	@ManyToOne(fetch = FetchType.LAZY, cascade =  CascadeType.REFRESH)
	@JoinColumn(name = "TAG_ID")
	private Tag tag;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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
