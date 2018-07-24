package com.xqbang.web.listener;

import java.util.Timer;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.xqbang.service.IOrderservice;
import com.xqbang.service.IUserservice;
import com.xqbang.utils.Mytask;
/*在启动web项目时，Servlet容器(比如Tomcat)会读web.xml配置文件中的两个节点和,节点用来加载appliactionContext.xml(即Spring的配置文件)
 * ，节点用来创建监听器(比如TestTaskListener)实例。Listener的生命周期是由servlet容器管理的，例中的TestTaskListener是由servlet容器
 * 实例化并调用其contextInitialized方法的，但是，SelectDataService是通过@Service注解的，也就是说SelectDataService是由Spring
 * 容器管理的，在Spring容器外无法直接通过依赖注入得到Spring容器管理的bean实例的引用。为了在Spring容器外得到Spring容器管理的bean，可以使用
 * Spring提供的工具类WebApplicationContextUtils。也就是说，可以在servlet容器管理的Listener中使用该工具类获Spring管理的bean。*/
public class MyServletContextListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("服务器关闭了");
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		ServletContext sc=arg0.getServletContext();
		WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(sc);
		IOrderservice orderservice=(IOrderservice) wac.getBean("orderservice");
		Timer t=new Timer();//创建一个计时器对象
		t.schedule(new Mytask(orderservice), 60000, 60000);//调度任务，延迟一分钟执行，一分钟执行一次
		
	}

}
