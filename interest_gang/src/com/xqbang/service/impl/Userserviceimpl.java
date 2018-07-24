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
		Set<String> ctypeset=new HashSet<String>();//�����𼯺ϣ�setȥ��
		for (String cid : cidlist) {//����ID���ϲ����
			String ctype=coursedao.findcoursetypebyid(cid);
			ctypeset.add(ctype);
		}
		List<Course> tjcourselist=new ArrayList<Course>();
		for (String ctype : ctypeset) {//������𼯺ϲ�γ��б�
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
			String emailmsg="�𾴵�"+u.getUsername()+"�û�����ӭע����Ȥ���<a href='http://127.0.0.1:8080/interest_gang/user/useraction_activeuser?activecode="+u.getActivecode()+"'>���</a>�����˻�";
		    SendJMail.sendMail(u.getEmail(), emailmsg,"����Ȥ��û�����");
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
	//�����һ�����
	@Override
	public User reqfindpwd(String username) {
		User dbuser=userdao.finduserbyuname(username);
		if(dbuser!=null){
			String emailMsg="�𾴵�"+dbuser.getUsername()+"�û����������һ����룬��<a href='http://127.0.0.1:8080/interest_gang/resetpwd.jsp?username="+dbuser.getUsername()+"'>���</a>����������";
			SendJMail.sendMail(dbuser.getEmail(), emailMsg, "����Ȥ��һ�����");
		}
		return dbuser;
	}

}
