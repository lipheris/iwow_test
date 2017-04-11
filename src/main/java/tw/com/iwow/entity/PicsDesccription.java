package tw.com.iwow.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "PICS_DESCRIPTION")//複合主鑑 對MEMBER 一對多 對PICTURE 一對多
public class PicsDesccription {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;
	@Column(name = "MEM_ID")
	private Long memId;
	@Column(name = "PIC_ID")
	private Long picId;
	@Column(name = "NOTE")
	private String note;
	@Column(name = "NOTE_UPDATE") 
	private LocalDateTime noteUpdate;
	
	
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
	public Long getPicId() {
		return picId;
	}
	public void setPicId(Long picId) {
		this.picId = picId;
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
	@Override
	public String toString() {
		return "PicsDesccription [id=" + id + ", memId=" + memId + ", picId=" + picId + ", note=" + note
				+ ", noteUpdate=" + noteUpdate + "]";
	}
	
	
}
