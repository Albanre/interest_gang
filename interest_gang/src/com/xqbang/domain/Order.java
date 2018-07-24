package com.xqbang.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Order {
	private String orderid; //订单编号
	private double totalprice;//总价
	private String receivername;
	private String receiverphone;
	private int paystate;
	private int cmstate;
	private Date ordertime;
	private User user;
	private Set<Orderitem> orderitems=new HashSet<Orderitem>();//一个order对象对应多个orderitem
	
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	
	public double getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}
	public String getReceivername() {
		return receivername;
	}
	public void setReceivername(String receivername) {
		this.receivername = receivername;
	}
	public String getReceiverphone() {
		return receiverphone;
	}
	public void setReceiverphone(String receiverphone) {
		this.receiverphone = receiverphone;
	}
	public int getPaystate() {
		return paystate;
	}
	public void setPaystate(int paystate) {
		this.paystate = paystate;
	}
	public int getCmstate() {
		return cmstate;
	}
	public void setCmstate(int cmstate) {
		this.cmstate = cmstate;
	}
	public Date getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<Orderitem> getOrderitems() {
		return orderitems;
	}
	public void setOrderitems(Set<Orderitem> orderitems) {
		this.orderitems = orderitems;
	}
	
    
}
