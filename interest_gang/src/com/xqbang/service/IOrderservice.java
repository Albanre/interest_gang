
package com.xqbang.service;

import java.util.List;
import java.util.Set;

import com.xqbang.domain.Order;
import com.xqbang.domain.Orderitem;


public interface IOrderservice {

	void addorder(Order order);

	void updatepaystate(String orderid,int state);

	Order findbyid(String orderid);

	void delorder(String orderid);

	List<Order> searchnopayorder();

	void makeorderclose(String orderid,Set<Orderitem> oiset);
}
