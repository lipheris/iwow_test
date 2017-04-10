package tw.com.iwow.entity;

import java.util.Collection;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.google.gson.annotations.Expose;
@JsonIdentityInfo(generator=ObjectIdGenerators.UUIDGenerator.class, property="@UUID")
@Entity
@Table(name = "TAGS")
public class Tag {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private Long id;
	@Expose
	@Column(name = "NAME")
	private String name;
	@Column(name = "TYPE_ID")
	private Long typeId;// typeId 因設定標籤考自訂 增訂type 欄位做大項分類以便增加query
	@Column(name = "DSC")
	private String dsc;// 針對tag新增時的說明
	@ManyToMany(mappedBy = "tags")
	private Set<Picture> Pictures;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getTypeId() {
		return typeId;
	}

	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}

	public String getDsc() {
		return dsc;
	}

	public void setDsc(String dsc) {
		this.dsc = dsc;
	}

	public Set<Picture> getPictures() {
		return Pictures;
	}

	public void setPictures(Set<Picture> pictures) {
		Pictures = pictures;
	}

	public void addTag(Picture picture) {
		this.Pictures.add(picture);
	}

	public void removeTag(Picture picture) {
		this.Pictures.remove(picture);
	}

	public void addTags(Collection<Picture> pictures) {
		this.Pictures.addAll(pictures);
	}

	public void removeTags(Collection<Picture> pictures) {
		this.Pictures.removeAll(pictures);
	}
}
