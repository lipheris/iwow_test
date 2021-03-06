package tw.com.iwow.entity;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.HashSet;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonView;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import tw.com.iwow.enums.Assort;
import tw.com.iwow.enums.Visibility;
import tw.com.iwow.web.jsonview.Views;

@JsonIdentityInfo(generator = ObjectIdGenerators.UUIDGenerator.class, property = "picture_uuid")
@Entity
@Table(name = "PICTURES")
public class Picture {
	@Expose
	@JsonView(value = { Views.ShowPicture.class, Views.ShowTag.class })
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;
	// assort 為分類普通/ 18禁圖片
	@JsonView(value = { Views.ShowPicture.class, Views.ShowTag.class })
	@Enumerated(EnumType.STRING)
	@Column(name = "ASSORT")
	private Assort assort;
	@Expose
	@JsonView(value = { Views.PictureDetails.class, Views.ShowPicture.class, Views.ShowTag.class})
	@Column(name = "NAME")
	private String name;
	@Expose
	@JsonView(value = { Views.ShowPicture.class, Views.ShowTag.class })
	@Column(name = "DATE_UPDATE") // database column 好像禁用update 所以使用date_update
	private LocalDateTime update;
	@JsonView(value = { Views.ShowPicture.class, Views.ShowTag.class })
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "UPLOADER_ID", referencedColumnName = "ID")
	private Member uploader;
	@Enumerated(EnumType.STRING)
	@Column(name = "VISIBILITY")
	private Visibility visibility;// visibility 為區分公開/ 私人
	@Expose
	@JsonView(value = { Views.ShowPicture.class, Views.ShowTag.class })
	@Column(name = "DESCRIPTION")
	private String description;
	@Expose
	@SerializedName("picture_address")
	@JsonView(value = { Views.ShowPicture.class, Views.ShowTag.class })
	@Column(name = "PICTURE_ADDRESS")
	private String pictureAddress;

	public String getPictureAddress() {
		return pictureAddress;
	}

	public void setPictureAddress(String pictureAddress) {
		this.pictureAddress = pictureAddress;
	}
	@JsonView(Views.ShowPicture.class)
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "STATS")
	private Stats stats = new Stats(this);
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "PIC_ID", referencedColumnName = "ID")
	private Set<Spec> specs = new HashSet<>();
	// 20170407 add for picture description
		@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
		@JoinColumn(name = "PIC_ID", referencedColumnName = "ID")
		private Set<PicsDescription> picsDesc;
	/*
	 * 與Tag建立雙向@ManyToMany，Picture為主控方
	 */
	@Expose
	@JsonView(Views.ShowPicture.class)
	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH })
	@JoinTable(name = "TAG_DETAILS", joinColumns = @JoinColumn(name = "PIC_ID", referencedColumnName = "ID"), inverseJoinColumns = @JoinColumn(name = "TAG_ID", referencedColumnName = "ID"))
	private Set<Tag> tags = new HashSet<>();
	/*
	 * 
	 */
	@JsonIgnore
	@ManyToMany(mappedBy = "picColls")
	private Set<Member> collectors = new HashSet<>();

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

	public Member getUploader() {
		return uploader;
	}

	public void setUploader(Member uploader) {
		this.uploader = uploader;
	}

	public Visibility getVisibility() {
		return visibility;
	}

	public void setVisibility(Visibility visibility) {
		this.visibility = visibility;
	}

	public Stats getStats() {
		return stats;
	}

	public void setStats(Stats stats) {
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

	public void addTag(Tag tag) {
		this.tags.add(tag);
	}

	public void removeTag(Tag tag) {
		this.tags.remove(tag);
	}

	public void addTags(Collection<Tag> tags) {
		this.tags.addAll(tags);
	}

	public void removeTags(Collection<Tag> tags) {
		this.tags.removeAll(tags);
	}

	public Set<Member> getCollectors() {
		return collectors;
	}

	public void setCollectors(Set<Member> collectors) {
		this.stats.setLikes(Long.valueOf((long) collectors.size()));
		this.collectors = collectors;
	}

	public void addCollector(Member collector) {
		this.stats.addLikes();
		this.collectors.add(collector);
	}

	public void removeCollector(Member collector) {
		if (this.collectors.contains(collector))
			this.collectors.remove(collector);
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
