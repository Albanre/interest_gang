<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商家登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <style type="text/css">
	*{
	margin:0 auto;
	padding:0;
	}
	body{background:azure;text-align:center;font-size:20px}
	h1{color:#FF7E00}
	#msg{height:25px;color:red}
	#content{margin-top:30px}
	#container{width:800px}
	#fm li{list-style: none;margin-top:30px}
	#footer{margin-top:10px}
	.input{height:50px;width:300px;font-size:20px}
	.sbt{background-color:#FF7E00;height:50px;width:300px;font-size:20px;color:white}
  </style>
  </head>
  
  <body onload="add('${cookie.merchant.value}')">
 <div id="container">
  <div id="header"><h1>商家后台登录</h1></div>
  <div id="content">
  <div id="msg" style="width:30%"><span><s:actionerror/></span></div>
  <div id="fm">
  <form action="${pageContext.request.contextPath }/merchant/merchantaction_login" method="post" onsubmit="return checkfm(this)">
  <ul>
  <li><label>用户名：</label><input class="input" type="text" name="username" title="用户名" placeholder="请输入用户名">&emsp;&emsp;&emsp;&emsp;</li>
  <li><label>密码：</label><input type="password" class="input" name="password" title="密码" placeholder="请输入密码">&emsp;&emsp;&emsp;</li>
  <li margin-left="500px"><input type="checkbox" name="remember" ${!empty cookie.merchant?"checked":"" }>记住我&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a href="">忘记密码</a></li>
  <li><input type="submit" class="sbt" value="登录" ></li>
  </ul>
  </form>
  </div>
  </div>
  <div id="footer">还没有账号？<a href="merchantregister.jsp">去注册</a>&emsp;&emsp;&emsp;&emsp;</div>
  </div>
  </body>
</html>
<script type="text/javascript">
//验证表单
function checkfm(fm){
var span=document.getElementsByTagName("span")[0];
for(var i=0;i<fm.length;i++){
if(fm.elements[i].value==""){
span.innerHTML="抱歉，"+fm.elements[i].title+"不能为空";
return false;
}else{
span.innerHTML="";
}
}
}
//将cookie存的用户名密码赋值到对应的文本框
function add(str){
if(str!=""){
var user=str.split("&");
document.getElementsByName("username")[0].value=user[0];
document.getElementsByName("password")[0].value=user[1];
}
}
</script>
