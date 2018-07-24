package com.xqbang.web.action;

import java.io.IOException;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.xqbang.service.IClicknumservice;
import com.xqbang.service.ICommentservice;
import com.xqbang.service.ICourceservice;
import com.xqbang.service.IMerchantservice;
import com.xqbang.service.IOrderservice;
import com.xqbang.service.IUserservice;

public class Baseaction<T> extends ActionSupport implements ModelDriven<T> {
    private T t;
	@Override
	public T getModel() {
		return t;
	}
	//实例化T
	public Baseaction(){
		try {
			//1 获得T运行时Class
			ParameterizedType paramType = (ParameterizedType) this.getClass().getGenericSuperclass();
			Class<T> clazz = (Class<T>) paramType.getActualTypeArguments()[0];
			//2 反射创建实例
			t = clazz.newInstance();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	}
	@Autowired
	protected IUserservice userservice;
	@Autowired
	protected IMerchantservice merchantservice;
	@Autowired
	protected ICourceservice courseservice;
	@Autowired
	protected IOrderservice orderservice;
	@Autowired
	protected ICommentservice commentservice;
	@Autowired
	protected IClicknumservice clicknumservice;
	//分页数据
	private int pagesize=12;
	private int currentpage=1;
	//简化值栈操作
	public void push(Object o){
		ActionContext.getContext().getValueStack().push(o);
	}
	public void set(String key,Object o){
		ActionContext.getContext().getValueStack().set(key, o);
	}
	public void put(String key,Object o){
		ActionContext.getContext().put(key, o);
	}
	public void putsession(String key,Object o){
		ActionContext.getContext().getSession().put(key, o);
	}
	public void putapplication(String key,Object o){
		ActionContext.getContext().getApplication().put(key, o);
	}
	public HttpServletRequest getRequest(){
		return ServletActionContext.getRequest();
	}
	public HttpServletResponse getResponse(){
		return ServletActionContext.getResponse();
	}
	//将list转json
	public  String writeSetJson(List list, String[] excludes) throws IOException {
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(excludes);
		JSONArray jsonObject = JSONArray.fromObject(list, jsonConfig);
		String json = jsonObject.toString();
		System.out.println("转换："+json);
		ServletActionContext.getResponse().setContentType(
				"text/json;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().print(json);
		return json;
	}
	/*------------------------------------------*/
    public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
    public int getPagesize() {
		return pagesize;
	}
    public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
    public int getCurrentpage() {
		return currentpage;
	}
	public T getT() {
		return t;
	}
	public void setT(T t) {
		this.t = t;
	}
	
}
