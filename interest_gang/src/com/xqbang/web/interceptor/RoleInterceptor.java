package com.xqbang.web.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.xqbang.domain.User;

public class RoleInterceptor extends MethodFilterInterceptor{

	@Override
	protected String doIntercept(ActionInvocation arg0) throws Exception {
		HttpServletRequest request=ServletActionContext.getRequest();
		User user=(User) request.getSession().getAttribute("loginuser");
		String requri=request.getRequestURI();
		if("mermber".equals(user.getRole())){
			return "noauthor";
		}
		return arg0.invoke();
	}

}
