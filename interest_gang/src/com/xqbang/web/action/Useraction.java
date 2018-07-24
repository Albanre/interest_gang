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
/*--------------------�û���¼-----------------------*/
private String remember;//�Ƿ��ס�û�
public String login(){
	User u=getModel();
	User dbuser=userservice.login(u.getUsername(),MD5Utils.md5(u.getPassword()));
	Cookie ck=new Cookie("user", u.getUsername()+"&"+u.getPassword());
	ck.setPath("/");
	if(dbuser==null){
		this.addActionError("�û��������벻ƥ��");
		return "login";
	}
	if(dbuser.getState()==0){
		this.addActionError("���˻���δ����");
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
/*--------------------�û�ע��-----------------------*/
public String logout(){
	getRequest().getSession().invalidate();
	return "login";
}
/*--------------------�û�ע��-----------------------*/
private String code;//ҳ�洫��������֤��
public String register(){
	String rcode=(String) getRequest().getSession().getAttribute("rcode");
	System.out.println("��֤�룺"+code);
	if(!rcode.equals(code)){
		this.addActionError("��֤�����");
		return "register";
	}
	User u=getModel();
	User dbuser=userservice.checkuname(u.getUsername());
	if(dbuser!=null){
		this.addActionError("�û����Ѵ���");
		return "register";
	}
	u.setPassword(MD5Utils.md5(u.getPassword()));//����MD5����
	u.setActivecode(UUID.randomUUID().toString());
	u.setRole("member");
	Integer result=userservice.register(u);
	if(result>0){
		return "registersuccess";
	}
	return "register";
	
}

//ajax��֤�û����Ƿ����
public String checkuname() throws IOException{
	String result="true";
	User dbuser=userservice.checkuname(getModel().getUsername());
	if(dbuser!=null){
		result="false";
	}
	getResponse().getWriter().print(result);
	return NONE;
}
//�����û�
public String activeuser(){
	userservice.activeuser(getModel().getActivecode());
	return "activesuccess";
}
//�����һ���������
public String reqfindpwd(){
	User u=userservice.reqfindpwd(getModel().getUsername());
	if(u==null){
		set("errormsg", "��������û���������");
		return "reqfindpwd";
	}
	return "reqfindpwdsuccess";
	
}
//��������
public String resetpwd(){
	userservice.resetpwd(getModel());
	getRequest().getSession().invalidate();
	Cookie ck=new Cookie("user", "");
	ck.setPath("/");
	ck.setMaxAge(0);
	getResponse().addCookie(ck);
	return "resetpwdsuccess";
}
//��ѯ�û��ղ��б�
public String findcollectbyuser(){
	User user=(User) getRequest().getSession().getAttribute("loginuser");
    User dbuser=userservice.findubyid(user.getUserid());
    push(dbuser);
    return "collectlist";
}
//��ѯ�û������б�
public String findcommentbyuser(){
	User user=(User) getRequest().getSession().getAttribute("loginuser");
    User dbuser=userservice.findubyid(user.getUserid());
    push(dbuser);
    return "commentlist";
}
//������ʷ�����¼
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
//��ѯ�û������б�
public String findorderbyuser(){
	User user=(User) getRequest().getSession().getAttribute("loginuser");
	User dbuser=userservice.findubyid(user.getUserid());
	push(dbuser);
	return "orderlist";
	
}
//�޸��û���Ϣ
public String modifyinfo(){
	User user=(User) getRequest().getSession().getAttribute("loginuser");
	userservice.modifyinfo(user.getUserid(),getModel());
	User dbuser=userservice.findubyid(user.getUserid());//����޸ĺ���û���Ϣ
	getRequest().getSession().setAttribute("loginuser", dbuser);
	return "accountinfo";
}
//�޸�����
public String newpassword;//�û������������
public String modifypwd() throws IOException{
	String result="";
	//�ж������ԭ�����Ƿ���ȷ
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
//��ѯ�����û�
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
