package com.xqbang.dao.base;

import java.io.Serializable;
import java.util.List;

import com.xqbang.utils.PageBean;

public interface IBaseDao<T> {
	public void save(T entity);
	public void delete(T entity);
	public void update(T entity);
	public void saveOrUpdate(T entity);
	public T findById(Serializable id);
	public List<T> findAll();
	//提供通用修改方法
	public void executeUpdate(String queryName,Object ...objects);
	public int gettotalrecord(String condition, Object[] params);
	public List<T> pageQuery(String condition, Object[] params,int startindex, int pagesize);
}
