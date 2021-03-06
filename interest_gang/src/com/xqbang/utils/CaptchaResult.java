package com.xqbang.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.StrutsResultSupport;

import cn.dsna.util.images.ValidateCode;

import com.opensymphony.xwork2.ActionInvocation;

public class CaptchaResult extends StrutsResultSupport{

	private int width;
	private int height;

	@Override
	protected void doExecute(String arg0, ActionInvocation arg1)
			throws Exception {
		/*
		 * 使用第三方生成验证码的jar包
		 * 	 1.拷贝ValidateCode.jar到工程lib目录
		 * 	 2.创建ValidateCode的对象
		 * 	 3.获取响应对象输出流
		 * 	 4.输出到浏览器
		 */
		//创建ValidateCode的对象
		//参数详解：1:图像宽度 2.图像高度 3.数字的格式 4.干扰线条数
		ValidateCode code = new ValidateCode(width,height,4,10);
		//获取响应对象
		HttpServletRequest request=ServletActionContext.getRequest();
		request.getSession().setAttribute("rcode", code.getCode().toLowerCase());
		HttpServletResponse response = ServletActionContext.getResponse();
		//输出到浏览器
		code.write(response.getOutputStream());
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}
   
}
