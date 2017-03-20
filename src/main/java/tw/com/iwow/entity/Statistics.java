package tw.com.iwow.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="STATISTICS")
public class Statistics  {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(name="SAL_TOTAL")
	private Double salesTotal;
	@Column(name="Q_SAL_TOTAL")
	private Double quaSalesTotal;
//	@Column(name="SAL_MONTHLY")
//	private Double salesMonthly;
//	@Column(name="SAL_WEEKLY")
//	private Double salesWeekly;

}
