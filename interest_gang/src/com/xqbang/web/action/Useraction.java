package com.xqbang.web.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.xqbang.domain.Course;
import com.xqbang.domain.Order;
import com.xqbang.domain.User;
import com.xqbang.utils.MD5Utils;
@Controller
@Scope("prototype")
public class Useraction extends Baseaction<User>{
/*--------------------用户登录-----------------------*/
private String remember;//是否记住用户
public String login(){
	User u=getModel();
	User dbuser=userservice.login(u.getUsername(),MD5Utils.md5(u.getPassword()));
	Cookie ck=new Cookie("user", u.getUsername()+"&"+u.getPassword());
	ck.setPath("/");
	if(dbuser==null){
		this.addActionError("用户名与密码不匹配");
		return "login";
	}
	if(dbuser.getState()==0){
		this.addActionError("该账户还未激活");
		return "login";
	}
	putsession("loginuser", dbuser);
	if(remember!=null){
		ck.setMaxAge(Integer.MAX_VALUE);
	}else{
		ck.setMaxAge(0);
	}
	getResponse().addCookie(ck);
	return "home";
}
/*--------------------用户注销-----------------------*/
public String logout(){
	getRequest().getSession().invalidate();
	return "login";
}
/*--------------------用户注册-----------------------*/
private String code;//页面传过来的验证码
public String register(){
	String rcode=(String) getRequest().getSession().getAttribute("rcode");
	System.out.println("验证码："+code);
	if(!rcode.equals(code)){
		this.addActionError("验证码错误");
		return "register";
	}
	User u=getModel();
	User dbuser=userservice.checkuname(u.getUsername());
	if(dbuser!=null){
		this.addActionError("用户名已存在");
		return "register";
	}
	u.setPassword(MD5Utils.md5(u.getPassword()));//密码MD5加密
	u.setActivecode(UUID.randomUUID().toString());
	u.setRole("member");
	Integer result=userservice.register(u);
	if(result>0){
		return "registersuccess";
	}
	return "register";
	
}

//ajax验证用户名是否存在
public String checkuname() throws IOException{
	String result="true";
	User dbuser=userservice.checkuname(getModel().getUsername());
	if(dbuser!=null){
		result="false";
	}
	getResponse().getWriter().print(result);
	return NONE;
}
//激活用户
public String activeuser(){
	userservice.activeuser(getModel().getActivecode());
	return "activesuccess";
}
//发起找回密码请求
public String reqfindpwd(){
	User u=userservice.reqfindpwd(getModel().getUsername());
	if(u==null){
		set("errormsg", "您输入的用户名不存在");
		return "reqfindpwd";
	}
	return "reqfindpwdsuccess";
	
}
//重置密码
public String resetpwd(){
	userservice.resetpwd(getModel());
	getRequest().getSession().invalidate();
	Cookie ck=new Cookie("user", "");
	ck.setPath("/");
	ck.setMaxAge(0);
	getResponse().addCookie(ck);
	return "resetpwdsuccess";
}
//查询用户收藏列表
public String findcollectbyuser(){
	User user=(User) getRequest().getSession().getAttribute("loginuser");
    User dbuser=userservice.findubyid(user.getUserid());
    push(dbuser);
    return "collectlist";
}
//查询用户评价列表
public String findcommentbyuser(){
	User user=(User) getRequest().getSession().getAttribute("loginuser");
    User dbuser=userservice.findubyid(user.getUserid());
    push(dbuser);
    return "commentlist";
}
//查找历史浏览记录
public String findhistoryrecord(){
	Cookie[] cks=getRequest().getCookies();
	String historyid=null;
	List<Course> list=new ArrayList<Course>();
	for(int i=0;cks!=null&&i<cks.length;i++){
		if("historyid".equals(cks[i].getName())){
			historyid=cks[i].getValue();
		}
	}
	if(historyid!=null){
	String[] ids=historyid.split(",");
	list=courseservice.findhistoryrd(ids);
	}
	set("footcourses", list);
	return "myfootmark";
}
//查询用户订单列表
public String findorderbyuser(){
	User user=(User) getRequest().getSession().getAttribute("loginuser");
	User dbuser=userservice.findubyid(user.getUserid());
	push(dbuser);
	return "orderlist";
	
}
//修改用户信息
public String modifyinfo(){
	User user=(User) getRequest().getSession().getAttribute("loginuser");
	userservice.modifyinfo(user.getUserid(),getModel());
	User dbuser=userservice.findubyid(user.getUserid());//查出修改后的用户信息
	getRequest().getSession().setAttribute("loginuser", dbuser);
	return "accountinfo";
}
//修改密码
public String newpassword;//用户输入的新密码
public String modifypwd() throws IOException{
	String result="";
	//判断输入的原密码是否正确
	User user=(User) getRequest().getSession().getAttribute("loginuser");
	if(!user.getPassword().equals(MD5Utils.md5(getModel().getPassword()))){
		result="false";
	}else{
		userservice.updatepwd(user.getUserid(),MD5Utils.md5(newpassword));
		getRequest().getSession().invalidate();
		Cookie ck=new Cookie("user", "");
		ck.setPath("/");
		ck.setMaxAge(0);
		getResponse().addCookie(ck);
		result="true";
	}
	getResponse().getWriter().print(result);
	return NONE;
}
//查询所有用户
public String findalluser(){
	List<User> ulist=userservice.findall();
	set("ulist", ulist);
	return "userlist";
}
public String getCode() {
	return code;
}
public void setCode(String code) {
	this.code = code;
}

public String getRemember() {
	return remember;
}

public void setRemember(String remember) {
	this.remember = remember;
}
public String getNewpassword() {
	return newpassword;
}
public void setNewpassword(String newpassword) {
	this.newpassword = newpassword;
}

}
