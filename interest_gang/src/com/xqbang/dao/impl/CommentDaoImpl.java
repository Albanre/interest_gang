package com.xqbang.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.xqbang.dao.ICommentDao;
import com.xqbang.dao.base.impl.BaseDaoImpl;
import com.xqbang.domain.Comment;
@Repository
public class CommentDaoImpl extends BaseDaoImpl<Comment> implements ICommentDao{

	@Override
	public double findavgscorebycid(String courseid) {
		List<Double> list= this.getHibernateTemplate().find("select avg(score) from Comment where course.courseid=?", courseid);
	    if(list.get(0)==null)
	    		return 0;
	    	return list.get(0);
	}

}
