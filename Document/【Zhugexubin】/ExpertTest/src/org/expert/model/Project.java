package org.expert.model;

/**
 * Project entity. @author MyEclipse Persistence Tools
 */

public class Project implements java.io.Serializable {

	// Fields

	private Integer pid;
	private Business business;
	private Expert expert;
	private String pname;
	private String pdescrpt;
	private Integer schedule;

	// Constructors

	/** default constructor */
	public Project() {
	}

	/** minimal constructor */
	public Project(Business business, String pname, Integer schedule) {
		this.business = business;
		this.pname = pname;
		this.schedule = schedule;
	}

	/** full constructor */
	public Project(Business business, Expert expert, String pname,
			String pdescrpt, Integer schedule) {
		this.business = business;
		this.expert = expert;
		this.pname = pname;
		this.pdescrpt = pdescrpt;
		this.schedule = schedule;
	}

	// Property accessors

	public Integer getPid() {
		return this.pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Business getBusiness() {
		return this.business;
	}

	public void setBusiness(Business business) {
		this.business = business;
	}

	public Expert getExpert() {
		return this.expert;
	}

	public void setExpert(Expert expert) {
		this.expert = expert;
	}

	public String getPname() {
		return this.pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPdescrpt() {
		return this.pdescrpt;
	}

	public void setPdescrpt(String pdescrpt) {
		this.pdescrpt = pdescrpt;
	}

	public Integer getSchedule() {
		return this.schedule;
	}

	public void setSchedule(Integer schedule) {
		this.schedule = schedule;
	}

}