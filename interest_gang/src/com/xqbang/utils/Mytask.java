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
//���δ֧���Ķ���
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
			System.out.println("δ֧������ɨ����...");
		for (Iterator iterator = odlist.iterator(); iterator.hasNext();) {
			Order order = (Order) iterator.next();
			long l=0;
			l=System.currentTimeMillis()-order.getOrdertime().getTime();
			if(l>86400000){//24Сʱδ����
				orderservice.makeorderclose(order.getOrderid(), order.getOrderitems());
				System.out.println("����"+order.getOrderid()+"ʧЧ��");
				iterator.remove();
			}
		}
		}
	}

}
