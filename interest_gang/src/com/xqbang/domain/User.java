package com.xqbang.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class User implements Serializable{
	private int userid;
	private String username;
	private String password;
	private String gender;
	private String telephone;
	private String email;
	private String address;
	private String activecode;
	private String role;
	private int state;
	private Date register_time;
	private Set<Order> orders=new HashSet<Order>();//该用户的订单
	private Set<Course> courses=new HashSet<Course>();//存放收藏列表
	private List<Course> tjcourses=new ArrayList<Course>();//存放推荐列表
	private Set<Comment> comments=new HashSet<Comment>();//该用户的评价列表
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getActivecode() {
		return activecode;
	}
	public void setActivecode(String activecode) {
		this.activecode = activecode;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Date getRegister_time() {
		return register_time;
	}
	public void setRegister_time(Date register_time) {
		this.register_time = register_time;
	}
	public Set<Course> getCourses() {
		return courses;
	}
	public void setCourses(Set<Course> courses) {
		this.courses = courses;
	}
	public Set<Order> getOrders() {
		return orders;
	}
	public Set<Comment> getComments() {
		return comments;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	public List<Course> getTjcourses() {
		return tjcourses;
	}
	public void setTjcourses(List<Course> tjcourses) {
		this.tjcourses = tjcourses;
	}
    
}
