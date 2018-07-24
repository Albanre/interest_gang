package com.xqbang.web.action;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UUID;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.xqbang.domain.Cart;
import com.xqbang.domain.Course;
import com.xqbang.domain.Order;
import com.xqbang.domain.Orderitem;
import com.xqbang.domain.User;
@Controller
@Scope("prototype")
public class Orderaction extends Baseaction<Order>{
	private String jsmethod;
	private String courseid;
	private int buynum;//���ڽ��չ�������
	/*--------------------��������-----------------------*/
    public String createorder(){
	/*Order order=getModel();
	order.setOrderid(UUID.randomUUID().toString().substring(0, 18));
	User u=(User) getRequest().getSession().getAttribute("loginuser");
	order.setUser(u);
	order.setReceivername(u.getUsername());
	order.setReceiverphone(u.getTelephone());
	if("gwc".equals(jsmethod)){//�ӹ��ﳵ����
	//ȡ����Ȥ��
	Map<Course,Integer> cart=(Map<Course, Integer>) getRequest().getSession().getAttribute("cart");
	Set<Orderitem> oiset=new HashSet<Orderitem>();
	for(Map.Entry<Course, Integer> entry:cart.entrySet() )
	{
		Orderitem oi=new Orderitem();
		oi.setCourse(entry.getKey());//����Ȥ�������붩����
		oi.setOrder(order);;//��order����ŵ�orderitem
		oi.setBuy_num(entry.getValue());
		oiset.add(oi);//�����������Ӷ�����
	}
	order.setOrderitems(oiset);//��������Ϸ��붩��������
	//����ҵ���߼�
	orderservice.addorder(order);
	cart.clear();//���ɶ����󽫹��ﳵ���
	}else{//ֱ�ӹ���
		Course course=courseservice.findcoursebyid(courseid);
		Set<Orderitem> oiset=new HashSet<Orderitem>();
		Orderitem oi=new Orderitem();
		oi.setCourse(course);
		oi.setOrder(order);
		oi.setBuy_num(buynum);
		oiset.add(oi);
		order.setOrderitems(oiset);
		orderservice.addorder(order);
	}
	push(order);
	*/
    Order order=getModel();
    order.setOrderid(UUID.randomUUID().toString().substring(0, 18));
    User u=(User) getRequest().getSession().getAttribute("loginuser");
    order.setUser(u);
    order.setReceivername(u.getUsername());
    order.setReceiverphone(u.getTelephone());
    if("gwc".equals(jsmethod)){//�ӹ��ﳵ����
        //ȡ����Ȥ��
    	List<Cart> cartlist=(List<Cart>) getRequest().getSession().getAttribute("cart");
    	Set<Orderitem> oiset=new HashSet<Orderitem>();
    	for(Cart cart:cartlist){
    		for(Map.Entry<Course, Integer> entry:cart.getCartmap().entrySet()){
    			Orderitem oi=new Orderitem();
    			oi.setCourse(entry.getKey());
    			oi.setBuy_num(entry.getValue());
    			oi.setOrder(order);
    			oiset.add(oi);
    		}
    	}
    	order.setOrderitems(oiset);
    	getRequest().getSession().setAttribute("cart", new ArrayList<Cart>());
    }else{//ֱ�ӹ���
    	Course course=courseservice.findcoursebyid(courseid);
		Set<Orderitem> oiset=new HashSet<Orderitem>();
		Orderitem oi=new Orderitem();
		oi.setCourse(course);
		oi.setOrder(order);
		oi.setBuy_num(buynum);
		oiset.add(oi);
		order.setOrderitems(oiset);
    }
    orderservice.addorder(order);//����ҵ���߼�
    push(order);
	//ת��֧��ҳ��
	return "topay";
    }
    //�����ӳ�֧��
    public String topayorder(){
    	return "topay";
    }
    /*--------------------֧������-----------------------*/
    public String payorder(){
    orderservice.updatepaystate(getModel().getOrderid(),1);
    return "paysuccess";
    }
    //ȥ����
    public String tocomment(){
    	Order order=orderservice.findbyid(getModel().getOrderid());
    	push(order);
    	return "tocomment";
    }
    //�鿴��������
    public String findorderinfo(){
    	Order dborder=orderservice.findbyid(getModel().getOrderid());
    	if(dborder.getPaystate()==0){//�ж������Ƿ�֧����δ֧��������ʧЧʱ��
    		String stimestr="";
    		Long l=86400000-(System.currentTimeMillis()-dborder.getOrdertime().getTime());//�õ�ʣ���������һ����86400000����
    		int stime=(int) Math.ceil(l*1.0/60000);//����ȡ��������һ���Ӽ�һ����
    	    int shour=stime/60;//�õ�ʣ��Сʱ��
    		int smintue=stime%60;//�õ�ʣ�������
    		if(shour>0&&smintue>0)
    			stimestr=shour+"Сʱ"+smintue+"����";
    		if(shour>0&&smintue==0)
    			stimestr=shour+"Сʱ";
    		if(shour==0&&smintue>0)
    			stimestr=smintue+"����";
    		set("stimestr", stimestr);
    	}
    	push(dborder);
    	return "orderinfo";
    }
    //ȡ������
    public String cacelorder(){
    	Order dborder=orderservice.findbyid(getModel().getOrderid());
    	orderservice.makeorderclose(dborder.getOrderid(), dborder.getOrderitems());
    	dborder.setPaystate(-1);//�ֶ���֧��״̬�������ٲ����ݿ�
    	push(dborder);
    	return "orderinfo";
    }
    //ɾ������
    public String delorder(){
    	orderservice.delorder(getModel().getOrderid());
    	return "orderlist";
    }
	
	public String getJsmethod() {
		return jsmethod;
	}
	public void setJsmethod(String jsmethod) {
		this.jsmethod = jsmethod;
	}
	public String getCourseid() {
		return courseid;
	}
	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}
	public int getBuynum() {
		return buynum;
	}
	public void setBuynum(int buynum) {
		this.buynum = buynum;
	}
    
}
