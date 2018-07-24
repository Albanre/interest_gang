package com.xqbang.dao;

import java.util.List;

import com.xqbang.dao.base.IBaseDao;
import com.xqbang.domain.Order;

public interface IOrderDao extends IBaseDao<Order>{

	List<Order> findnopayorder();


}
