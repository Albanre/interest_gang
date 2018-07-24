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
    
    <title>My JSP 'mcourselist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	#content a{color:#7F7F7F}
	#content a:hover{color:#FF6700;}
	</style>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"></script>
  </head>
  
  <body>
  <div id="container" style="">
  <div id="head"><div style="height:40px"><a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="doaadd()">添加课程</a></div></div>
  <div id="content" style="text-align: center;width:90%">
  <table border="2" bordercolor="#95B8E7" cellpadding="5" style="border-collapse:collapse;width:100%;color:#7F7F7F">
  <tr align="center"><td>课程名</td><td>剩余容量</td><td>开课时间</td><td>价格</td><td>课程类型</td><td>图片</td><td>操作</td></tr>
  <s:iterator value="#session.loginmerchant.courses"><%--循环开始 --%>
  <tr align="center"><td><s:property value="coursename"/></td><td><s:property value="p_number"/></td>
  <td><s:date name="o_time" format="yyyy-MM-dd"/></td><td><s:property value="price"/></td><td><s:property value="coursetype"/></td>
  <td><img src="${pageContext.request.contextPath }/images/<s:property value='img_url'/>" style="width:100px;height:100px;"></td>
  <td>
  <a href="${pageContext.request.contextPath }/course/courseaction_edit?courseid=<s:property value="courseid"/>">编辑</a><br/><br/>
  <a href="${pageContext.request.contextPath }/course/courseaction_findcomment?courseid=<s:property value="courseid"/>">查看评价</a>
  </td>
  </tr>
  </s:iterator>
  </table>
  </div>
  </div>
  </body>
</html>
<script type="text/javascript">
function doaadd(){
	location.href="${pageContext.request.contextPath }/uiaction_merchant_addcourse"
	}
							
</script>
