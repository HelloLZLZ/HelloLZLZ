package org.expert.model;

/**
 * Admin entity. @author MyEclipse Persistence Tools
 */

public class Admin implements java.io.Serializable {

	// Fields

	private Integer aid;
	private String ausername;
	private String apwd;

	// Constructors

	/** default constructor */
	public Admin() {
	}

	/** full constructor */
	public Admin(String ausername, String apwd) {
		this.ausername = ausername;
		this.apwd = apwd;
	}

	// Property accessors

	public Integer getAid() {
		return this.aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public String getAusername() {
		return this.ausername;
	}

	public void setAusername(String ausername) {
		this.ausername = ausername;
	}

	public String getApwd() {
		return this.apwd;
	}

	public void setApwd(String apwd) {
		this.apwd = apwd;
	}

}