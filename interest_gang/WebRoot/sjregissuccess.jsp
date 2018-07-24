<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商家注册成功</title>
    
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
  body{text-align:center;background-color: azure;}
  #container{height:600px;padding-top:200px;font-size:18px}
  </style>
  </head>
  
  <body>
  <div id="container">
    注册成功,<span id="secspan">3</span>秒后跳转到登录页面
  </div>
  </body>
</html>
   <!-- 导入jquery核心类库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
setInterval(daojishi,1000);
function daojishi(){
var a1=$("#secspan").text()-1;
$("#secspan").text(a1);
if(a1==1){
location.href="merchantlogin.jsp";
}
}
})
</script>
