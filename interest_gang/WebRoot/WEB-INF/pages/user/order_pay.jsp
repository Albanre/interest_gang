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
    
    <title>支付订单</title>
    
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
  #content{width:90%}
  #ddhandprice{background-color: #EFF0F1;height:50px;line-height:50px}
  #xzfkfs{text-align:left;font-size:18px;margin-top:30px}
  #zfdd{text-align:right;margin-top:30px}
  #orderpaysbt{width:20%;height:40px;font-size:18px;color:#FFFFFF;background-color:#FF6700;border:0}
  </style>
  </head>
  
  <body>
  <div id="container">
  <jsp:include page="/orderhead.jsp"></jsp:include>
  <div id="content">
  <input type="hidden" id="hid" value="<s:property value='orderid'/>"/>
  <p style="height:30px;line-height:30px;font-size:18px;text-align:left">欢迎来到兴趣帮结算中心</p>
  <div id="ddhandprice">
  <div style="text-align:left;margin-top:30px;font-size:15px"><span>订单号：<s:property value="orderid"/></span><div style="float:right;font-size:20px;color:#FF6700"><s:property value="totalprice"/></div></div>
  </div>
  <div id="xzfkfs"><p>请选择付款方式：<input type="radio" name="payfs" checked="checked">支付宝&emsp;&emsp;&emsp;<input type="radio" name="payfs">微信支付&emsp;&emsp;&emsp;<input type="radio" name="payfs">网银支付</p></div>
  <div id="zfdd"><input type="button" value="支付订单" id="orderpaysbt" ></div>
  </div>
  </div>
  </body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
$("#orderpaysbt").click(function(){
location.href="${pageContext.request.contextPath}/order/orderaction_payorder?orderid="+$("#hid").val();
})
})
</script>