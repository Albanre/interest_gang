package com.xqbang.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xqbang.dao.ICourseDao;
import com.xqbang.dao.IUserDao;
import com.xqbang.domain.Course;
import com.xqbang.domain.User;
import com.xqbang.service.ICourceservice;
import com.xqbang.utils.PageBean;
@Service
@Transactional
public class Courseserviceimpl implements ICourceservice{
    @Resource
	private ICourseDao coursedao;
    @Resource
	private IUserDao userdao;
	@Override
	public void save(Course course) {
		coursedao.save(course);
	}
	@Override
	public PageBean<Course> findcoursebycondition(int currentpage,
			int pagesize, Course course) {
		StringBuilder sbu=new StringBuilder();
		List<Object> paramslist=new ArrayList<Object>();
		if(StringUtils.isNotBlank(course.getCoursename())){
			sbu.append(" and coursename like ?");
			paramslist.add("%"+course.getCoursename()+"%");
		}
		if(StringUtils.isNotBlank(course.getCoursetype())){
			sbu.append(" and coursetype=?");
			paramslist.add(course.getCoursetype());
		}
		if(StringUtils.isNotBlank(course.getPnumpaixu())){
			if("asc".equals(course.getPnumpaixu())){
			    sbu.append(" order by p_number asc");
			}else{
				sbu.append(" order by p_number desc");	
			}
		}
		if(StringUtils.isNotBlank(course.getPricepaixu())){
			if("asc".equals(course.getPricepaixu())){
			    sbu.append(" order by price asc");
			}else{
				sbu.append(" order by price desc");	
			}
		}
		String condition=sbu.toString();
		Object[] params=paramslist.toArray();
		int totalrecord=coursedao.gettotalrecord(condition, params);
		PageBean<Course> pagebean=new PageBean<Course>(pagesize, currentpage, totalrecord);
		List<Course> courselist=coursedao.pageQuery(condition, params, pagebean.getStartindex(), pagesize);
		pagebean.setCoursedata(courselist);
		return pagebean;
	}
	@Override
	public Course findcoursebyid(String courseid) {
		return coursedao.findById(courseid);
	}
	@Override
	public void addcollect(String courseid, User currentuser) {
		Course course=coursedao.findById(courseid);
		course.getUsers().add(currentuser);
	}
	@Override
	public List<Object> findcoursebyname(String coursename) {
		return coursedao.findcoursebyname(coursename);
	}
	@Override
	public void batchdelcolect(User u) {
		for(Course course:u.getCourses()){
			Course dbcourse=coursedao.findById(course.getCourseid());
			dbcourse.getUsers().remove(u);
		}
		
		
	}
	@Override
	public List<Course> findhistoryrd(String[] ids) {
		List<Course> clist=new ArrayList<Course>();
		Course course=new Course();
		for(int i=0;i<ids.length;i++){
			course=coursedao.findById(ids[i]);
			clist.add(course);
		}
		return clist;
	}
	@Override
	public void update(Course course) {
		Course dbcourse=coursedao.findById(course.getCourseid());
		dbcourse.setCoursename(course.getCoursename());
		dbcourse.setCoursetype(course.getCoursetype());
		dbcourse.setIntroduction(course.getIntroduction());
		dbcourse.setO_time(course.getO_time());
		dbcourse.setP_number(course.getP_number());
		dbcourse.setPrice(course.getPrice());
		if(StringUtils.isNotEmpty(course.getImg_url())){
		dbcourse.setImg_url(course.getImg_url());
		}
	}

}
