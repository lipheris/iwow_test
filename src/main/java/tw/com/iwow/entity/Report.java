package tw.com.iwow.entity;

//import java.sql.Clob;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "REPORT")
public class Report {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
//	private Clob reportDes;
	private Date reportDate;
	private Boolean reportStatus;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
//	public Clob getReportDes() {
//		return reportDes;
//	}
//	public void setReportDes(Clob reportDes) {
//		this.reportDes = reportDes;
//	}
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

}
