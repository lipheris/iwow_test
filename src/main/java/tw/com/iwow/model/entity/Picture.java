package tw.com.iwow.model.entity;

import java.sql.Blob;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "PICTURES")
public class Picture {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private Long id;
	// assort 為分類普通/ 18禁圖片
	private Integer assort;
	private String name;
	private LocalDateTime update;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "UP_ID")
	private Member uploader;
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "picture")
	private Set<PicColl> picColls;
	// visibility 為區分公開/ 私人
	private boolean visibility;
	private Blob file;
	@OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "STA_ID")
	private Stats stats;
	@OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "REP_ID")
	private Report report;
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "PIC_ID", referencedColumnName = "ID")
	private Set<Spec> specs;
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "picture")
	private Set<TagDetail> tagDetails;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getAssort() {
		return assort;
	}

	public void setAssort(Integer assort) {
		this.assort = assort;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public LocalDateTime getUpdate() {
		return update;
	}

	public void setUpdate(LocalDateTime update) {
		this.update = update;
	}

	public boolean isVisibility() {
		return visibility;
	}

	public void setVisibility(boolean visibility) {
		this.visibility = visibility;
	}

	public Blob getFile() {
		return file;
	}

	public void setFile(Blob file) {
		this.file = file;
	}

	public Stats getStats() {
		return stats;
	}

	public void setStats(Stats stats) {
		this.stats = stats;
	}

	public Report getReport() {
		return report;
	}

	public void setReport(Report report) {
		this.report = report;
	}

	public Set<Spec> getSpecs() {
		return specs;
	}

	public void setSpecs(Set<Spec> specs) {
		this.specs = specs;
	}

	public Set<TagDetail> getTagDetails() {
		return tagDetails;
	}

	public void setTagDetails(Set<TagDetail> tagDetails) {
		this.tagDetails = tagDetails;
	}
}
