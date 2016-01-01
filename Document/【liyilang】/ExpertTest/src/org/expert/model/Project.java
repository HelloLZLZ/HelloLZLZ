package org.expert.model;

import java.sql.Timestamp;

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
	private String tag;
	private Integer budget;
	private Timestamp deadline;
	private Timestamp starttime;
	private Integer pvocation;

	// Constructors

	/** default constructor */
	public Project() {
	}

	/** minimal constructor */
	public Project(Business business) {
		this.business = business;
	}

	/** full constructor */
	public Project(Business business, Expert expert, String pname,
			String pdescrpt, Integer schedule, String tag, Integer budget,
			Timestamp deadline, Timestamp starttime, Integer pvocation) {
		this.business = business;
		this.expert = expert;
		this.pname = pname;
		this.pdescrpt = pdescrpt;
		this.schedule = schedule;
		this.tag = tag;
		this.budget = budget;
		this.deadline = deadline;
		this.starttime = starttime;
		this.pvocation = pvocation;
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

	public String getTag() {
		return this.tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public Integer getBudget() {
		return this.budget;
	}

	public void setBudget(Integer budget) {
		this.budget = budget;
	}

	public Timestamp getDeadline() {
		return this.deadline;
	}

	public void setDeadline(Timestamp deadline) {
		this.deadline = deadline;
	}

	public Timestamp getStarttime() {
		return this.starttime;
	}

	public void setStarttime(Timestamp starttime) {
		this.starttime = starttime;
	}

	public Integer getPvocation() {
		return this.pvocation;
	}

	public void setPvocation(Integer pvocation) {
		this.pvocation = pvocation;
	}

}