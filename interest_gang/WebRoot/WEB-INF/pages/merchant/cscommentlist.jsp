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
    
    <title>My JSP 'cscommentlist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <style type="text/css">
   #content{width:85%;padding-bottom: 150px;color:#7F7F7F}
  #content li{float:left;list-style: none}
  #head{margin-top:20px;color:#7F7F7F}
  .clear{clear: both}
  #content_1{height:50px;margin-top:20px;background-color: #F5F5F5;border:0.6px solid #E8E8E8}
  .content_2{padding-top:15px;padding-bottom: 15px}
  </style>
  </head>
  
  <body>
  <div id="container">
  <div id="head">用户对&nbsp;<s:property value="coursename"/>&nbsp;的评价：</div>
  <div id="content">
  <s:if test="comments.size!=0"><%--评价列表不为空 --%>
  <div id="content_1">
  <ul>
  <li style="width:45%">评价信息</li>
  <li style="width:35%">评价用户</li>
  <li style="width:20%">评分</li>
  </ul>
  </div>
  <%--评价循环开始 --%>
  <s:iterator value="comments">
  <div class="content_2">
  <ul>
  <li style="width:45%;text-align:left;">
  <div style="margin-left:8px"><s:property value="cm_content"/></div>
  <div style="margin-top:10px;margin-left:8px"><s:date name="cm_time" format="yyyy-MM-dd hh:mm:ss"/></div>
  </li>
  <li style="width:35%">
  <s:property value="user.username"/>
  </li>
  <li style="width:20%"><s:property value="score"/></li>
  </ul>
  </div>
  <div class="clear"></div>
  <hr/>
  </s:iterator>
  <%--评价循环结束--%>
  </s:if>
  <s:else>
  <div style="height:195px;line-height:190px;font-size:18px">暂无评价</div>
  </s:else>
  </div>
  </div>
  </body>
</html>
