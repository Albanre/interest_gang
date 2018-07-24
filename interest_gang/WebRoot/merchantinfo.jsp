<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商家信息</title>
    
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
  body{background-color: #F0F0F0;}
  #content{margin-top:30px;text-align:left;width:100%;}
  #sjjs{width:90%;color:#666666;background-color: #FFFFFF;padding-left:3%;padding-right:3%;border:1px solid #E5E5E5;margin-top:10px;margin-bottom: 30px}
  .mcinfo{height:auto;line-height:normal;padding-top:10px;padding-bottom: 10px;}
  .mcinfospan{font-weight: bold;}
  #courselist{border-top:1px solid #E5E5E5;margin-top:30px; }
  .courseli{width:20%;height:350px;float:left;margin-left:4%;margin-top:30px;background-color: #FFFFFF;}
  #fddiv{
	position:absolute;
	width:30%;
	left:30%;
	top:200px;
	height:300px
	background-color:pink;
	}
  </style>
  </head>
  
  <body>
  <div id="container">
  <jsp:include page="/head.jsp"></jsp:include>
  <div id="content">
  <p style="font-size:20px;font-weight: bold;padding-left:3%;color:#333333">商户简介</p>
  <div id="sjjs">
  <div class="mcinfo"><span class="mcinfospan">机构名称：</span>&emsp;<s:property value="o_name"/></div>
  <hr style="border:1px dashed #E5E5E5" size="1"/>
  <div class="mcinfo"><span class="mcinfospan">创立时间：</span>&emsp;<s:date name="createtime" format="yyyy-MM-dd"/></div>
  <hr style="border:1px dashed #E5E5E5" size="1"/>
  <div class="mcinfo" style="line-height:20px"><span class="mcinfospan">商户介绍：</span>&emsp;
  <s:property value="introduction"/>
  </div>
  <hr style="border:1px dashed #E5E5E5" size="1"/>
  <div class="mcinfo"><span class="mcinfospan">地址：</span>&emsp;&emsp;&emsp;<s:property value="address"/></div>
  <hr style="border:1px dashed #E5E5E5" size="1"/>
  <div class="mcinfo"><span class="mcinfospan">电话：</span>&emsp;&emsp;&emsp;<s:property value="telephone"/></div>
  </div>
  
  <p style="font-size:20px;font-weight: bold;padding-left:3%;color:#333333;">本店课程（<s:property value="courses.size"/>）</p>
  <div id="courselist">
  <ul>
  <s:iterator value="courses">
  <li class="courseli">
   <a href="${pageContext.request.contextPath }/course/courseaction_findcourseinfo?courseid=<s:property value='courseid'/>">
  		<div style="text-align:center"><img src="${pageContext.request.contextPath }/images/<s:property value='img_url'/>" style="width:95%;height:230px;"></div>
  		<div class ="divA">
		<div style="margin-top:10px;width:95%"><div style="float:left;font-size:20px;color:#FF6700;font-weight: bold;">¥<s:property value="price"/></div><div style="text-align:right;float:right;color:#95957D;font-size:15px">剩余容量&nbsp;<font color="#B57C5B"><s:property value="p_number"/></font></div><div class="clear"></div></div>
		<p style="margin-top:15px;font-size:14px;text-align:center"><s:property value="coursename"/></p>
	    <div style="color:#95957D;margin-top:6px;"><div style="float:left;"><s:property value="merchant.o_name"/></div><div style="float:right;"><s:property value="merchant.address"/></div></div>
		</div>
 	</a>	
  </li>
  </s:iterator>
  </ul>
  <div class="clear"></div>
  </div>
  </div>
  <jsp:include page="/footer.jsp"></jsp:include>
  </div>
  </body>
</html>
