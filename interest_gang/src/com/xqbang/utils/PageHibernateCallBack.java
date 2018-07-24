package com.xqbang.utils;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

public class PageHibernateCallBack<T> implements HibernateCallback<List<T>>{
	private String hql;
    private Object[] params;
    private int startindex;
    private int pagesize;
    
	public PageHibernateCallBack<T> setHql(String hql) {
		this.hql = hql;
		return this;
	}

	public PageHibernateCallBack<T> setParams(Object[] params) {
		this.params = params;
		return this;
	}

	public PageHibernateCallBack<T> setStartindex(int startindex) {
		this.startindex = startindex;
		return this;
	}

	public PageHibernateCallBack<T> setPagesize(int pagesize) {
		this.pagesize = pagesize;
		return this;
	}

	@Override
	public List<T> doInHibernate(Session session) throws HibernateException,
			SQLException {
		Query queryobj=session.createQuery(hql);
		for(int i=0;i<params.length;i++){
			queryobj.setParameter(i, params[i]);
		}
		queryobj.setFirstResult(startindex);
		queryobj.setMaxResults(pagesize);
		return queryobj.list();
	}

}
