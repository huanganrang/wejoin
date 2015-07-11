package jb.pageModel;

import java.util.Date;

@SuppressWarnings("serial")
public class DiveActivity implements java.io.Serializable {

	private static final long serialVersionUID = 5454155825314635342L;

	private java.lang.String id;	
	private java.lang.String name;	
	private Date startDate;			
	private Date endDate;			
	private java.lang.String startAddr;	
	private java.lang.String addrId;	
	private java.lang.String endAddr;	
	private java.lang.String description;	
	private Date addtime;			

	

	public void setId(java.lang.String value) {
		this.id = value;
	}
	
	public java.lang.String getId() {
		return this.id;
	}

	
	public void setName(java.lang.String name) {
		this.name = name;
	}
	
	public java.lang.String getName() {
		return this.name;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	
	public Date getStartDate() {
		return this.startDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	public Date getEndDate() {
		return this.endDate;
	}
	public void setStartAddr(java.lang.String startAddr) {
		this.startAddr = startAddr;
	}
	
	public java.lang.String getStartAddr() {
		return this.startAddr;
	}
	public void setAddrId(java.lang.String addrId) {
		this.addrId = addrId;
	}
	
	public java.lang.String getAddrId() {
		return this.addrId;
	}
	public void setEndAddr(java.lang.String endAddr) {
		this.endAddr = endAddr;
	}
	
	public java.lang.String getEndAddr() {
		return this.endAddr;
	}
	public void setDescription(java.lang.String description) {
		this.description = description;
	}
	
	public java.lang.String getDescription() {
		return this.description;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}
	
	public Date getAddtime() {
		return this.addtime;
	}

}
