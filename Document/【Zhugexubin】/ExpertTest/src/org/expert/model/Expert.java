package org.expert.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Expert entity. @author MyEclipse Persistence Tools
 */

public class Expert implements java.io.Serializable {

	// Fields

	private Integer eid;
	private String eusername;
	private String epwd;
	private String name;
	private String phone;
	private Integer evocation;
	private Integer edomain;
	private Integer eyears;
	private Set projects = new HashSet(0);

	// Constructors

	/** default constructor */
	public Expert() {
	}

	/** minimal constructor */
	public Expert(String eusername, String epwd) {
		this.eusername = eusername;
		this.epwd = epwd;
	}

	/** full constructor */
	public Expert(String eusername, String epwd, String name, String phone,
			Integer evocation, Integer edomain, Integer eyears, Set projects) {
		this.eusername = eusername;
		this.epwd = epwd;
		this.name = name;
		this.phone = phone;
		this.evocation = evocation;
		this.edomain = edomain;
		this.eyears = eyears;
		this.projects = projects;
	}

	// Property accessors

	public Integer getEid() {
		return this.eid;
	}

	public void setEid(Integer eid) {
		this.eid = eid;
	}

	public String getEusername() {
		return this.eusername;
	}

	public void setEusername(String eusername) {
		this.eusername = eusername;
	}

	public String getEpwd() {
		return this.epwd;
	}

	public void setEpwd(String epwd) {
		this.epwd = epwd;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getEvocation() {
		return this.evocation;
	}

	public void setEvocation(Integer evocation) {
		this.evocation = evocation;
	}

	public Integer getEdomain() {
		return this.edomain;
	}

	public void setEdomain(Integer edomain) {
		this.edomain = edomain;
	}

	public Integer getEyears() {
		return this.eyears;
	}

	public void setEyears(Integer eyears) {
		this.eyears = eyears;
	}

	public Set getProjects() {
		return this.projects;
	}

	public void setProjects(Set projects) {
		this.projects = projects;
	}

}