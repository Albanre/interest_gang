package com.xqbang.web.filter;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.xqbang.domain.User;
import com.xqbang.service.IUserservice;
import com.xqbang.service.impl.Userserviceimpl;
import com.xqbang.utils.MD5Utils;
@Component
public class AutoLoginFilter implements Filter{
    private IUserservice userservice;
	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)arg0;
		HttpServletResponse res=(HttpServletResponse)arg1;
		String uri=req.getRequestURI(); // /interest_gang/login.jsp
		String path=req.getContextPath();// /interest_gang
		path=uri.substring(path.length());// /login.jsp
		if(!("/login.jsp".equals(path)||"/user/useraction_login.action".equals(path)||"/user/useraction_logout.action".equals(path)||"/user/useraction_register.action".equals(path)||"/register.jsp".equals(path))){
			User u=(User) req.getSession().getAttribute("user");
			if(u==null){//判断用户当前是否登录
				String username="";
				String password="";
				String value="";
				Cookie[] cookies=req.getCookies();
				for(int i=0;cookies!=null&&i<cookies.length;i++){
					if("user".equals(cookies[i].getName())){
						value=cookies[i].getValue();
						String[] values=value.split("&");
						username=values[0];
						password=values[1];
					}
				}
				//执行登录操作
				if(!"".equals(value)){//对应的cookie不为空，才登录
				User user=userservice.login(username, MD5Utils.md5(password));
				if(user!=null){
					req.getSession().setAttribute("loginuser",user);
				}
				}
			}
			
		}
		chain.doFilter(req, res);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		ServletContext sc=arg0.getServletContext();
		WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(sc);
		userservice=(IUserservice) wac.getBean("userservice");
	}

}
