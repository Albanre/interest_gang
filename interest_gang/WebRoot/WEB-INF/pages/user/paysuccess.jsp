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
    
    <title>支付成功</title>
    
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
   #content{font-size:18px;height:350px;padding-top:150px}
   </style>
   </head>
  
  <body>
  <div id="container">
  <jsp:include page="/head.jsp"></jsp:include>
  <div id="content">
      订单支付成功，<a href="${pageContext.request.contextPath }/order/orderaction_findorderinfo?orderid=<s:property value='orderid'/>">查看订单详情</a>
  </div>
  <jsp:include page="/footer.jsp"></jsp:include>
  </div>
  </body>
</html>
