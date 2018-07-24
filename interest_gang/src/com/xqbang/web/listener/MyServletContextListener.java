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
/*������web��Ŀʱ��Servlet����(����Tomcat)���web.xml�����ļ��е������ڵ��,�ڵ���������appliactionContext.xml(��Spring�������ļ�)
 * ���ڵ���������������(����TestTaskListener)ʵ����Listener��������������servlet��������ģ����е�TestTaskListener����servlet����
 * ʵ������������contextInitialized�����ģ����ǣ�SelectDataService��ͨ��@Serviceע��ģ�Ҳ����˵SelectDataService����Spring
 * ��������ģ���Spring�������޷�ֱ��ͨ������ע��õ�Spring���������beanʵ�������á�Ϊ����Spring������õ�Spring���������bean������ʹ��
 * Spring�ṩ�Ĺ�����WebApplicationContextUtils��Ҳ����˵��������servlet���������Listener��ʹ�øù������Spring�����bean��*/
public class MyServletContextListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("�������ر���");
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		ServletContext sc=arg0.getServletContext();
		WebApplicationContext wac=WebApplicationContextUtils.getWebApplicationContext(sc);
		IOrderservice orderservice=(IOrderservice) wac.getBean("orderservice");
		Timer t=new Timer();//����һ����ʱ������
		t.schedule(new Mytask(orderservice), 60000, 60000);//���������ӳ�һ����ִ�У�һ����ִ��һ��
		
	}

}
