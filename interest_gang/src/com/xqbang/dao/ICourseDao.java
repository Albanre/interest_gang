package com.xqbang.dao;

import java.util.List;

import com.xqbang.dao.base.IBaseDao;
import com.xqbang.domain.Course;
import com.xqbang.domain.User;

public interface ICourseDao extends IBaseDao<Course>{

	List<Object> findcoursebyname(String coursename);
	List<String> findcidbymaxclick(int userid);
	String findcoursetypebyid(String courseid);
	List<Course> findbycoursetype(String coursetype);
}  
