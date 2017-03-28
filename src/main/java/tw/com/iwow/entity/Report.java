package tw.com.iwow.entity;

import java.sql.Clob;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "REPORTS")
public class Report {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private Clob descript;// 檢舉敘述
	private LocalDateTime date;

	// state 為區分report 狀態為處理/未處理
	private Boolean state;
//	@ManyToOne(optional = false, fetch = FetchType.LAZY)
//	@Column(nullable = false)
//	@JoinColumn(name = "PIC_ID")
//	private Picture picture;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Clob getDescript() {
		return descript;
	}

	public void setDescript(Clob descript) {
		this.descript = descript;
	}

	public LocalDateTime getDate() {
		return date;
	}

	public void setDate(LocalDateTime date) {
		this.date = date;
	}

	public Boolean getState() {
		return state;
	}

	public void setState(Boolean state) {
		this.state = state;
	}

//	public Picture getPicture() {
//		return picture;
//	}
//
//	public void setPicture(Picture picture) {
//		this.picture = picture;
//	}

//	@Override
//	public String toString() {
//		return "Report [id=" + id + ", descript=" + descript + ", date=" + date + ", state=" + state + ", picture="
//				+ picture.getId().toString() + " " + picture.getName() + "]";
//	}

}
