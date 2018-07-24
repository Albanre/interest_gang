package com.xqbang.web.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class UserLoginInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		HttpServletRequest request=ServletActionContext.getRequest();
		String requri=request.getRequestURI();//�õ�����·��
		Object obj=request.getSession().getAttribute("loginuser");
		if(requri.contains("login")||requri.contains("register")||requri.contains("checkuname")||requri.contains("activeuser")||
				requri.contains("finduserpwd")||requri.contains("findhistoryrecord")||requri.contains("findmerchantbyid")||requri.contains("ajaxcheckmcname")||
				requri.contains("findcoursebypage")||requri.contains("findcourseinfo")||requri.contains("ajaxfindcourse")||requri.contains("codeaction")||
				requri.contains("reqfindpwd")||requri.contains("resetpwd")){
			//����Ҫ���صķ���
			return arg0.invoke();
		}else if(requri.contains("addcourse")||requri.contains("uiaction_merchant_home")){//������ʵ����̼Һ�̨ҳ��
			Object obj1=request.getSession().getAttribute("loginmerchant");
			if(obj1==null)
			return "sjlogin";
			return arg0.invoke();
		}else{//ǰ̨ҳ��
			if(obj==null)
				return "login";
			return arg0.invoke();
		}
	}

}
