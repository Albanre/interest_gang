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
    
    <title>我的评价</title>
    
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
  #container{}
  #weizhi{height:30px;width:90%;text-align:left;line-height:30px;background-color: #F5F5F5}
  #content{width:85%;padding-bottom: 150px}
  #content li{float:left}
  #content_1{height:50px;line-height:50px;margin-top:30px;background-color: #F5F5F5;border:0.6px solid #E8E8E8}
  .content_2{padding-top:15px;padding-bottom: 15px}
  </style>
  </head>
  
  <body>
  <div id="container">
  <jsp:include page="/head.jsp"></jsp:include>
  <div id="weizhi">
  <p>您的位置：<a href="index.jsp">首页</a>&gt;评价管理</p>
  </div>
  <div id="content">
  <s:if test="comments.size!=0"><%--评价列表不为空 --%>
  <div id="content_1">
  <ul>
  <li style="width:45%">评价信息</li>
  <li style="width:35%">被评价课程</li>
  <li style="width:20%">操作</li>
  </ul>
  </div>
  <%--评价循环开始 --%>
  <s:iterator value="comments">
  <div class="content_2">
  <ul>
  <li style="width:45%;text-align:left;">
  <div style="margin-left:20px"><s:property value="cm_content"/></div>
  <div style="margin-top:10px;margin-left:20px"><s:date name="cm_time" format="yyyy-MM-dd hh:mm:ss"/></div>
  </li>
  <li style="width:35%">
  <a href="${pageContext.request.contextPath }/course/courseaction_findcourseinfo?courseid=<s:property value='course.courseid'/>">
  <s:property value="course.merchant.o_name"/><s:property value="course.coursename"/>
  </a>
  </li>
  <li style="width:20%"><a href="javascript:;">删除</a></li>
  </ul>
  </div>
  <div class="clear"></div>
  <hr/>
  </s:iterator>
  <%--评价循环结束--%>
  </s:if>
  <s:else>
  <div style="height:195px;line-height:190px;font-size:18px">您的评价列表为空</div>
  </s:else>
  </div>
  <jsp:include page="/footer.jsp"></jsp:include>
  </div>
  </body>
  </html>
