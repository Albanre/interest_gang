<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>找回密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <style type="text/css">
  *{margin:0 auto;padding:0}
  body{}
  #content{width:60%;border: 1px solid #85D04D;height:150px;margin-top:200px}
  #content_1{background-color: #85D04D;color:#FFFFFF;height:30px;text-align:left;padding-left:10px;line-height:30px}
  #content_2{margin-top:10px;padding-left:10px}
  </style>
  </head>
  
  <body>
  <div id="container">
  <div id="content">
  <div id="content_1">找回密码</div>
  <div id="errormsg" style="margin-top:10px;color:red;padding-left:10px;height:30px"><s:property value="errormsg"/></div>
  <div id="content_2">
  <s:form action="useraction_reqfindpwd" namespace="/user" method="post">
  请输入需要找回密码的用户名：<s:textfield name="username"/>&emsp;<s:submit value="提交"/>
  </s:form>
  </div>
  </div>
  </div>
  </body>
</html>
