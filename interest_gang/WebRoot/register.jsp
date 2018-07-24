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
    
    <title>用户注册</title>
    
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
	#msg{height:25px;margin-top:25px;color:red}
	#container{}
	#fm li{list-style:none;margin-top:30px}
	#footer{margin-top:10px}
	tr{height:70px}
	.input{height:40px;width:300px;font-size:20px}
	.code{height:40px;width:130px;font-size:20px}
	.sbt{background-color:#FF7E00;height:40px;width:300px;font-size:20px;color:white}
  </style>
  </head>
  
  <body>
  <div id="container">
  <div id="header"><h1>新用户注册</h1></div>
  <div id="content">
  <div id="msg"><span><s:actionerror/>&emsp;&emsp;&emsp;&emsp;</span></div>
  <div id="fm">
  <%-- <form action="${pageContext.request.contextPath }/user/useraction_register.action" method="post" onsubmit="return checkfm(this)">
 <ul>
 <li><label>用户名：</label><input type="text" name="username" class="input" title="用户名" placeholder="用户名">&emsp;&emsp;&emsp;&emsp;</li>
 <li><label>密码：</label><input type="password" name="password" class="input" title="密码" placeholder="密码">&emsp;&emsp;&emsp;</li>
 <li><label>确认密码：</label><input type="password" name="repassword" class="input" title="确认密码" placeholder="确认密码">&emsp;&emsp;&emsp;&emsp;&emsp;</li>
 <li><label>邮箱：</label><input type="text" name="email" class="input" title="邮箱" placeholder="邮箱">&emsp;&emsp;&emsp;</li>
 <li><label>验证码：</label><input type="text" name="code" class="code" title="验证码" placeholder="验证码" width="100px"><img src="${pageContext.request.contextPath }/codeaction" id="codeimg">&emsp;&emsp;&emsp;&emsp;</li>
 <li><input type="submit" value="提交" class="sbt"></li>
 </ul>
  </form>
  --%>
  <s:form action="useraction_register.action" namespace="/user" method="post" onsubmit="return checkfm(this)">
  <ul>
  <li><label>用户名：</label><s:textfield name="username" cssClass="input"  title="用户名" placeholder="用户名"></s:textfield>&emsp;&emsp;&emsp;&emsp;</li>
  <li><label>密码：</label><s:password name="password" cssClass="input"  title="密码" placeholder="密码"></s:password>&emsp;&emsp;&emsp;</li>
  <li><label>确认密码：</label><s:password name="repassword" cssClass="input"  title="确认密码" placeholder="确认密码"></s:password>&emsp;&emsp;&emsp;&emsp;&emsp;</li>
  <li><label>邮箱：</label><s:textfield name="email" cssClass="input"  title="邮箱" placeholder="邮箱"></s:textfield>&emsp;&emsp;&emsp;</li>
  <li><label>验证码：</label><s:textfield name="code" cssClass="code"  title="验证码" placeholder="验证码" cssStyle="width:100px"></s:textfield><img src="${pageContext.request.contextPath }/codeaction" id="codeimg">&emsp;&emsp;&emsp;&emsp;&emsp;</li>
  <li><input type="submit" value="提交" class="sbt"></li>
  </ul>
  </s:form>
  </div>
  </div>
  <div id="footer">
  <label>已有账号？<a href="login.jsp">去登录</a>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</label>
  </div>
  </div>
  </body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
var username=$('input[name="username"]');
//给用户名文本框绑定失去焦点事件
username.blur(function(){
if(username.val()==""){
$("span").html("<font color='red'>请输入用户名</font>")
}else{
$.ajax(
{url:"${pageContext.request.contextPath}/user/useraction_checkuname?username="+username.val()+"&time="+new Date().getTime(),
type:"GET",
success:function(result){
if(result=="false"){
$("span").html("<font color='red'>用户名已存在</font>")
}else{
$("span").html("<font color='green'>可以使用</font>");
}
}
}
)
}
})
//更换验证码
$("#codeimg").click(function(){
$(this).attr("src","${pageContext.request.contextPath }/codeaction?time="+new Date().getTime());
})
//验证表单
})
/*function changecode(){
document.getElementById("codeimg").src="codeservlet?time="+new Date().getTime();
}*/
function checkfm(fm){
for(var i=0;i<fm.length;i++){
if(fm.elements[i].value==""){
document.getElementsByTagName("span")[0].innerHTML="抱歉，"+fm.elements[i].placeholder+"不能为空";
return false;
}
var pwd=document.getElementsByName("password")[0].value;
var repwd=document.getElementsByName("repassword")[0].value;
if(pwd!=repwd){
document.getElementsByTagName("span")[0].innerHTML="确认密码和密码不一致";
return false;
}
}
}


</script>