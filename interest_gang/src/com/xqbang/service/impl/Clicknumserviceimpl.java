package com.xqbang.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xqbang.dao.IClicknumDao;
import com.xqbang.domain.Clicknum;
import com.xqbang.domain.Course;
import com.xqbang.domain.User;
import com.xqbang.service.IClicknumservice;
@Service
@Transactional
public class Clicknumserviceimpl implements IClicknumservice{
	@Resource
private IClicknumDao clicknumdao;
	public void add(Course course,User u){
		Clicknum clicknum=clicknumdao.findbyuidandcid(course.getCourseid(),u.getUserid());
		Clicknum cn1=new Clicknum();
		cn1.setCourse(course);
		cn1.setUser(u);
		if(clicknum==null){
			cn1.setNum(1);
			clicknumdao.save(cn1);
		}else{
			clicknumdao.executeUpdate("clicknum.modifynum", course.getCourseid(),u.getUserid());
		}
	}
}
