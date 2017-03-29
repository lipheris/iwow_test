package tw.com.iwow.entity;

import java.math.BigDecimal;
import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "SPECS")
public class Spec {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;
	@Column(name = "SIZE")
	private Integer size;// 每張圖之解析度
	// use enums?
	@Column(name = "PRICE")
	private BigDecimal price;// 單圖對應各種解析度之定價
	@Column(name = "PIC_ID")
	private Long picId;
	@Column(name = "FILE_S") // database file 欄位好像不可使用file 故對應為file_s
	private Blob file;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Long getPicId() {
		return picId;
	}

	public void setPicId(Long picId) {
		this.picId = picId;
	}

	public Blob getFile() {
		return file;
	}

	public void setFile(Blob file) {
		this.file = file;
	}

}
