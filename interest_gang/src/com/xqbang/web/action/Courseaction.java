package com.xqbang.web.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.xqbang.domain.Cart;
import com.xqbang.domain.Course;
import com.xqbang.domain.Merchant;
import com.xqbang.domain.User;
import com.xqbang.utils.PageBean;
@Controller
@Scope("prototype")
public class Courseaction extends Baseaction<Course>{
	/*----------------�ϴ��γ�----------------------*/
private File courseimg;
private String courseimgFileName;
private String courseimgContentType;
public String savecourse() throws IOException{
	String filepath=getRequest().getServletContext().getRealPath("images");
	String filename=UUID.randomUUID().toString()+"_"+courseimgFileName;
	File file=new File(filepath);
	if(!file.exists()){
		file.mkdirs();
	}
	Merchant smct=(Merchant) getRequest().getSession().getAttribute("loginmerchant");
	courseimg.renameTo(new File(file,filename));
	Course course=getModel();
	course.setImg_url(filename);
	course.setMerchant(smct);
	String uuidstr=UUID.randomUUID().toString();
	String csid=uuidstr.substring(0, 12);
	course.setCourseid(csid);
	courseservice.save(course);
	//��ӳɹ������session�е��̼���Ϣ
	Merchant dbmerchant=merchantservice.login(smct.getUsername(), smct.getPassword());
	System.out.println(dbmerchant.getCourses().size());
	putsession("loginmerchant", dbmerchant);
	getResponse().getWriter().write("success");
	return NONE;
}
//��ҳ��ѯ�γ�
public String findcoursebypage(){
	PageBean<Course> pagebean=courseservice.findcoursebycondition(getCurrentpage(),getPagesize(),getModel());
	push(pagebean);
	return "courselist";
}
//�鿴����
public String findcourseinfo(){
	/*---------���Ҹ���Ȥ��Ļ�����Ϣ---------------------*/
	Course dbcourse=courseservice.findcoursebyid(getModel().getCourseid());
	String avgscore=commentservice.findavgscorebycid(getModel().getCourseid());
	set("avgscore", avgscore);
	push(dbcourse);
	/*--------------������Ȥ��������------------*/
	User currentuser=(User) getRequest().getSession().getAttribute("loginuser");
	if(currentuser!=null){
	clicknumservice.add(getModel(),currentuser);
	}
	/*---------------��¼�����¼------------------------*/
	String historyid=organizeid(getModel().getCourseid()+"",getRequest());
	Cookie ck=new Cookie("historyid", historyid);
	ck.setPath("/");
	ck.setMaxAge(3600*24*15);//��Ч�ڰ����
	getResponse().addCookie(ck);
	/*----------------�ַ�ת��-------------------------*/
	return "courseinfo";
	
}
//�鿴����
public String findcomment(){
	Course dbcourse=courseservice.findcoursebyid(getModel().getCourseid());
	push(dbcourse);
	return "commentlist";
}
//�༭�γ�
public String edit(){
	Course dbcourse=courseservice.findcoursebyid(getModel().getCourseid());
	push(dbcourse);
	return "editcs";
}
//���¿γ�
public String updatecourse() throws IOException{
	Course course=getModel();
	Merchant smct=(Merchant) getRequest().getSession().getAttribute("loginmerchant");
	if(courseimg!=null){
	String filepath=getRequest().getServletContext().getRealPath("images");
	String filename=UUID.randomUUID().toString()+"_"+courseimgFileName;
	File file=new File(filepath);
	if(!file.exists()){
		file.mkdirs();
	}
	courseimg.renameTo(new File(file,filename));
	course.setImg_url(filename);
	}
	course.setMerchant(smct);
	courseservice.update(course);
	//�޸ĳɹ������session�е��̼���Ϣ
	Merchant dbmerchant=merchantservice.login(smct.getUsername(), smct.getPassword());
	System.out.println(dbmerchant.getCourses().size());
	putsession("loginmerchant", dbmerchant);
	getResponse().getWriter().write("success");
	return NONE;
}
//��֯ID
public String organizeid(String id,HttpServletRequest req){
	Cookie[] cookies=req.getCookies();//��ÿͻ��˵�cookie
	if(cookies==null){//û��cookie�򷵻�ID
		return id;
	}
	Cookie historyid=null;
	for(int i=0;i<cookies.length;i++){//������Ϊhistoryid��cookie
		if("historyid".equals(cookies[i].getName())){
			historyid=cookies[i];
		}
	}
	if(historyid==null){//û�ҵ������Ƿ���ID
		return id;
	}
	String value=historyid.getValue();//�����Ϊhistoryid���cookie��ֵ
	String[] ids=value.split(",");//�ָ�",",���һ�ַ�������
	LinkedList<String> list=new LinkedList<String>(Arrays.asList(ids));//��������ַ�������ת����linkedlist
	if(list.size()<30){//���ID��С��30��
		if(list.contains(id)){
			list.remove(id);
		}
	}else{
		if(list.contains(id)){
			list.remove(id);
		}else{
			list.removeLast();
		}
	}
	list.addFirst(id);//�����µ�id�ӵ�list����λ
	StringBuffer sb=new StringBuffer();
	for(int i=0;i<list.size();i++){
		if(i>0){
			sb.append(",");
		}
		sb.append(list.get(i));
	}
	return sb.toString();
}
//���빺�ﳵ
public int buynum;
public String addcart(){
	Course dbcourse=courseservice.findcoursebyid(getModel().getCourseid());
	/*HashMap<Course,Integer> cart=(HashMap<Course, Integer>) getRequest().getSession().getAttribute("cart");
	if(cart==null){
		cart=new HashMap<Course,Integer>();
	}
	int num=getBuynum();
	if(cart.containsKey(dbcourse)){
		num=cart.get(dbcourse)+1;
		cart.put(dbcourse, num);
	}else{
	cart.put(dbcourse, num);
	}
	putsession("cart", cart);*/
	List<Cart> cartlist=(List<Cart>) getRequest().getSession().getAttribute("cart");
	if(cartlist==null){
		cartlist=new ArrayList<Cart>();
	}
	int num=getBuynum();
	boolean flag=false;//���ﳵ�Ƿ��Ѵ��ڵ�ǰ���빺�ﳵ�Ŀγ̣�
	for(Cart cart:cartlist){
		if(cart.getShopname().equals(dbcourse.getMerchant().getO_name())){//���ﳵ�Ѵ��ڵ�ǰ��ӿγ���������
			flag=true;
			if(cart.getCartmap().containsKey(dbcourse)){
			num=cart.getCartmap().get(dbcourse)+num;
		    }
			cart.getCartmap().put(dbcourse, num);
		}
	}
	if(!flag){
		HashMap<Course,Integer> map=new HashMap<Course,Integer>();
		map.put(dbcourse, num);
		Cart cart1=new Cart();
		cart1.setShopname(dbcourse.getMerchant().getO_name());
		cart1.setCartmap(map);
		cartlist.add(cart1);
	}
	putsession("cart", cartlist);
	return "addcartsuccess";
}
//�ղؿγ�
public String addcollect() throws IOException{
	User currentuser=(User) getRequest().getSession().getAttribute("loginuser");
    courseservice.addcollect(getModel().getCourseid(),currentuser);
    String issuccess="{\"issuccess\":\"true\"}";
    getResponse().getWriter().print(issuccess);
    return NONE;
}
//����ɾ���ղ�
private String[] courseids;
public String delcollect(){
	User u=(User) getRequest().getSession().getAttribute("loginuser");
	Set<Course> courseset=new HashSet<Course>();
	for (int i = 0; i < courseids.length; i++) {
		Course course=new Course();
		course.setCourseid(courseids[i]);
		courseset.add(course);
	}
	u.setCourses(courseset);
	courseservice.batchdelcolect(u);
	return "tocollectlist";
}
//ajax�����ѯ�γ��б�
public String ajaxfindcourse() throws IOException{
	List<Object> list=courseservice.findcoursebyname(getModel().getCoursename());
	String str="";
	for (int i = 0; list.size()>0&&i < list.size(); i++) {
		if(i>0){
			str+=",";
		}
		str+=list.get(i);
	}
	
	if(str!=""){
		System.out.println(str);
	getResponse().getWriter().write(str);
	}else{
	getResponse().getWriter().write("");
	}
	return NONE;
}
//�������ﳵ
private int opnum;//����ҳ���ϴ���������������
public String docart(){
	/*Map<Course,Integer> cart=(Map<Course, Integer>) getRequest().getSession().getAttribute("cart");
    Course course=new Course();
    course.setCourseid(getModel().getCourseid());
	if(opnum==0)
		cart.remove(course);
	if(cart.containsKey(course))
	cart.put(course, opnum);
	*/
	List<Cart> cartlist=(List<Cart>) getRequest().getSession().getAttribute("cart");
	Course course=new Course();
	course.setCourseid(getModel().getCourseid());
	for(Cart cart:cartlist){
		if(cart.getCartmap().containsKey(course)){
			if(opnum==0)
				cart.getCartmap().remove(course);
			else
				cart.getCartmap().put(course, opnum);
		}
			
	}
	return "showcart";
}
//��ת��ȷ�϶���ҳ��
public String buymethod;
public String toconfirm_order(){
	if("ljgm".equals(getBuymethod())){//��������
		Course dbcourse=courseservice.findcoursebyid(getModel().getCourseid());
		push(dbcourse);
	}
	return "confirmorder";
}
public File getCourseimg() {
	return courseimg;
}
public void setCourseimg(File courseimg) {
	this.courseimg = courseimg;
}
public String getCourseimgFileName() {
	return courseimgFileName;
}
public void setCourseimgFileName(String courseimgFileName) {
	this.courseimgFileName = courseimgFileName;
}
public String getCourseimgContentType() {
	return courseimgContentType;
}
public void setCourseimgContentType(String courseimgContentType) {
	this.courseimgContentType = courseimgContentType;
}

public String getBuymethod() {
	return buymethod;
}
public void setBuymethod(String buymethod) {
	this.buymethod = buymethod;
}
public int getOpnum() {
	return opnum;
}
public void setOpnum(int opnum) {
	this.opnum = opnum;
}
public int getBuynum() {
	return buynum;
}
public void setBuynum(int buynum) {
	this.buynum = buynum;
}
public String[] getCourseids() {
	return courseids;
}
public void setCourseids(String[] courseids) {
	this.courseids = courseids;
}



}
