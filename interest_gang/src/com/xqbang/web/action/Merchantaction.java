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
	//ע��
	private String province;//ʡ
	private String county;//��
	private String detailaddress;//��ϸ��ַ
	private String code;//ҳ�洫��������֤��
	private String repassword;
	public String register() throws IOException{
		String rcode=(String) getRequest().getSession().getAttribute("rcode");
		System.out.println("��֤�룺"+rcode);
		getResponse().setContentType("text/html;charset=UTF-8");
		if(!rcode.equalsIgnoreCase(code)){
			this.addActionError("��֤�����");
			getResponse().getWriter().print("��֤�����");//easyUI���ύ��Struts���ܽ�����ת��
			return NONE;
		}
		Merchant merchant=merchantservice.findmerchantbyuname(getT().getUsername());
		if(merchant!=null){
			getResponse().getWriter().print("�û����Ѵ���");//easyUI���ύ��Struts���ܽ�����ת��
			return NONE;
		}
		String paddress=getProvince()+getT().getCity()+getCounty()+getDetailaddress();
		getT().setAddress(paddress);
		merchantservice.register(getT());
		getResponse().getWriter().print("regissuccess");//easyUI���ύ��Struts���ܽ�����ת��
		return NONE;
		
	}
	/*--------------------�̼ҵ�¼-----------------------*/
	private String remember;
	public String login() throws IOException{
		Merchant pagemct=getT();
		Merchant dbmerchant=merchantservice.login(pagemct.getUsername(),pagemct.getPassword());
		getResponse().setContentType("text/html;charset=UTF-8");
		Cookie ck=new Cookie("merchant", pagemct.getUsername()+"&"+pagemct.getPassword());
		ck.setPath("/");
		if(dbmerchant==null){
			this.addActionError("�û��������벻ƥ��");
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
	//�޸Ļ�����Ϣ
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
	//�̼�ע��
	public String logout(){
		getRequest().getSession().invalidate();
		return "sjlogin";
	}
	//�̼Ҳ�ѯ�Լҿγ��б�
	public String findmcourse() throws IOException{
		Merchant currentmerchant=(Merchant) getRequest().getSession().getAttribute("loginmerchant");
		Set<Course> courseset=currentmerchant.getCourses();
		List<Course> list=new ArrayList<Course>(courseset);
		String json=this.writeSetJson(list, new String[]{"merchant","users","o_time","comments","pnumpaixu","pricepaixu"});
		return NONE;
		
	}
	/*--------------------�����̼�ID��ѯ�̼���Ϣ-----------------------*/
public String findmerchantbyid(){
	Merchant dbmerchant=merchantservice.findmerchantbyid(getModel().getMerchantid());
	push(dbmerchant);
	return "merchantinfo";
}
	
	/*--------------------����Ա����̼�-----------------------*/
private String ispass;//����ҳ�洫�������Ƿ�ͨ������
public String checkmerchant(){
	int state1=0;
	if("tg".equals(ispass)){
		state1=1;
	}
	merchantservice.check(state1,getModel().getMerchantid());
	return "merchantlist";
}
/*--------------------��ѯ�̼��б�-----------------------*/
public String findallmerchant(){
	List<Merchant> mlist=merchantservice.findall();
	set("mlist", mlist);
	return "merchantlist";
}
/*--------------------ajax��֤�̼��Ƿ����-----------------------*/
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
