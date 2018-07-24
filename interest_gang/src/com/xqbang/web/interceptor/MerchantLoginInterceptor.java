package com.xqbang.web.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class MerchantLoginInterceptor extends MethodFilterInterceptor{

	@Override
	protected String doIntercept(ActionInvocation arg0) throws Exception {
		HttpServletRequest request=ServletActionContext.getRequest();
		Object obj=request.getSession().getAttribute("loginmerchant");
		String requri=request.getRequestURI();
		if(obj==null){
			return "sjlogin";
		}
		return arg0.invoke();
	}

}
