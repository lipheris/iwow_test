package tw.com.iwow.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="STATS")

//Stats 為針對每張圖之統計資料 ,如購買明細/每月銷售額
public class Stats  {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private Long id;
	@Column(name="SAL_TOTAL")
	
	//salesTotal 為針對每張圖之總銷售額
	private Double salesTotal;
	
	//quaSalesTotal 為針對每張圖之總銷次數
	@Column(name="Q_SAL_TOTAL")
	private Double quaSalesTotal;
//	@Column(name="SAL_MONTHLY")
//	private Double salesMonthly;
//	@Column(name="SAL_WEEKLY")
//	private Double salesWeekly;
}
