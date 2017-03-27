package tw.com.iwow.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import tw.com.iwow.entity.id.PicCollId;

@Entity
@Table(name = "PIC_COLLS") // 因為picture and member 有些動作互相來回 透過此table 分成一對多關係方便處理
@IdClass(PicCollId.class)
public class PicColl {
	@Id
	@Column(name = "PIC_ID")
	private Long pictureId;
	@Id
	@Column(name = "COL_ID")
	private Long collectorId;
	@ManyToOne
	@PrimaryKeyJoinColumn(name = "pic_id", referencedColumnName = "ID")
	private Picture picture;
	@ManyToOne
	@PrimaryKeyJoinColumn(name = "col_id", referencedColumnName = "ID")
	private Member collector;

	public Long getPictureId() {
		return pictureId;
	}

	public void setPictureId(Long pictureId) {
		this.pictureId = pictureId;
	}

	public Long getCollectorId() {
		return collectorId;
	}

	public void setCollectorId(Long collectorId) {
		this.collectorId = collectorId;
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
