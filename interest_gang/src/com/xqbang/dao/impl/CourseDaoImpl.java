package com.xqbang.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.xqbang.dao.ICourseDao;
import com.xqbang.dao.base.IBaseDao;
import com.xqbang.dao.base.impl.BaseDaoImpl;
import com.xqbang.domain.Course;
import com.xqbang.domain.User;
@Repository
public class CourseDaoImpl extends BaseDaoImpl<Course> implements ICourseDao{

	@Override
	public List<Object> findcoursebyname(String coursename) {
		return this.getHibernateTemplate().find("select coursename from Course where coursename like ?","%"+coursename+"%");
	}
	//查找当前登录用户点击次数最多的兴趣班的id
	@Override
	public List<String> findcidbymaxclick(int userid){
		List<String> list=this.getHibernateTemplate().find("select course.courseid from Clicknum where num=(select max(num) from Clicknum where user.userid=?) and user.userid=?", userid,userid);
	    return list;
	}
	//根据课程ID查询课程类别
	@Override
	public String findcoursetypebyid(String courseid){
		List<String> list=this.getHibernateTemplate().find("select coursetype from Course where courseid=?",courseid);
	    return list.get(0);
	}
	//根据课程类别查询课程列表
	@Override
	public List<Course> findbycoursetype(String coursetype){
		List<Course> list=this.getHibernateTemplate().find("from Course where coursetype=?", coursetype);
	    return list;
	}
	//-----------------------
}
