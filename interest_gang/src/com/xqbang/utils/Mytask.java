package com.xqbang.utils;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.TimerTask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.xqbang.domain.Order;
import com.xqbang.service.IOrderservice;
import com.xqbang.service.impl.Orderserviceimpl;
//监测未支付的订单
public class Mytask extends TimerTask{
	private IOrderservice orderservice;
	public Mytask(IOrderservice orderservice){
		this.orderservice=orderservice;
	}
	@Override
	public void run() {
		List<Order> odlist=new ArrayList<Order>();
		odlist=orderservice.searchnopayorder();
		if(odlist!=null&&odlist.size()>0){
			System.out.println("未支付订单扫描中...");
		for (Iterator iterator = odlist.iterator(); iterator.hasNext();) {
			Order order = (Order) iterator.next();
			long l=0;
			l=System.currentTimeMillis()-order.getOrdertime().getTime();
			if(l>86400000){//24小时未付款
				orderservice.makeorderclose(order.getOrderid(), order.getOrderitems());
				System.out.println("订单"+order.getOrderid()+"失效了");
				iterator.remove();
			}
		}
		}
	}

}
