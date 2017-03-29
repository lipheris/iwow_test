package tw.com.iwow.entity;

import java.sql.Clob;
import java.time.LocalDateTime;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "REPORTS")
public class Report {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;
	@Column(name = "DESC")
	private Clob desc;// 檢舉敘述
	@Column(name = "DATE")
	private LocalDateTime date;
	@Column(name = "STATE")
	// state 為區分report 狀態為處理/未處理
	private Boolean state;
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(	name = "REP_PICS", 
				joinColumns = @JoinColumn(name = "REP_ID", referencedColumnName = "ID"), 
				inverseJoinColumns = @JoinColumn(name = "PIC_ID", referencedColumnName = "ID"))
	private Set<Picture> pictures;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Clob getDesc() {
		return desc;
	}
	public void setDesc(Clob desc) {
		this.desc = desc;
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
	public Set<Picture> getPictures() {
		return pictures;
	}
	public void setPictures(Set<Picture> pictures) {
		this.pictures = pictures;
	}
}
