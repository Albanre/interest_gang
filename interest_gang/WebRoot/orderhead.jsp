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
    
    <title>My JSP 'orderhead.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/reset.css">
    <style type="text/css">
   #header{
height:150px;background-color: #FFFFFF;
}
#nav{
background-color:#F2F2F2;height:30px;border: 1px solid #E2E2E2;
}
#nav li{
line-height:30px;font-size:13px;position:relative;float:left;
}
#unav>li{color:#999999;width:8%}
#unav{padding-left:10px}
#nav a:hover{color:#FF6700;}
#nav a{color:#999999;}
#container a:hover{color:#FF6700;}
.sub-nav{display:none;position:absolute;border:0.5px solid #F2F2F2}
.sub-nav li{color:#999999;background-color:#FFFFFF;width:100%}
#logoandtis{width:90%;margin-top:30px}
#logo{float:left;width:20%}
#jindutiao{float:right;color:#888888;font-size:20px;width:80%;margin-top:20px}
.jdtspan{margin-left:3%;margin-right:3%}
    </style>
  </head>
  
  <body>
  <div id="header">
   <div id="nav">
    <ul id="unav">
	<li style="width:auto">嗨，欢迎来到兴趣帮</li>
	<s:if test="#session.loginuser==null">
	<li><a href="login.jsp">登录</a></li>
	<li style="margin-left:-30px"><a href="register.jsp">免费注册</a></li>
	</s:if>
	<s:if test="#session.loginuser!=null">
	<li style="margin-left:5%">欢迎您:<s:property value="#session.loginuser.username"/><li>
	<li style="width:auto;"><a href="${pageContext.request.contextPath }/user/useraction_logout">注销</a></li>
	</s:if>
	<li style="margin-left:30%" class="hmeauli">个人中心
	<ul class="sub-nav">
	<li><a href="${pageContext.request.contextPath }/user/useraction_findorderbyuser">我的订单</a></li>
	<li><a href="${pageContext.request.contextPath }/user/useraction_findcommentbyuser">我的评价</a></li>
	<li><a href="${pageContext.request.contextPath }/uiaction_user_account_manage">账户设置</a></li>
	</ul>
	</li>
	<li><a href="${pageContext.request.contextPath }/uiaction_user_cart">购物车</a></li>
	<li><a href="${pageContext.request.contextPath }/user/useraction_findcollectbyuser">收藏夹</a></li>
	<li><a href="${pageContext.request.contextPath }/user/useraction_findhistoryrecord">我的足迹</a></li>
	<li class="hmeauli">商家中心
	<ul class="sub-nav">
	<li><a href="merchantregister.jsp">注册商家</a></li>
	<li><a href="merchantlogin.jsp">商家登录</a></li>
	</ul>
	</li>
	
	</ul>
    </div>
    <div id="logoandtis">
    <div id="logo">
    <a href="index.jsp"><img src="images/xqblogo.jpg"></a>
    </div>
    <div id="jindutiao">
     <span class="jdtspan">拍下课程</span>><span class="jdtspan">付款</span>><span class="jdtspan">学习课程</span>><span class="jdtspan" style="margin-right:0">评价</span>
    </div>
    </div>
    </div>
  </body>
</html>
   <!-- 导入jquery核心类库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
$(".hmeauli").hover(
function(){
$(this).css("background-color","#FFFFFF");
$(this).children().slideDown();
},
function(){
$(this).css("background-color","#F2F2F2");
$(this).children().slideUp();
}
)
})
</script>