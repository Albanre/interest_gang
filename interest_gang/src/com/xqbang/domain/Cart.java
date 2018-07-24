package com.xqbang.domain;

import java.util.HashMap;
import java.util.Map;

public class Cart {

	private String shopname;
	private Map<Course,Integer> cartmap=new HashMap<Course,Integer>();
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public Map<Course, Integer> getCartmap() {
		return cartmap;
	}
	public void setCartmap(Map<Course, Integer> cartmap) {
		this.cartmap = cartmap;
	}
	
}
