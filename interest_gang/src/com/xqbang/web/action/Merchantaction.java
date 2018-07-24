package com.xqbang.web.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.Cookie;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.xqbang.domain.Course;
import com.xqbang.domain.Merchant;
import com.xqbang.domain.User;
@Controller
@Scope("prototype")
public class Merchantaction extends Baseaction<Merchant>{
	//注册
	private String province;//省
	private String county;//区
	private String detailaddress;//详细地址
	private String code;//页面传过来的验证码
	private String repassword;
	public String register() throws IOException{
		String rcode=(String) getRequest().getSession().getAttribute("rcode");
		System.out.println("验证码："+rcode);
		getResponse().setContentType("text/html;charset=UTF-8");
		if(!rcode.equalsIgnoreCase(code)){
			this.addActionError("验证码错误");
			getResponse().getWriter().print("验证码错误");//easyUI表单提交到Struts不能进行跳转，
			return NONE;
		}
		Merchant merchant=merchantservice.findmerchantbyuname(getT().getUsername());
		if(merchant!=null){
			getResponse().getWriter().print("用户名已存在");//easyUI表单提交到Struts不能进行跳转，
			return NONE;
		}
		String paddress=getProvince()+getT().getCity()+getCounty()+getDetailaddress();
		getT().setAddress(paddress);
		merchantservice.register(getT());
		getResponse().getWriter().print("regissuccess");//easyUI表单提交到Struts不能进行跳转，
		return NONE;
		
	}
	/*--------------------商家登录-----------------------*/
	private String remember;
	public String login() throws IOException{
		Merchant pagemct=getT();
		Merchant dbmerchant=merchantservice.login(pagemct.getUsername(),pagemct.getPassword());
		getResponse().setContentType("text/html;charset=UTF-8");
		Cookie ck=new Cookie("merchant", pagemct.getUsername()+"&"+pagemct.getPassword());
		ck.setPath("/");
		if(dbmerchant==null){
			this.addActionError("用户名与密码不匹配");
			ck.setMaxAge(0);
			return "sjlogin";
		}
		if(remember!=null){
			ck.setMaxAge(Integer.MAX_VALUE);
		}else{
			ck.setMaxAge(0);
		}
		getResponse().addCookie(ck);
		putsession("loginmerchant", dbmerchant);
		return "home";
	}
	//修改机构信息
	public String modifyshopinfo() throws IOException{
		String paddress=getProvince()+getT().getCity()+getCounty()+getDetailaddress();
		getT().setAddress(paddress);
		Merchant mct1=(Merchant) getRequest().getSession().getAttribute("loginmerchant");
		getT().setMerchantid(mct1.getMerchantid());
		Merchant mct2=merchantservice.updateshopinfo(getT());
		getRequest().getSession().setAttribute("loginmerchant",mct2);
		getResponse().getWriter().print("true");
		return NONE;
	}
	//商家注销
	public String logout(){
		getRequest().getSession().invalidate();
		return "sjlogin";
	}
	//商家查询自家课程列表
	public String findmcourse() throws IOException{
		Merchant currentmerchant=(Merchant) getRequest().getSession().getAttribute("loginmerchant");
		Set<Course> courseset=currentmerchant.getCourses();
		List<Course> list=new ArrayList<Course>(courseset);
		String json=this.writeSetJson(list, new String[]{"merchant","users","o_time","comments","pnumpaixu","pricepaixu"});
		return NONE;
		
	}
	/*--------------------根据商家ID查询商家信息-----------------------*/
public String findmerchantbyid(){
	Merchant dbmerchant=merchantservice.findmerchantbyid(getModel().getMerchantid());
	push(dbmerchant);
	return "merchantinfo";
}
	
	/*--------------------管理员审核商家-----------------------*/
private String ispass;//接收页面传过来的是否通过参数
public String checkmerchant(){
	int state1=0;
	if("tg".equals(ispass)){
		state1=1;
	}
	merchantservice.check(state1,getModel().getMerchantid());
	return "merchantlist";
}
/*--------------------查询商家列表-----------------------*/
public String findallmerchant(){
	List<Merchant> mlist=merchantservice.findall();
	set("mlist", mlist);
	return "merchantlist";
}
/*--------------------ajax验证商家是否存在-----------------------*/
public String ajaxcheckmcname() throws IOException{
	Merchant m=merchantservice.findmerchantbyuname(getModel().getUsername());
	if(m!=null){
		getResponse().getWriter().print(false);
	}else{
		getResponse().getWriter().print(true);
	}
	return NONE;
}
public String getIspass() {
	return ispass;
}
public void setIspass(String ispass) {
	this.ispass = ispass;
}
public String getCode() {
	return code;
}
public void setCode(String code) {
	this.code = code;
}
public String getRepassword() {
	return repassword;
}
public void setRepassword(String repassword) {
	this.repassword = repassword;
}
public String getRemember() {
	return remember;
}
public void setRemember(String remember) {
	this.remember = remember;
}
public String getProvince() {
	return province;
}
public void setProvince(String province) {
	this.province = province;
}
public String getCounty() {
	return county;
}
public void setCounty(String county) {
	this.county = county;
}
public String getDetailaddress() {
	return detailaddress;
}
public void setDetailaddress(String detailaddress) {
	this.detailaddress = detailaddress;
}

}
