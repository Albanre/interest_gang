<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'resetpwd.jsp' starting page</title>
    
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
  #content{width:40%;border: 1px solid #85D04D;height:220px;margin-top:200px}
  #content_1{background-color: #85D04D;color:#FFFFFF;height:30px;text-align:left;padding-left:10px;line-height:30px}
  #content_2{margin-top:10px;padding-left:10px}
  #sbt{width:35%}
	</style>
  <script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
function checkfm(){
if($("#pwd").val()!=$("#repwd").val()){
$("#errormsg").html("确认密码与新密码不匹配")
return false;
}
return true;
}
</script>
  </head>
  
  <body>
  <div id="container">
  <div id="content">
  <div id="content_1">重置密码</div>
  <div id="errormsg" style="margin-top:10px;color:red;padding-left:10px;height:30px"><s:property value="errormsg"/></div>
  <div id="content_2">
  <form action="${pageContext.request.contextPath }/user/useraction_resetpwd" method="post" onsubmit="return checkfm()">
 <p>&emsp;&emsp;&emsp;用户名：<input type="text" name="username" value="${param.username }" readonly="readonly"></p>
 <p style="margin-top:10px">请输入新密码：<input type="password" id="pwd" name="password"></p>
 <p style="margin-top:10px">&emsp;确认新密码：<input type="password" id="repwd" name="repassword"></p><br/>
 <p style="text-align:center"><input type="submit" value="提交" id="sbt"></p>
  </form>
  </div>
  </div>
  </div>
  </body>
</html>
