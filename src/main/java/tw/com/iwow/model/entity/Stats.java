package tw.com.iwow.model.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
// Stats 為針對每張圖之統計資料 ,如購買明細/每月銷售額
public class Stats {

	@Column(name = "sal_tatal")
	private Double salesTotal;// salesTotal 為針對每張圖之總銷售額
	@Column(name = "q_sal_total")
	private Double quaSalesTotal;// quaSalesTotal 為針對每張圖之總銷次數
	// @Column(name="SAL_MONTHLY")
	// private Double salesMonthly;
	// @Column(name="SAL_WEEKLY")
	// private Double salesWeekly;
}
