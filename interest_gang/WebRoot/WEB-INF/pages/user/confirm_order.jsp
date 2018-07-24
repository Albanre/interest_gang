<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>确认订单</title>
    
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
    #content{margin-top:30px;width:90%}
    #content li{float:left}
    #qrddxx{font-size:16px;font-weight: bold;text-align:left}
    #ddhj{height:50px;line-height:50px;text-align:right}
    #tjdd{text-align:right}
    #ordersbt{width:20%;height:40px;font-size:18px;color:#FFFFFF;background-color:#FF6700;border:0 }
    </style>
  </head>
  
  <body>
  <div id="container">
  <jsp:include page="/orderhead.jsp"></jsp:include>
  <div id="content">
  <div id="qrddxx">确认订单信息</div>
  <div style="margin-top:30px;height:50px">
  <ul>
  <li style="float:left;width:35%;margin-right:0.5%"><p>课程信息</p><hr color="#B2D1FF" size="4px"/></li>
  <li style="float:left;width:15%;margin-right:0.5%"><p>课程类别</p><hr color="#B2D1FF" size="4px"/></li>
  <li style="float:left;width:16%;margin-right:0.5%"><p>单价</p><hr color="#B2D1FF" size="4px"/></li>
  <li style="float:left;width:16%;margin-right:0.5%"><p>数量</p><hr color="#B2D1FF" size="4px"/></li>
  <li style="float:left;width:16%"><p>小计</p><hr color="#B2D1FF" size="4px"/></li>
  </ul>
  </div>
  <s:if test="buymethod=='ljgm'"><%--立即购买 --%>
  <div style="height:130px">
  <ul>
  <li style="float:left;width:35%;margin-right:0.5%">
  <div style="float:left;width:30%"><img src="${pageContext.request.contextPath }/images/<s:property value='img_url'/>" style="width:95%;height:100px"></div>
  <div style="float:left;margin-left:3%;height:100px;line-height:100px"><s:property value='coursename'/></div>
  </li>
  <li style="float:left;width:15%;margin-right:0.5%;height:100px;line-height:100px"><p><s:property value='coursetype'/></p></li>
  <li style="float:left;width:15%;margin-right:0.5%;height:100px;line-height:100px"><p><s:property value='price'/></li>
  <li style="float:left;width:15%;margin-right:0.5%;height:100px;line-height:100px"><p><s:property value='buynum'/></li>
  <li style="float:left;width:15%;height:100px;line-height:100px"><p><s:property value='buynum*price'/><p></li>
  </ul>
  </div>
  <hr style="border:1px dashed #E5E5E5" size="1"/>
  <div id="ddhj"><p>订单合计：&emsp;<span style="color:#FF6700;font-size:20px">￥<s:property value='buynum*price'/></span></p></div>
  <s:form action="orderaction_createorder" namespace="/order">
  <s:hidden name="courseid"/>
  <s:hidden name="jsmethod" value="ljgm"/>
  <s:hidden name="buynum"/>
  <s:hidden name="totalprice" value="%{buynum*price}"/>
  </s:form>
  </s:if>
  <s:else><%--购物车结算 --%>
  <s:set var="sum" value="0"/>
  <s:iterator value="#session.cart">
  <s:iterator value="cartmap">
  <div style="height:130px">
  <ul>
  <li style="float:left;width:35%;margin-right:0.5%">
  <div style="float:left;width:30%"><img src="${pageContext.request.contextPath }/images/<s:property value='key.img_url'/>" style="width:95%;height:100px"></div>
  <div style="float:left;margin-left:3%;height:100px;line-height:100px"><s:property value='key.coursename'/></div>
  </li>
  <li style="float:left;width:15%;margin-right:0.5%;height:100px;line-height:100px"><p><s:property value='key.coursetype'/></p></li>
  <li style="float:left;width:15%;margin-right:0.5%;height:100px;line-height:100px"><p><s:property value='key.price'/></li>
  <li style="float:left;width:15%;margin-right:0.5%;height:100px;line-height:100px"><p><s:property value='value'/></li>
  <li style="float:left;width:15%;height:100px;line-height:100px"><p><s:property value='key.price*value'/><p></li>
  </ul>
  </div>
  <s:set var="sum" value="#sum+key.price*value"/>
  <hr style="border:1px dashed #E5E5E5" size="1"/>
  </s:iterator>
  </s:iterator>
  <s:form action="orderaction_createorder" namespace="/order">
  <s:hidden name="jsmethod" value="gwc"/>
  <s:hidden name="totalprice" value="%{#sum}"/>
  </s:form>
  <div id="ddhj"><p>订单合计：&emsp;<span style="color:#FF6700;font-size:20px">￥<s:property value='#sum'/></span></p></div>
  </s:else>
  <div id="tjdd"><input type="button" value="提交订单" id="ordersbt" ></div>
  </div>
  </div>
  </body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
$("#ordersbt").click(function(){
$("form")[0].submit();
})
})
</script>