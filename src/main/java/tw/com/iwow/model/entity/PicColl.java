package tw.com.iwow.model.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "PIC_COLLS")//因為picture and member 有些動作互相來回 透過此table 分成一對多關係方便處理
public class PicColl {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@ManyToOne(cascade = CascadeType.REFRESH)
	@JoinColumn(name = "PIC_ID")
	private Picture picture;
	@ManyToOne(cascade = CascadeType.REFRESH)
	@JoinColumn(name = "COL_ID")
	private Member collector;

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

	public Member getCollector() {
		return collector;
	}

	public void setCollector(Member collector) {
		this.collector = collector;
	}
}
