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
	private String photo;
	private String profile;
	private String education;
	private Integer interest;
	private Integer privacy;
	private String email;
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
			Integer evocation, Integer edomain, Integer eyears, String photo,
			String profile, String education, Integer interest,
			Integer privacy, String email, Set projects) {
		this.eusername = eusername;
		this.epwd = epwd;
		this.name = name;
		this.phone = phone;
		this.evocation = evocation;
		this.edomain = edomain;
		this.eyears = eyears;
		this.photo = photo;
		this.profile = profile;
		this.education = education;
		this.interest = interest;
		this.privacy = privacy;
		this.email = email;
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

	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getProfile() {
		return this.profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getEducation() {
		return this.education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public Integer getInterest() {
		return this.interest;
	}

	public void setInterest(Integer interest) {
		this.interest = interest;
	}

	public Integer getPrivacy() {
		return this.privacy;
	}

	public void setPrivacy(Integer privacy) {
		this.privacy = privacy;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Set getProjects() {
		return this.projects;
	}

	public void setProjects(Set projects) {
		this.projects = projects;
	}

}