
/*
 * @author John
 * @date - 2015-07-06
 */

package jb.model;

import javax.persistence.*;


import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name = "dive_equip")
@DynamicInsert(true)
@DynamicUpdate(true)
public class TdiveEquip implements java.io.Serializable,IEntity{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//alias
	public static final String TABLE_ALIAS = "DiveEquip";
	public static final String ALIAS_ID = "id";
	public static final String ALIAS_EQUIP_ICON = "图片";
	public static final String ALIAS_EQUIP_SUMARY = "简介";
	public static final String ALIAS_EQUIP_NAME = "装备名称";
	public static final String ALIAS_STATUS = "状态（上架，下架）";
	public static final String ALIAS_EQUIP_BRAND = "品牌";
	public static final String ALIAS_EQUIP_DES = "设备描述";
	public static final String ALIAS_ADDTIME = "addtime";
	
	//date formats
	public static final String FORMAT_ADDTIME = jb.util.Constants.DATE_FORMAT_FOR_ENTITY;
	

	//可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	//columns START
	//@Length(max=36)
	private java.lang.String id;
	//@Length(max=2147483647)
	private java.lang.String equipIcon;
	//@Length(max=256)
	private java.lang.String equipSumary;
	//@Length(max=128)
	private java.lang.String equipName;
	//@Length(max=4)
	private java.lang.String status;
	//@Length(max=4)
	private java.lang.String equipBrand;
	//@Length(max=2147483647)
	private java.lang.String equipDes;
	//
	private java.util.Date addtime;
	//columns END


		public TdiveEquip(){
		}
		public TdiveEquip(String id) {
			this.id = id;
		}
	

	public void setId(java.lang.String id) {
		this.id = id;
	}
	
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 36)
	public java.lang.String getId() {
		return this.id;
	}
	
	@Column(name = "equip_icon", unique = false, nullable = true, insertable = true, updatable = true, length = 2147483647)
	public java.lang.String getEquipIcon() {
		return this.equipIcon;
	}
	
	public void setEquipIcon(java.lang.String equipIcon) {
		this.equipIcon = equipIcon;
	}
	
	@Column(name = "equip_sumary", unique = false, nullable = true, insertable = true, updatable = true, length = 256)
	public java.lang.String getEquipSumary() {
		return this.equipSumary;
	}
	
	public void setEquipSumary(java.lang.String equipSumary) {
		this.equipSumary = equipSumary;
	}
	
	@Column(name = "equip_name", unique = false, nullable = true, insertable = true, updatable = true, length = 128)
	public java.lang.String getEquipName() {
		return this.equipName;
	}
	
	public void setEquipName(java.lang.String equipName) {
		this.equipName = equipName;
	}
	
	@Column(name = "status", unique = false, nullable = true, insertable = true, updatable = true, length = 4)
	public java.lang.String getStatus() {
		return this.status;
	}
	
	public void setStatus(java.lang.String status) {
		this.status = status;
	}
	
	@Column(name = "equip_brand", unique = false, nullable = true, insertable = true, updatable = true, length = 4)
	public java.lang.String getEquipBrand() {
		return this.equipBrand;
	}
	
	public void setEquipBrand(java.lang.String equipBrand) {
		this.equipBrand = equipBrand;
	}
	
	@Column(name = "equip_des", unique = false, nullable = true, insertable = true, updatable = true, length = 2147483647)
	public java.lang.String getEquipDes() {
		return this.equipDes;
	}
	
	public void setEquipDes(java.lang.String equipDes) {
		this.equipDes = equipDes;
	}
	

	@Column(name = "addtime", unique = false, nullable = true, insertable = true, updatable = true, length = 10)
	public java.util.Date getAddtime() {
		return this.addtime;
	}
	
	public void setAddtime(java.util.Date addtime) {
		this.addtime = addtime;
	}
	
	
	/*
	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Id",getId())
			.append("EquipIcon",getEquipIcon())
			.append("EquipSumary",getEquipSumary())
			.append("EquipName",getEquipName())
			.append("Status",getStatus())
			.append("EquipBrand",getEquipBrand())
			.append("EquipDes",getEquipDes())
			.append("Addtime",getAddtime())
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
			.append(getId())
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof DiveEquip == false) return false;
		if(this == obj) return true;
		DiveEquip other = (DiveEquip)obj;
		return new EqualsBuilder()
			.append(getId(),other.getId())
			.isEquals();
	}*/
}

