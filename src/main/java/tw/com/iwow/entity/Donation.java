package tw.com.iwow.entity;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "DONATIONS")
public class Donation {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id; // 此id為查詢各donate 紀錄
	@Column(name = "TIME")
	private LocalDateTime time; // donate time
	@ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.MERGE, CascadeType.REFRESH})
	@JoinColumn(name = "DONOR_ID") // donate的人id
	private Member donor;
	@ManyToOne(optional = false, fetch = FetchType.LAZY)
	@Column(name = "REC_ID")
	private Member receiver; // 接受donate memberid
	@Column(name = "AMOUNT")
	private BigDecimal amount; // 單次donate 金額

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public LocalDateTime getTime() {
		return time;
	}

	public void setTime(LocalDateTime time) {
		this.time = time;
	}

	public Member getDonor() {
		return donor;
	}

	public void setDonor(Member donor) {
		this.donor = donor;
	}

	public Member getReceiver() {
		return receiver;
	}

	public void setReceiver(Member receiver) {
		this.receiver = receiver;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
}
