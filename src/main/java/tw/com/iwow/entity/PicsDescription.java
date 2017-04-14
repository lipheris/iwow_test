package tw.com.iwow.entity;

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
@Table(name = "PICS_DESCRIPTION")
public class PicsDescription {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;
	@Column(name = "MEM_ID")
	private Long memId;
	@Column(name = "NOTE")
	private String note;
	@Column(name = "NOTE_UPDATE") 
	private LocalDateTime noteUpdate;
	@ManyToOne(fetch = FetchType.LAZY, optional=false)
	@JoinColumn(name = "PIC_ID", referencedColumnName = "ID")
	private Picture picture;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getMemId() {
		return memId;
	}
	public void setMemId(Long memId) {
		this.memId = memId;
	}
	
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public LocalDateTime getNoteUpdate() {
		return noteUpdate;
	}
	public void setNoteUpdate(LocalDateTime noteUpdate) {
		this.noteUpdate = noteUpdate;
	}
	public Picture getPicture() {
		return picture;
	}
	public void setPicture(Picture picture) {
		this.picture = picture;
	}
	
	
	
}
