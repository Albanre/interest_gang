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
    
    <title>我的订单</title>
    
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
  #content{width:90%;padding-bottom:150px}
  #content_1{height:50px;line-height:50px;margin-top:30px;background-color: #F5F5F5;border:0.6px solid #E8E8E8}
  #content li{float:left}
  #content_2{margin-top:30px;}
  .content2_1{border:0.6px solid #AED8FF;width:100%;margin-top:30px}
  .content21_1{height:50px;line-height:50px;background-color: #EAF8FF;border:0.6px solid #AED8FF;text-align:left;padding-left:30px}
 .content211_left{float:left;width:55%;}
 .content211_right{float:left;width:45%;padding-top:20px;}
 .ljzfbtn{height:30px;width:60px;background-color: #FF4200;color:#FFFFFF;border:0}
  </style>
     <!-- 导入jquery核心类库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
  <script type="text/javascript">
  $(function(){
  //去支付
  $(".ljzfbtn").click(function(){
  var oid=$(this).prev(":hidden").val();
  var tprice=$(this).next(":hidden").val();
  location.href="${pageContext.request.contextPath }/order/orderaction_topayorder?orderid="+oid+"&totalprice="+tprice
  })
  
  })
  
</script>
  </head>
    <body>
  <div id="container">
  <jsp:include page="/orderhead.jsp"></jsp:include>
  <div id="content">
  <hr color="#C8BAAA" size="0.5px"/>
  <div style="text-align:left;">您的位置:首页>我的订单></div>
  <s:if test="orders.size!=0"><%--有订单 --%>
  <div id="content_1">
  <ul>
  <li style="width:35%">课程信息</li>
  <li style="width:10%">单价</li>
  <li style="width:10%">数量</li>
  <li style="width:20%">实付款</li>
  <li style="width:15%">交易状态</li>
  <li style="width:10%">操作</li>
  </ul>
  </div>
  <div class="clear"></div>
  <div id="content_2">
  <%--订单循环开始 --%>
  <s:iterator value="orders">
  <div class="content2_1">
  
  <div class="content21_1">
  <s:date name="ordertime" format="yyyy-MM-dd"/>&emsp;订单号<s:property value="orderid"/>
  </div>
  <div class="content21_2"><%--订单内容 --%>
  <div class="content211_left">
  <%--订单项开始 --%>
  <s:iterator value="orderitems">
  <div style="height:100px;border:0.6px solid #AED8FF;line-height:90px">
  <ul>
  <li style="width:63%">
  <a href="${pageContext.request.contextPath }/course/courseaction_findcourseinfo?courseid=<s:property value='course.courseid'/>">
  <div style="float:left;margin-left:20px;margin-top:10px"><img src="${pageContext.request.contextPath }/images/<s:property value='course.img_url'/>" style="width:80px;height:80px"></div>
  <div style="float:left;margin-left:15px"><s:property value="course.merchant.o_name"/><s:property value="course.coursename"/></div> 
  </a>
  </li>
  <li style="width:18%">￥<s:property value="course.price"/></li>
  <li style="width:18%"><s:property value="buy_num"/></li>
  </ul>
  </div>
  
  </s:iterator>
  <%--订单项结束 --%>
  </div>
  <div class="content211_right">
  <ul>
  <li style="width:42%;font-weight: bold;">￥<s:property value="totalprice"/></li>
  <li style="width:33%;">
  <s:if test="paystate==0"><%--未支付 --%>
     等待付款
  </s:if>
  <s:if test="paystate==1"><%--已支付 --%>
     交易成功
  </s:if>
  <s:if test="paystate==-1"><%--失效 --%>
     订单关闭
  </s:if>
  <p style="margin-top:10px"><a href="${pageContext.request.contextPath }/order/orderaction_findorderinfo?orderid=<s:property value='orderid'/>">订单详情</a></p>
  </li>
  <li style="width:23%;">
  <s:if test="paystate==0"><%--未支付 --%>
  <s:hidden name="orderid"/><%--存放去支付的订单号 --%>
  <input type="button" class="ljzfbtn" value="立即付款">
  <s:hidden name="totalprice"/><%--存放去支付的订单总价 --%>
  <p style="margin-top:10px"><a href="${pageContext.request.contextPath }/order/orderaction_cacelorder?orderid=<s:property value='orderid'/>">取消订单</a></p>
  </s:if>
  <s:if test="paystate==1"><%--已支付 --%>
  <s:if test="cmstate==0"><%--未评价 --%>
  <a href="${pageContext.request.contextPath }/order/orderaction_tocomment?orderid=<s:property value='orderid'/>">去评价</a>
  </s:if>
  <s:if test="cmstate==1"><%--已评价 --%>
    已评价
  </s:if>
  </s:if>
  <s:if test="paystate==-1"><%--失效 --%>
  <a href="${pageContext.request.contextPath }/order/orderaction_delorder?orderid=<s:property value='orderid'/>">删除订单</a>
  </s:if>
  </li>
  </ul>
  </div>
  <div class="clear"></div>
  </div><%--订单内容 结束--%>
  
  </div>
  </s:iterator>
  <%--订单循环结束 --%>
  </div>
  </s:if>
  
  <s:else><%--无订单 --%>
  <div style="height:198px;line-height:190px">您的订单列表为空</div>
  </s:else>
  </div>
  <jsp:include page="/footer.jsp"></jsp:include>
  </div>
  </body>
</html>
