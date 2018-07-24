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
	private int buynum;//用于接收购买数量
	/*--------------------创建订单-----------------------*/
    public String createorder(){
	/*Order order=getModel();
	order.setOrderid(UUID.randomUUID().toString().substring(0, 18));
	User u=(User) getRequest().getSession().getAttribute("loginuser");
	order.setUser(u);
	order.setReceivername(u.getUsername());
	order.setReceiverphone(u.getTelephone());
	if("gwc".equals(jsmethod)){//从购物车结算
	//取出兴趣车
	Map<Course,Integer> cart=(Map<Course, Integer>) getRequest().getSession().getAttribute("cart");
	Set<Orderitem> oiset=new HashSet<Orderitem>();
	for(Map.Entry<Course, Integer> entry:cart.entrySet() )
	{
		Orderitem oi=new Orderitem();
		oi.setCourse(entry.getKey());//将兴趣班对象放入订单项
		oi.setOrder(order);;//将order对象放到orderitem
		oi.setBuy_num(entry.getValue());
		oiset.add(oi);//往订单项集合添加订单项
	}
	order.setOrderitems(oiset);//将订单项集合放入订单对象中
	//调用业务逻辑
	orderservice.addorder(order);
	cart.clear();//生成订单后将购物车清空
	}else{//直接购买
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
    if("gwc".equals(jsmethod)){//从购物车结算
        //取出兴趣车
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
    }else{//直接购买
    	Course course=courseservice.findcoursebyid(courseid);
		Set<Orderitem> oiset=new HashSet<Orderitem>();
		Orderitem oi=new Orderitem();
		oi.setCourse(course);
		oi.setOrder(order);
		oi.setBuy_num(buynum);
		oiset.add(oi);
		order.setOrderitems(oiset);
    }
    orderservice.addorder(order);//调用业务逻辑
    push(order);
	//转向支付页面
	return "topay";
    }
    //订单延迟支付
    public String topayorder(){
    	return "topay";
    }
    /*--------------------支付订单-----------------------*/
    public String payorder(){
    orderservice.updatepaystate(getModel().getOrderid(),1);
    return "paysuccess";
    }
    //去评价
    public String tocomment(){
    	Order order=orderservice.findbyid(getModel().getOrderid());
    	push(order);
    	return "tocomment";
    }
    //查看订单详情
    public String findorderinfo(){
    	Order dborder=orderservice.findbyid(getModel().getOrderid());
    	if(dborder.getPaystate()==0){//判定订单是否支付，未支付则计算出失效时间
    		String stimestr="";
    		Long l=86400000-(System.currentTimeMillis()-dborder.getOrdertime().getTime());//得到剩余毫秒数，一天有86400000毫秒
    		int stime=(int) Math.ceil(l*1.0/60000);//向上取整，不足一分钟计一分钟
    	    int shour=stime/60;//得到剩余小时数
    		int smintue=stime%60;//得到剩余分钟数
    		if(shour>0&&smintue>0)
    			stimestr=shour+"小时"+smintue+"分钟";
    		if(shour>0&&smintue==0)
    			stimestr=shour+"小时";
    		if(shour==0&&smintue>0)
    			stimestr=smintue+"分钟";
    		set("stimestr", stimestr);
    	}
    	push(dborder);
    	return "orderinfo";
    }
    //取消订单
    public String cacelorder(){
    	Order dborder=orderservice.findbyid(getModel().getOrderid());
    	orderservice.makeorderclose(dborder.getOrderid(), dborder.getOrderitems());
    	dborder.setPaystate(-1);//手动改支付状态，不用再查数据库
    	push(dborder);
    	return "orderinfo";
    }
    //删除订单
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
