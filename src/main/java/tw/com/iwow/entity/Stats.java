package tw.com.iwow.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "STATS")
// Stats 為針對每張圖之統計資料 ,如購買明細/每月銷售額
public class Stats {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;
	@OneToOne(mappedBy = "stats")
	@JoinColumn(name = "PIC_ID")
	private Picture pic;
	@Column(name = "VIEWS")
	private Long views = 0L;
	@Column(name = "LIKES")
	private Long likes = 0L;
	@Column(name = "REVIEWS")
	private Long reviews = 0L;
	@Column(name = "SCORES")
	private Long scores = 0L;
	@Column(name = "SAL_TOTAL")
	private Double salesTotal = 0.0;// salesTotal 為針對每張圖之總銷售額
	@Column(name = "Q_SAL_TOTAL")
	private Double quaSalesTotal = 0.0;// quaSalesTotal 為針對每張圖之總銷次數

	public Stats(Picture pic) {
		this.pic = pic;
	}

	public Stats() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Picture getPic() {
		return pic;
	}

	public void setPic(Picture pic) {
		this.pic = pic;
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

	public Long getViews() {
		return views;
	}

	public void setViews(Long views) {
		this.views = views;
	}

	public Long getLikes() {
		return likes;
	}

	public void setLikes(Long likes) {
		this.likes = likes;
	}

	public void addLikes() {
		this.likes++;
	}

	public void minusLikes() {
		if (this.likes > 0L)
			this.likes--;
	}

	public Long getReviews() {
		return reviews;
	}

	public void setReviews(Long reviews) {
		this.reviews = reviews;
	}

	public void addReviews() {
		this.reviews++;
	}

	public void minusReviews() {
		if (this.reviews > 0L)
			this.reviews--;
	}

	public Long getScores() {
		return scores;
	}

	public void setScores(Long scores) {
		this.scores = scores;
	}

	public void addScores() {
		this.scores++;
	}

	public void minusScores() {
		if (this.scores > 0L)
			this.scores--;
	}
}
