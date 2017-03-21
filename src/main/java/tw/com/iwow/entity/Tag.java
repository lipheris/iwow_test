package tw.com.iwow.entity;

import java.sql.Clob;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "TAGS")
public class Tag {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(unique = true, nullable = false)
	private Long id;
	private String name;

	// typeId 因設定標籤考自訂 增訂type 欄位做大項分類以便增加query
	@Column(name = "TYPE_ID")
	private Long typeId;
	private Clob description;
	@OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "tag")
	private Set<TagDetail> tagDetail;

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

	public Clob getDescription() {
		return description;
	}

	public void setDescription(Clob description) {
		this.description = description;
	}

	public Set<TagDetail> getTagDetail() {
		return tagDetail;
	}

	public void setTagDetail(Set<TagDetail> tagDetail) {
		this.tagDetail = tagDetail;
	}

}
