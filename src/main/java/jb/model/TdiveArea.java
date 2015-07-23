
/*
 * @author John
 * @date - 2015-07-23
 */

package jb.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name = "dive_area")
@DynamicInsert(true)
@DynamicUpdate(true)
public class TdiveArea implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "DiveArea";
	public static final String ALIAS_ID = "主键";
	public static final String ALIAS_CODE = "编码";
	public static final String ALIAS_NAME = "名称";
	public static final String ALIAS_PARENT_CODE = "父编码";
	public static final String ALIAS_COUNTRY_CODE = "国家代码";
	
	//date formats
	

	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	//
	private java.lang.Integer id;
	//@NotBlank @Length(max=6)
	private java.lang.String code;
	//@NotBlank @Length(max=20)
	private java.lang.String name;
	//@NotBlank @Length(max=6)
	private java.lang.String parentCode;
	//@NotBlank @Length(max=6)
	private java.lang.String countryCode;
	//columns END


		public TdiveArea(){
		}
		public TdiveArea(Integer id) {
			this.id = id;
		}
	

	public void setId(java.lang.Integer id) {
		this.id = id;
	}
	
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 10)
	public java.lang.Integer getId() {
		return this.id;
	}
	
	@Column(name = "code", unique = false, nullable = false, insertable = true, updatable = true, length = 6)
	public java.lang.String getCode() {
		return this.code;
	}
	
	public void setCode(java.lang.String code) {
		this.code = code;
	}
	
	@Column(name = "name", unique = false, nullable = false, insertable = true, updatable = true, length = 20)
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String name) {
		this.name = name;
	}
	
	@Column(name = "parentCode", unique = false, nullable = false, insertable = true, updatable = true, length = 6)
	public java.lang.String getParentCode() {
		return this.parentCode;
	}
	
	public void setParentCode(java.lang.String parentCode) {
		this.parentCode = parentCode;
	}
	
	@Column(name = "countryCode", unique = false, nullable = false, insertable = true, updatable = true, length = 6)
	public java.lang.String getCountryCode() {
		return this.countryCode;
	}
	
	public void setCountryCode(java.lang.String countryCode) {
		this.countryCode = countryCode;
	}
	
	
	/*
	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Code",getCode())
			.append("Name",getName())
			.append("ParentCode",getParentCode())
			.append("CountryCode",getCountryCode())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof DiveArea == false) return false;
		if(this == obj) return true;
		DiveArea other = (DiveArea)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}*/
}

