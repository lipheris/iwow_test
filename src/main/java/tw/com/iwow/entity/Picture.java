package tw.com.iwow.entity;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonView;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import tw.com.iwow.enums.Assort;
import tw.com.iwow.enums.Visibility;
import tw.com.iwow.web.jsonview.Views;

@Entity
@Table(name = "PICTURES")
public class Picture {
	@Expose
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;
	// assort 為分類普通/ 18禁圖片
	@Enumerated(EnumType.STRING)
	@Column(name = "ASSORT")
	private Assort assort;
	@Expose
	@JsonView(Views.PictureDetails.class)
	@Column(name = "NAME")
	private String name;
	@Expose
	@Column(name = "DATE_UPDATE") // database column 好像禁用update 所以使用date_update
	private LocalDateTime update;
	@Expose
	@SerializedName("uploader_id")
	@JsonView(Views.PictureDetails.class)
	@Column(name = "UPLOADER_ID")
	private Long uploaderId;
	@Enumerated(EnumType.STRING)
	@Column(name = "VISIBILITY")
	private Visibility visibility;// visibility 為區分公開/ 私人
	@Expose
	@Column(name = "DESCRIPTION")
	private String description;
	@Expose
	@SerializedName("picture_address")
	@Column(name = "PICTURE_ADDRESS")
	private String pictureAddress;
	public String getPictureAddress() {
		return pictureAddress;
	}

	public void setPictureAddress(String pictureAddress) {
		this.pictureAddress = pictureAddress;
	}

	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "PIC_ID", referencedColumnName = "ID")
	private Set<Stats> stats;
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "PIC_ID", referencedColumnName = "ID")
	private Set<Spec> specs;
	/*
	 * 與Tag建立雙向@ManyToMany，Picture為主控方
	 */
	@ManyToMany(cascade={CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH})
	@JoinTable(name = "TAG_DETAILS", joinColumns = @JoinColumn(name = "PIC_ID", referencedColumnName = "ID"), inverseJoinColumns = @JoinColumn(name = "TAG_ID", referencedColumnName = "ID"))
	private Set<Tag> tags;
	/*
	 * 
	 */
	@ManyToMany(mappedBy="picColls")
	private Set<Member> collectors;
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

	public Set<Member> getCollectors() {
		return collectors;
	}

	public void setCollectors(Set<Member> collectors) {
		this.collectors = collectors;
	}
	public void addTag(Tag tag){
		this.tags.add(tag);
	}
	public void removeTag(Tag tag){
		this.tags.remove(tag);
	}
	public void addTags(Collection<Tag> tags){
		this.tags.addAll(tags);
	}
	public void removeTags(Collection<Tag> tags){
		this.tags.removeAll(tags);
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
