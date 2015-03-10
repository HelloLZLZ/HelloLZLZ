package org.expert.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Business entity. @author MyEclipse Persistence Tools
 */

public class Business implements java.io.Serializable {

	// Fields

	private Integer bid;
	private String busername;
	private String bpwd;
	private String bname;
	private String btel;
	private String bnet;
	private Integer bvocation;
	private String bsummary;
	private Set projects = new HashSet(0);

	// Constructors

	/** default constructor */
	public Business() {
	}

	/** minimal constructor */
	public Business(String busername, String bpwd) {
		this.busername = busername;
		this.bpwd = bpwd;
	}

	/** full constructor */
	public Business(String busername, String bpwd, String bname, String btel,
			String bnet, Integer bvocation, String bsummary, Set projects) {
		this.busername = busername;
		this.bpwd = bpwd;
		this.bname = bname;
		this.btel = btel;
		this.bnet = bnet;
		this.bvocation = bvocation;
		this.bsummary = bsummary;
		this.projects = projects;
	}

	// Property accessors

	public Integer getBid() {
		return this.bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}

	public String getBusername() {
		return this.busername;
	}

	public void setBusername(String busername) {
		this.busername = busername;
	}

	public String getBpwd() {
		return this.bpwd;
	}

	public void setBpwd(String bpwd) {
		this.bpwd = bpwd;
	}

	public String getBname() {
		return this.bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getBtel() {
		return this.btel;
	}

	public void setBtel(String btel) {
		this.btel = btel;
	}

	public String getBnet() {
		return this.bnet;
	}

	public void setBnet(String bnet) {
		this.bnet = bnet;
	}

	public Integer getBvocation() {
		return this.bvocation;
	}

	public void setBvocation(Integer bvocation) {
		this.bvocation = bvocation;
	}

	public String getBsummary() {
		return this.bsummary;
	}

	public void setBsummary(String bsummary) {
		this.bsummary = bsummary;
	}

	public Set getProjects() {
		return this.projects;
	}

	public void setProjects(Set projects) {
		this.projects = projects;
	}

}