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
    
    <title>推荐列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <link rel="stylesheet" type="text/css" href="css/reset.css">
   <style type="text/css">
   #tjcontent{background-color: #F5F5F5;padding-bottom: 50px;margin-top:20px}
   #tjcontent a:hover{color:#FF6700}
   #tjcontent_1{height:60px;line-height:60px;font-size:20px;text-align:left}
   .courseli{background-color: #FFFFFF;width:20%;height:320px;float:left;margin-left:4%;margin-top:30px}
   </style>
   </head>
  
  <body>
  <div id="tjcontent">
  <div id="tjcontent_1">
  <div style="width:6px;margin-top:20px;margin-left:4%;background-color:#FF6700;height:20px;float:left"></div>&emsp;为你推荐
  <div class="clear"></div>
  </div>
  <div id="tjcontent_2">
  <div id="cl_content3">
  <ul>
  <s:iterator value="#session.loginuser.tjcourses"><%--循环开始 --%>
  <li class="courseli">
   <a href="${pageContext.request.contextPath }/course/courseaction_findcourseinfo?courseid=<s:property value='courseid'/>">
  		<img src="${pageContext.request.contextPath }/images/<s:property value='img_url'/>" width="95%" height="230px">
  		<div class ="divA">
		<div style="margin-top:10px;width:95%"><div style="float:left;font-size:20px;color:#FF6700;font-weight: bold;">¥<s:property value="price"/></div><div style="text-align:right;float:right;color:#95957D;font-size:15px">剩余容量&nbsp;<font color="#B57C5B"><s:property value="p_number"/></font></div><div class="clear"></div></div>
		<p style="margin-top:15px;font-size:14px"><s:property value="coursename"/></p>
		</div>
 	</a>	
  </li>
  </s:iterator><%--循环结束 --%>
  </ul>
  </div>
  <div class="clear"></div>
  </div>
  </div>
  </body>
</html>
