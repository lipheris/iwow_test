package tw.com.iwow.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import tw.com.iwow.entity.id.OrderDetailId;

@Entity
@Table(name = "ORDER_DETAILS") // oderDetail 為記錄每次訂單內容,因單次可有多筆訂單,拆出orderDetail
public class OrderDetail {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@Column(name = "ORDER_ID")
	private Long orderId;

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

}
