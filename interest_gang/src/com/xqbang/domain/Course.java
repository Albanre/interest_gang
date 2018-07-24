package com.xqbang.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Course implements Serializable{
	private String courseid;
	private String coursename;
	private int p_number;
	private Date o_time;
	private double price;
	private String coursetype;
	private String introduction;
	private String img_url;
	private Merchant merchant;
	private Set<User> users=new HashSet<User>();//一个课程可以由多个用户收藏
	private Set<Comment> comments=new HashSet<Comment>();//一个课程有多个评价 
	/*-------------------------*/
	private String pnumpaixu;//按剩余容量排序
	private String pricepaixu;//按价格排序
	@Override
	public int hashCode() {
		final int prime=31;
		int result=1;
		result=prime*result+((courseid==null)?0:courseid.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if(this==obj)
			return true;
		
		if(obj==null)
			return false;
		if(getClass()!=obj.getClass())
			return false;
		Course other=(Course)obj;
		if(courseid==null){
			if(other.courseid!=null)
				return false;
		}else if(!courseid.equals(other.courseid))
			return false;
		
		
		return true;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public int getP_number() {
		return p_number;
	}
	public void setP_number(int p_number) {
		this.p_number = p_number;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getCoursetype() {
		return coursetype;
	}
	public void setCoursetype(String coursetype) {
		this.coursetype = coursetype;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public Merchant getMerchant() {
		return merchant;
	}
	public void setMerchant(Merchant merchant) {
		this.merchant = merchant;
	}
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	public String getCourseid() {
		return courseid;
	}
	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}
	public Date getO_time() {
		return o_time;
	}
	public void setO_time(Date o_time) {
		this.o_time = o_time;
	}
	public String getPnumpaixu() {
		return pnumpaixu;
	}
	public String getPricepaixu() {
		return pricepaixu;
	}
	public void setPnumpaixu(String pnumpaixu) {
		this.pnumpaixu = pnumpaixu;
	}
	public void setPricepaixu(String pricepaixu) {
		this.pricepaixu = pricepaixu;
	}
	
}
