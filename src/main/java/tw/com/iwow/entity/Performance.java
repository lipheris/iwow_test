package tw.com.iwow.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
@Entity
@Table(name="PERFORMANCE")
public class Performance {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private Double shoppingTotal;
	private Double qShoppingTotal;
	private Double shoppingTotalPerMonth;
	private Double shoppingTotalPerWeek;
	private Date shoppingDate;
	@OneToOne(mappedBy="performance")
	private Photo photo;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Double getShoppingTotal() {
		return shoppingTotal;
	}

	public void setShoppingTotal(Double shoppingTotal) {
		this.shoppingTotal = shoppingTotal;
	}

	public Double getqShoppingTotal() {
		return qShoppingTotal;
	}

	public void setqShoppingTotal(Double qShoppingTotal) {
		this.qShoppingTotal = qShoppingTotal;
	}

	public Double getShoppingTotalPerMonth() {
		return shoppingTotalPerMonth;
	}

	public void setShoppingTotalPerMonth(Double shoppingTotalPerMonth) {
		this.shoppingTotalPerMonth = shoppingTotalPerMonth;
	}

	public Double getShoppingTotalPerWeek() {
		return shoppingTotalPerWeek;
	}

	public void setShoppingTotalPerWeek(Double shoppingTotalPerWeek) {
		this.shoppingTotalPerWeek = shoppingTotalPerWeek;
	}

	public Date getShoppingDate() {
		return shoppingDate;
	}

	public void setShoppingDate(Date shoppingDate) {
		this.shoppingDate = shoppingDate;
	}

	@Override
	public String toString() {
		return "Performance [id=" + id + ", shoppingTotal=" + shoppingTotal + ", qShoppingTotal=" + qShoppingTotal
				+ ", shoppingTotalPerMonth=" + shoppingTotalPerMonth + ", shoppingTotalPerWeek=" + shoppingTotalPerWeek
				+ ", shoppingDate=" + shoppingDate + "]";
	}

}
