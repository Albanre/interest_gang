<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加购物车成功</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <link rel="stylesheet" type="text/css" href="styles.css">
   <style type="text/css">
   #content{height:350px;text-align:left;font-size:18px;line-height:300px}
   </style>
  </head>
  
  <body>
  <div id="container">
  <jsp:include page="/orderhead.jsp"></jsp:include>
  <div id="content">
  <div style="float:left;margin-top:135px;margin-left:20%"><img src="images/jysuccess.png"></div>&emsp;加入购物车成功，您可以&emsp;
  <a href="${pageContext.request.contextPath }/course/courseaction_findcourseinfo?courseid=<s:property value='courseid'/>">返回查看课程信息</a>&emsp;<a href="${pageContext.request.contextPath }/uiaction_user_cart">查看购物车</a></p>
  <div class="clear"></div>
  </div>
  <jsp:include page="/footer.jsp"></jsp:include>
  </div>
  </body>
</html>
