package com.xqbang.service.impl;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xqbang.dao.ICourseDao;
import com.xqbang.dao.IOrderDao;
import com.xqbang.dao.IOrderitemDao;
import com.xqbang.domain.Order;
import com.xqbang.domain.Orderitem;
import com.xqbang.service.IOrderservice;
@Service
@Transactional
public class Orderserviceimpl implements IOrderservice{
    @Resource
	private IOrderDao orderdao;
    @Resource
	private ICourseDao coursedao;
	@Override
	public void addorder(Order order) {//���ɶ���
		orderdao.save(order);
		for(Orderitem oi:order.getOrderitems()){//�����
		coursedao.executeUpdate("course.jianpnum", oi.getBuy_num(),oi.getCourse().getCourseid());
		}
	}
	@Override
	public void updatepaystate(String orderid,int state) {
		orderdao.executeUpdate("order.updatepaystate",state,orderid);
	}
	@Override
	public Order findbyid(String orderid) {
		return orderdao.findById(orderid);
	}
	@Override
	public void delorder(String orderid) {
		Order order=new Order();
		order.setOrderid(orderid);
		orderdao.delete(order);
	}
	@Override
	public List<Order> searchnopayorder() {
		return orderdao.findnopayorder();
	}
	
	@Override
	public void makeorderclose(String orderid,Set<Orderitem> oiset) {
		//�ѿ��ӻ�ȥ
		for(Orderitem oi:oiset){
			coursedao.executeUpdate("course.addpnum", oi.getBuy_num(),oi.getCourse().getCourseid());
		}
		//�޸Ķ���״̬
		updatepaystate(orderid, -1);
		
	}
  
}
