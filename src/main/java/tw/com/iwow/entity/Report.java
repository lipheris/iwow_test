package tw.com.iwow.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "REPORT")
public class Report implements Serializable {

	/**
	 * 
	 */
	@Transient
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String reportDes;
	private Date reportDate;
	private Boolean reportStatus;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getReportDes() {
		return reportDes;
	}

	public void setReportDes(String reportDes) {
		this.reportDes = reportDes;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public Boolean getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(Boolean reportStatus) {
		this.reportStatus = reportStatus;
	}

	@Override
	public String toString() {
		return "Report [id=" + id + ", reportDes=" + reportDes + ", reportDate=" + reportDate + ", reportStatus="
				+ reportStatus + "]";
	}

}
