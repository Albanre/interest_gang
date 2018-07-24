package com.xqbang.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xqbang.dao.ICourseDao;
import com.xqbang.dao.IUserDao;
import com.xqbang.domain.Course;
import com.xqbang.domain.Order;
import com.xqbang.domain.User;
import com.xqbang.service.IUserservice;
import com.xqbang.utils.MD5Utils;
import com.xqbang.utils.SendJMail;
@Service
@Transactional
public class Userserviceimpl implements IUserservice{
    @Resource
	private IUserDao userdao;
    @Resource
	private ICourseDao coursedao;
	@Override
	public User login(String username,String password) {
		User dbuser=userdao.finduserbynameandpwd(username,password);
		if(dbuser==null){
			return null;
		}
		List<String> cidlist=coursedao.findcidbymaxclick(dbuser.getUserid());//
		Set<String> ctypeset=new HashSet<String>();//存放类别集合，set去重
		for (String cid : cidlist) {//根据ID集合查类别
			String ctype=coursedao.findcoursetypebyid(cid);
			ctypeset.add(ctype);
		}
		List<Course> tjcourselist=new ArrayList<Course>();
		for (String ctype : ctypeset) {//根据类别集合查课程列表
			List<Course> clist=coursedao.findbycoursetype(ctype);
			tjcourselist.addAll(clist);
		}
		dbuser.setTjcourses(tjcourselist);
		return dbuser;
	}
	@Override
	public Integer register(User u) {
		Integer i=userdao.adduser(u);
		if(i!=null){
			String emailmsg="尊敬的"+u.getUsername()+"用户，欢迎注册兴趣帮，请<a href='http://127.0.0.1:8080/interest_gang/user/useraction_activeuser?activecode="+u.getActivecode()+"'>点击</a>激活账户";
		    SendJMail.sendMail(u.getEmail(), emailmsg,"【兴趣帮】用户激活");
		}
		return i;
	}
	@Override
	public User checkuname(String username) {
		return userdao.finduserbyuname(username);
	}
	@Override
	public void activeuser(String activecode) {
		User u=userdao.findbyactivecode(activecode);
		u.setState(1);
	}
	@Override
	public void resetpwd(User user) {
		User dbuser=userdao.finduserbyuname(user.getUsername());
		dbuser.setPassword(MD5Utils.md5(user.getPassword()));
	}
	@Override
	public User findubyid(int userid) {
		return userdao.findById(userid);
	}
	@Override
	public List<User> findall() {
		return userdao.findAll();
	}
	@Override
	public void modifyinfo(int userid, User model) {
		userdao.executeUpdate("user.updateinfo", model.getGender(),model.getTelephone(),model.getEmail(),model.getAddress(),userid);
	}
	@Override
	public void updatepwd(int userid, String newpassword) {
		userdao.executeUpdate("user.updatepwd", newpassword,userid);
	}
	//请求找回密码
	@Override
	public User reqfindpwd(String username) {
		User dbuser=userdao.finduserbyuname(username);
		if(dbuser!=null){
			String emailMsg="尊敬的"+dbuser.getUsername()+"用户，您正在找回密码，请<a href='http://127.0.0.1:8080/interest_gang/resetpwd.jsp?username="+dbuser.getUsername()+"'>点击</a>设置新密码";
			SendJMail.sendMail(dbuser.getEmail(), emailMsg, "【兴趣帮】找回密码");
		}
		return dbuser;
	}

}
