<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'head.jsp' starting page</title>
    
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
  body{text-align:center}
.clear{clear:both}
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
#logoandsear{margin-top:20px}
#logo{float:left;width:20%}
#sear{float:left;width:80%;margin-top:20px;}
#searinput{width:50%;height:40px;border:1px solid #FF6700;font-size:16px;float:left;margin-left:15%}
#searsub{width:15%;height:40px;margin-left:0;background-color: #FF6700;color:#FFFFFF;font-size: 20px;font-weight:bold;border: 0;float:left}
#searbytype{float:left;margin-left:15%}
#searbytype a{color:#F58316}
#searbytype a:hover{color:#FF692F}
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
    <div id="logoandsear">
    <div id="logo">
    <a href="index.jsp"><img src="images/xqblogo.jpg"></a>
    </div>
    <div id="sear">
    <s:form action="courseaction_findcoursebypage" namespace="/course" id="searchform">
    <s:hidden name="currentpage" id="crtpage"></s:hidden>
    <s:hidden name="coursetype"></s:hidden>
    <s:hidden name="pnumpaixu"></s:hidden>
    <s:hidden name="pricepaixu"></s:hidden>
    <s:textfield name="coursename" id="searinput"  placeholder="请输入关键字搜索"></s:textfield>
    <input type="button" id="searsub" value="搜索">
    </s:form><br/>
    <div id="searbytype">
    <p style="font-size:15px;color:#F8B959;" >
    <a href="${pageContext.request.contextPath }/course/courseaction_findcoursebypage?coursetype=声乐">声乐</a><font color="#999999">&nbsp;|&nbsp;</font>
    <a href="${pageContext.request.contextPath }/course/courseaction_findcoursebypage?coursetype=舞蹈">舞蹈</a><font color="#999999">&nbsp;|&nbsp;</font>
    <a href="${pageContext.request.contextPath }/course/courseaction_findcoursebypage?coursetype=书法">书法</a><font color="#999999">&nbsp;|&nbsp;</font>
    <a href="${pageContext.request.contextPath }/course/courseaction_findcoursebypage?coursetype=美术"> 美术</a><font color="#999999">&nbsp;|&nbsp;</font>
    <a href="${pageContext.request.contextPath }/course/courseaction_findcoursebypage?coursetype=跆拳道">跆拳道</a><font color="#999999">&nbsp;|&nbsp;</font>
    <a href="${pageContext.request.contextPath }/course/courseaction_findcoursebypage?coursetype=棋类">棋类</a><font color="#999999">&nbsp;|&nbsp;</font>
    <a href="${pageContext.request.contextPath }/course/courseaction_findcoursebypage?coursetype=文化课">文化课</a><font color="#999999">&nbsp;|&nbsp;</font>
    <a href="${pageContext.request.contextPath }/course/courseaction_findcoursebypage?coursetype=健身">健身</a><font color="#999999">&nbsp;|&nbsp;</font>
    <a href="${pageContext.request.contextPath }/course/courseaction_findcoursebypage">更多</a>
    </p>
    </div>
    </div>
    </div>
    </div>
    
  </body>
   <!-- 导入jquery核心类库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
//下拉菜单
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
//搜索
$("#searsub").click(function(){
$("#crtpage").val("");
$("[name='coursetype']").val("");
$("[name='pnumpaixu']").val("");
$("[name='pricepaixu']").val("");
$("#searchform").submit();
})
})
</script>
  </html>