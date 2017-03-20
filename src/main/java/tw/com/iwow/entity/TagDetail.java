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
	private Integer id;
	// use composite primary key?
	// use joinTable?
	@ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.REFRESH, CascadeType.PERSIST })
	@JoinColumn(name = "PIC_ID")
	private Picture picture;
	@ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.REFRESH, CascadeType.PERSIST })
	@JoinColumn(name = "TAG_ID")
	private Tag tag;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
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
