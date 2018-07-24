package com.xqbang.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.xqbang.dao.IUserDao;
import com.xqbang.dao.base.impl.BaseDaoImpl;
import com.xqbang.domain.User;
import com.xqbang.service.IUserservice;
@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements IUserDao{
    
	@Override
	public User finduserbynameandpwd(String username, String password) {
		List<User> list=this.getHibernateTemplate().find("from User u where u.username=? and u.password=?", username,password);
	    if(list.size()==1){
	    	return list.get(0);
	    }
	    return null;
	}

	@Override
	public Integer adduser(User u) {
		Serializable i= this.getHibernateTemplate().save(u);
		return (Integer) i;
	}

	@Override
	public User finduserbyuname(String username) {
		List<User> list=this.getHibernateTemplate().find("from User where username=?", username);
	    if(list.size()==1){
	    	return list.get(0);
	    }
	    return null;
	}

	@Override
	public User findbyactivecode(String activecode) {
		List<User> list=this.getHibernateTemplate().find("from User where activecode=?", activecode);
		if(list.size()==1){
	    	return list.get(0);
	    }
	    return null;
	}

}
