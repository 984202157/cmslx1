package com.nxy.cms.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @ClassName: User 
 * @Description: 用户表
 * @author: 98420
 * @date: 2020年3月3日 下午2:42:05
 */
 
public class User implements Serializable{
	

	

	/**
	 * @fieldName: serialVersionUID
	 * @fieldType: long
	 * @Description: TODO
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
    private String 	username;
	private String password;
	private  String nickname;
	private Date birthday;
	private String gender;
	private String locked;//0: 正常，1：禁用
    private Date created;
	private  Date updated;
	
	public User() {}
	public User(Integer id,String username) {
     this.id=id;
     this.username=username;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getLocked() {
		return locked;
	}
	public void setLocked(String locked) {
		this.locked = locked;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public Date getUpdated() {
		return updated;
	}
	public void setUpdated(Date updated) {
		this.updated = updated;
	}
	
	
}
