package com.xqbang.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.xqbang.dao.IOrderDao;
import com.xqbang.dao.base.impl.BaseDaoImpl;
import com.xqbang.domain.Order;
@Repository
public class OrderDaoImpl extends BaseDaoImpl<Order> implements IOrderDao{

	@Override
	public List<Order> findnopayorder() {
		return this.getHibernateTemplate().find("from Order where paystate=?", 0);
	}

}
