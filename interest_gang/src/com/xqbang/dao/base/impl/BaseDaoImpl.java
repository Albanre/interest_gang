package com.xqbang.dao.base.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.xqbang.dao.base.IBaseDao;
import com.xqbang.utils.PageBean;
import com.xqbang.utils.PageHibernateCallBack;

public class BaseDaoImpl<T> extends HibernateDaoSupport implements IBaseDao<T>{
	private Class<T> entityClass;

	// ʹ��ע�ⷽʽ��������ע��
	@Resource
	// @Autowired
	// @Qualifier(value="abc")
	public void setMySessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
	public BaseDaoImpl() {
		// ��ø��ࣨBaseDaoImpl<T>������
		ParameterizedType genericSuperclass = (ParameterizedType) this
				.getClass().getGenericSuperclass();
		// ��ø����ϵķ�������
		Type[] actualTypeArguments = genericSuperclass.getActualTypeArguments();
		entityClass = (Class<T>) actualTypeArguments[0];
	}
	@Override
	public void save(T entity) {
		this.getHibernateTemplate().save(entity);
	}

	@Override
	public void delete(T entity) {
		this.getHibernateTemplate().delete(entity);
	}
	@Override
	public void update(T entity) {
		this.getHibernateTemplate().update(entity);
	}
	@Override
	public void saveOrUpdate(T entity) {
		this.getHibernateTemplate().saveOrUpdate(entity);
	}
	@Override
	public T findById(Serializable id) {
		return this.getHibernateTemplate().get(entityClass, id);
	}
	@Override
	public List<T> findAll() {
		return this.getHibernateTemplate().find("from "+entityClass.getSimpleName());
	}
	@Override
	public void executeUpdate(String queryName, Object... objects) {
        Session session = this.getSession();// �ӱ����߳��л��session����
		// ʹ��������ѯ�����һ����ѯ����
		Query query = session.getNamedQuery(queryName);
		// ΪHQL����еģ���ֵ
		int i = 0;
		for (Object arg : objects) {
			query.setParameter(i++, arg);
		}
		query.executeUpdate();// ִ�и���
	}
	@Override
	public int gettotalrecord(String condition, Object[] params) {
		List<Long> list=this.getHibernateTemplate().find("select count(*) from "+entityClass.getName()+" where 1=1"+condition, params);
		return list.get(0).intValue();
	}
	@Override
	public List<T> pageQuery(String condition, Object[] params, int startindex,
			int pagesize) {
		String hql="from "+entityClass.getName()+" where 1=1"+condition;
		return this.getHibernateTemplate().execute(new PageHibernateCallBack<T>().setHql(hql).setStartindex(startindex).setPagesize(pagesize).setParams(params));
	}
	

}
