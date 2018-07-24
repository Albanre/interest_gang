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
    
    <title>订单详情</title>
    
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
  #content_1{height:150px;border:1px solid #DDDDDD;margin-top:30px}
  #content1_left{float:left;width:30%;height:150px}
  #content1_left1{height:30px;line-height:30px;border:1px solid #DDDDDD;background-color: #F3F3F3}
  #content1_left2{height:88px;padding-top:30px;padding-left:30px;text-align:left;background-color: content1_left2;border:1px solid #DDDDDD;}
  #content1_right{float:left;width:70%;margin-top:50px;text-align:left;font-size:18px;font-weight: bold;color:#3D4245}
  #content_2{margin-top:30px;border:0.5px solid #DDDDDD;}
  #content2_1{border:1px solid #DDDDDD;height:30px}
  #content_2 li{float:left;height:30px;line-height:30px}
  #content2_2{}
  #content22_1{height:100px;border:0.5px solid #DDDDDD;}
  #content22_1 li{height:100px;line-height:100px}
  #content_3{margin-top:30px;background-color: #F3F3F3;height:80px;line-height:35px;text-align:right}
  </style>
  </head>
  
  <body>
  <div id="container">
  <jsp:include page="/orderhead.jsp"></jsp:include>
  <div id="content">
  <hr color="#C8BAAA" size="0.5px"/>
  <div style="text-align:left;">您的位置:<a href="index.jsp">首页</a>><a href="${pageContext.request.contextPath }/user/useraction_findorderbyuser">我的订单</a>>订单详情</div>
  <div id="content_1">
  <div id="content1_left">
  <div id="content1_left1"><p>订单信息</p></div>
  <div id="content1_left2">
  <p>订单编号:<s:property value="orderid"/></p>
  <p>生成时间:<s:date name="ordertime" format="yyyy-MM-dd hh:mm:ss"/></p>
  <p>联系电话:<s:property value="receiverphone"/></p>
  </div>
  </div>
  <div id="content1_right">
  <s:if test="paystate==0"><%--未付款 --%>
  <div style="margin-top:-5px;float:left;margin-left:35%"><img src="images/orderclose.png"></div>&emsp;订单状态:商品已拍下，等待付款
      <p style="margin-left:42%;margin-top:10px"><s:property value='stimestr'/>内未付款该订单自动关闭</p>
      <p style="margin-left:42%">您可以&emsp;<a href="${pageContext.request.contextPath }/order/orderaction_topayorder?orderid=<s:property value='orderid'/>&totalprice=<s:property value='totalprice'/>">去付款</a>&emsp;
      <a href="${pageContext.request.contextPath }/order/orderaction_cacelorder?orderid=<s:property value='orderid'/>">取消订单</a>
      </p>
  </s:if>
  <s:if test="paystate==1"><%--已付款 --%>
  <s:if test="cmstate==0"><%--未评价 --%>
  <div style="margin-top:-5px;float:left;margin-left:35%"><img src="images/jysuccess.png"></div>&emsp;订单状态:等待评价
  <div class="clear"></div>
  <p style="margin-left:42%">您可以&emsp;<a href="${pageContext.request.contextPath }/order/orderaction_tocomment?orderid=<s:property value='orderid'/>">去评价</a></p>
  </s:if>
  <s:else><%--已评价 --%>
  <div style="margin-top:-5px;float:left;margin-left:35%"><img src="images/jysuccess.png"></div>&emsp;订单状态:已评价
  <div class="clear"></div>
  </s:else>
  </s:if>
  <s:if test="paystate==-1"><%--已失效 --%>
  <div style="margin-top:-5px;float:left;margin-left:35%"><img src="images/orderclose.png"></div>&emsp;订单状态:超时关闭
  <div class="clear"></div>
  </s:if>
  </div>
  </div>
  <div id="content_2">
  <div id="content2_1">
  <ul>
  <li style="width:40%">商品</li>
  <li style="width:15%">单价</li>
  <li style="width:15%">数量</li>
  <li style="width:30%">小计</li>
  </ul>
  </div>
  <div id="content2_2">
  <%--循环开始 --%>
  <s:iterator value="orderitems">
  <div id="content22_1">
  <ul>
  <li style="width:40%">
  <a href="${pageContext.request.contextPath }/course/courseaction_findcourseinfo?courseid=<s:property value='course.courseid'/>">
  <div style="float:left;padding-left:20px;padding-top:20px"><img src="${pageContext.request.contextPath }/images/<s:property value='course.img_url'/>" style="width:60px;height:60px"></div>
  <div style="float:left;margin-left:30px;text-align:left"><s:property value="course.merchant.o_name"/><s:property value="course.coursename"/></div>
  </a>
  </li>
  <li style="width:15%"><s:property value="course.price"/></li>
  <li style="width:15%"><s:property value="buy_num"/></li>
  <li style="width:30%"><s:property value="course.price*buy_num"/></li>
  </ul>
  </div>
  </s:iterator>
  <%--循环结束 --%>
  </div>
  </div>
  <div id="content_3">
  <p style="font-size: 16px">订单总价:&emsp;&emsp;&emsp;<span style="font-weight:bold;">￥<s:property value="totalprice"/></span></p>
  <s:if test="paystate==1"><%--已付款 --%>
  <p style="font-size: 16px">实付款:&emsp;&emsp;&emsp;<span style="font-weight:bold;font-size:18px;color: #FF6700">￥<s:property value="totalprice"/></span></p>
  </s:if>
  <s:if test="paystate==0"><%--未付款 --%>
  <p style="font-size: 16px">需付款:&emsp;&emsp;&emsp;<span style="font-weight:bold;font-size:18px;color: #FF6700">￥<s:property value="totalprice"/></span></p>
  </s:if>
  <s:if test="paystate==-1"><%--失效订单 --%>
  <p style="font-size: 16px">该订单已失效，请重新购买</p>
  </s:if>
  </div>
  </div>
  <jsp:include page="/footer.jsp"></jsp:include>
  </div>
  </body>
</html>
