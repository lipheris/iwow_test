package tw.com.iwow.entity;

import java.sql.Blob;
import java.time.LocalDateTime;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import tw.com.iwow.enums.Assort;
import tw.com.iwow.enums.Visibility;
import tw.com.iwow.enums.converter.AssortConverter;
import tw.com.iwow.enums.converter.VisConverter;

@Entity
@Table(name = "PICTURES")
public class Picture {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;
	// assort 為分類普通/ 18禁圖片
	@Convert(converter = AssortConverter.class)
	@Column(name = "ASSORT")
	private Assort assort;
	@Column(name = "NAME")
	private String name;
	@Column(name = "DATE_UPDATE") // database column 好像禁用update 所以使用date_update
	private LocalDateTime update;
	@Column(name = "UPLOADER_ID")
	private Long uploaderId;
	@Convert(converter = VisConverter.class)
	@Column(name = "VISIBILITY")
	private Visibility visibility;// visibility 為區分公開/ 私人
	@Column(name = "FILE_P")
	private Blob file;
	@OneToMany(orphanRemoval = true, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "PIC_ID", referencedColumnName = "ID")
	private Set<Stats> stats;
	@OneToMany(orphanRemoval = true, fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "PIC_ID", referencedColumnName = "ID")
	private Set<Spec> specs;
	/*
	 * 與Tag建立雙向@ManyToMany，Picture為主控方
	 */
	@ManyToMany
	@JoinTable(name = "TAG_DETAILS", joinColumns = @JoinColumn(name = "PIC_ID", referencedColumnName = "ID"), inverseJoinColumns = @JoinColumn(name = "TAG_ID", referencedColumnName = "ID"))
	private Set<Tag> tags;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Assort getAssort() {
		return assort;
	}

	public void setAssort(Assort assort) {
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

	public Long getUploaderId() {
		return uploaderId;
	}

	public void setUploaderId(Long uploaderId) {
		this.uploaderId = uploaderId;
	}

	public Visibility getVisibility() {
		return visibility;
	}

	public void setVisibility(Visibility visibility) {
		this.visibility = visibility;
	}

	public Blob getFile() {
		return file;
	}

	public void setFile(Blob file) {
		this.file = file;
	}

	public Set<Stats> getStats() {
		return stats;
	}

	public void setStats(Set<Stats> stats) {
		this.stats = stats;
	}

	public Set<Spec> getSpecs() {
		return specs;
	}

	public void setSpecs(Set<Spec> specs) {
		this.specs = specs;
	}

	public Set<Tag> getTags() {
		return tags;
	}

	public void setTags(Set<Tag> tags) {
		this.tags = tags;
	}
}
