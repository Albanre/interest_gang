package com.xqbang.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.xqbang.dao.IClicknumDao;
import com.xqbang.dao.base.impl.BaseDaoImpl;
import com.xqbang.domain.Clicknum;
import com.xqbang.service.IClicknumservice;
@Repository
public class ClicknumDaoImpl extends BaseDaoImpl<Clicknum> implements IClicknumDao{

	@Override
	public Clicknum findbyuidandcid(String courseid, int userid) {
		List<Clicknum> list=this.getHibernateTemplate().find("from Clicknum where course.courseid=? and user.userid=?", courseid,userid);
		if(list.size()==1){
			return list.get(0);
		}
		return null;
	}

}
