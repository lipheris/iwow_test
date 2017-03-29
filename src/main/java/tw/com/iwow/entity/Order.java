package tw.com.iwow.entity;

import java.sql.Clob;
import java.time.LocalDateTime;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "ORDERS")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;
	@Column(name = "D_UPDATE")
	private LocalDateTime update;
	@Column(name = "DESC")
	private Clob desc;// 針對order 補充說明
	@ManyToOne(optional = false, fetch = FetchType.LAZY)
	@JoinColumn(name = "MEM_ID")
	private Member orderMem; // 說明下訂人員
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "ORDER_ID", referencedColumnName = "ID")
	private Set<OrderDetail> orderDetails;
	// add field total price from orderDetails?
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public LocalDateTime getUpdate() {
		return update;
	}
	public void setUpdate(LocalDateTime update) {
		this.update = update;
	}
	public Clob getDesc() {
		return desc;
	}
	public void setDesc(Clob desc) {
		this.desc = desc;
	}
	public Member getOrderMem() {
		return orderMem;
	}
	public void setOrderMem(Member orderMem) {
		this.orderMem = orderMem;
	}
	public Set<OrderDetail> getOrderDetails() {
		return orderDetails;
	}
	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

}
