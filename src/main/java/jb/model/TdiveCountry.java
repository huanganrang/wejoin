
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
@Table(name = "dive_country")
@DynamicInsert(true)
@DynamicUpdate(true)
public class TdiveCountry implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "DiveCountry";
	public static final String ALIAS_ID = "主键";
	public static final String ALIAS_NAME = "国家名称";
	public static final String ALIAS_CODE = "国家代码";
	public static final String ALIAS_AD_CODE = "地区（洲）编码";
	
	//date formats
	

	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	//
	private java.lang.Integer id;
	//@NotBlank @Length(max=50)
	private java.lang.String name;
	//@NotBlank @Length(max=4)
	private java.lang.String code;
	//@NotBlank @Length(max=4)
	private java.lang.String adCode;
	//columns END


		public TdiveCountry(){
		}
		public TdiveCountry(Integer id) {
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
	
	@Column(name = "name", unique = false, nullable = false, insertable = true, updatable = true, length = 50)
	public java.lang.String getName() {
		return this.name;
	}
	
	public void setName(java.lang.String name) {
		this.name = name;
	}
	
	@Column(name = "code", unique = false, nullable = false, insertable = true, updatable = true, length = 4)
	public java.lang.String getCode() {
		return this.code;
	}
	
	public void setCode(java.lang.String code) {
		this.code = code;
	}
	
	@Column(name = "adCode", unique = false, nullable = false, insertable = true, updatable = true, length = 4)
	public java.lang.String getAdCode() {
		return this.adCode;
	}
	
	public void setAdCode(java.lang.String adCode) {
		this.adCode = adCode;
	}
	
	
	/*
	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("Name",getName())
			.append("Code",getCode())
			.append("AdCode",getAdCode())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof DiveCountry == false) return false;
		if(this == obj) return true;
		DiveCountry other = (DiveCountry)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}*/
}

