package com.xqbang.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.xqbang.dao.IMerchantDao;
import com.xqbang.dao.base.impl.BaseDaoImpl;
import com.xqbang.domain.Merchant;
@Repository
public class MerchantDaoImpl extends BaseDaoImpl<Merchant> implements IMerchantDao{

	@Override
	public Merchant findmerchantbyuname(String username) {
		List<Merchant> list=this.getHibernateTemplate().find("from Merchant where username=?", username);
	    if(list.size()==1){
	    	return list.get(0);
	    }
		return null;
	}

	@Override
	public Merchant findmbynameandpwd(String username, String password) {
		List<Merchant> list=this.getHibernateTemplate().find("from Merchant where username=? and password=?",username,password);
	    if(list!=null&&list.size()==1){
	    	Merchant dbmct=list.get(0);
	    	dbmct.setCourses(dbmct.getCourses());
	    	return dbmct;
	    }
		return null;

	}

}
