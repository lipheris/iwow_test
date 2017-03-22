package tw.com.iwow.model.entity;

import java.sql.Clob;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "REPORTS")
public class Report {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private Long id;
	private Clob descript;
	private LocalDateTime date;
	
	//state 為區分report 狀態為處理/未處理
	private Boolean state;

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

	@Override
	public String toString() {
		return "Report [id=" + id + ", date=" + date + ", status=" + state + "]";
	}

}
