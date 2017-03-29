package tw.com.iwow.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "STATS")
// Stats 為針對每張圖之統計資料 ,如購買明細/每月銷售額
public class Stats {
	@Id
	@Column(name = "ID")
	private Long id;
	@Column(name = "SAL_TOTAL")
	private Double salesTotal;// salesTotal 為針對每張圖之總銷售額
	@Column(name = "Q_SAL_TOTAL")
	private Double quaSalesTotal;// quaSalesTotal 為針對每張圖之總銷次數
	// @Column(name="SAL_MONTHLY")
	// private Double salesMonthly;
	// @Column(name="SAL_WEEKLY")
	// private Double salesWeekly;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Double getSalesTotal() {
		return salesTotal;
	}
	public void setSalesTotal(Double salesTotal) {
		this.salesTotal = salesTotal;
	}
	public Double getQuaSalesTotal() {
		return quaSalesTotal;
	}
	public void setQuaSalesTotal(Double quaSalesTotal) {
		this.quaSalesTotal = quaSalesTotal;
	}
}
