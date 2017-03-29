package tw.com.iwow.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ORDER_DETAILS") // oderDetail 為記錄每次訂單內容,因單次可有多筆訂單,拆出orderDetail
public class OrderDetail {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;
	@Column(name = "ORDER_ID")
	private Long orderId;
	@Column(name = "PIC_ID")
	private Long picId;
	@Column(name = "PIC_NAME")
	private String picName;
	@Column(name = "PIC_SPEC")
	private String picSpec;
	@Column(name = "PRICE")
	private BigDecimal price;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getOrderId() {
		return orderId;
	}
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	public Long getPicId() {
		return picId;
	}
	public void setPicId(Long picId) {
		this.picId = picId;
	}
	public String getPicName() {
		return picName;
	}
	public void setPicName(String picName) {
		this.picName = picName;
	}
	public String getPicSpec() {
		return picSpec;
	}
	public void setPicSpec(String picSpec) {
		this.picSpec = picSpec;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	
}
