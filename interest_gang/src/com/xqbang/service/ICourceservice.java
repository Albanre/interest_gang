package com.xqbang.service;

import java.util.List;

import com.xqbang.domain.Course;
import com.xqbang.domain.User;
import com.xqbang.utils.PageBean;

public interface ICourceservice {

	void save(Course course);

	PageBean<Course> findcoursebycondition(int currentpage, int pagesize,
			Course model);

	Course findcoursebyid(String courseid);

	void addcollect(String courseid, User currentuser);

	List<Object> findcoursebyname(String coursename);

	void batchdelcolect(User u);

	List<Course> findhistoryrd(String[] ids);

	void update(Course course);

}
