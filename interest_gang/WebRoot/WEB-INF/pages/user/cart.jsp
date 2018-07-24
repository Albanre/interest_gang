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
    
    <title>My JSP 'carttest.jsp' starting page</title>
    
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
  #jsdiv{position:fixed; bottom:0px; left:5%;color:#3C3C3C;text-align:right;height:50px;width:90%;background-color:#E5E5E5;}
  #content{width:90%}
  #content_1 a:hover{color:#FF6700;}
  #jsbtn{width:20%;height:50px;font-size:18px;color:#FFFFFF;background-color:#FF6700;border:0;font-weight:  bold;}
  .jiannumbtn{width:25px;height:25px}
  .jianumbtn{width:25px;height:25px}
  </style>
  </head>
  
  <body>
  <div id="container">
  <jsp:include page="/head.jsp"></jsp:include>
  <div style="text-align:left;margin-top:30px;width:90%">您的位置:<a href="index.jsp">首页</a>>我的购物车</div>
  <s:if test="#session.cart.size!=0"><%--购物车不为空 --%>
  <div id="content">
  <div id="content_1">
  <div style="margin-top:30px;height:50px">
  <ul>
  <li style="float:left;width:30%;margin-right:0.5%"><p style="text-align: left"><input type="checkbox">全选&emsp;&emsp;&emsp;课程信息</p></li>
  <li style="float:left;width:10%;margin-right:0.5%"><p>课程类别</p></li>
  <li style="float:left;width:13%;margin-right:0.5%"><p>单价</p></li>
  <li style="float:left;width:16%;margin-right:0.5%"><p>数量</p></li>
  <li style="float:left;width:10%;margin-right:0.5%"><p>小计</p></li>
  <li style="float:left;width:18.5%"><p>操作</p></li>
  </ul>
  </div>
  </div>
  <div id="content_2">
  <s:set var="sum" value="0"/>
  <s:iterator value="#session.cart"><%--大循环开始 --%>
  <div style="text-align:left;height:45px;line-height:45px"><input type="checkbox">店铺：<s:property value="shopname"/></div>
  <div style="border: 1px solid #FF6700">
  <s:iterator value="cartmap"><%--小循环开始 --%>
  <div style="height:114px;margin-top:0">
  <ul style="padding-top:7px;">
  <li style="float:left;width:30%;margin-right:0.5%">
   <a href="${pageContext.request.contextPath }/course/courseaction_findcourseinfo?courseid=<s:property value='key.courseid'/>">
  <div style="float:left;width:30%"><img src="${pageContext.request.contextPath }/images/<s:property value='key.img_url'/>" style="width:95%;height:100px"></div>
  <div style="float:left;margin-left:3%;height:100px;padding-top:30px"><s:property value='key.merchant.o_name'/><br/><s:property value='key.coursename'/></div>
  </a>
  </li>
  <li style="float:left;width:10%;margin-right:0.5%;height:100px;line-height:100px"><p><s:property value='key.coursetype'/></p></li>
  <li style="float:left;width:13%;margin-right:0.5%;height:100px;line-height:100px"><p><s:property value='key.price'/></p></li>
  <li style="float:left;width:16%;margin-right:0.5%;height:100px;line-height:100px">
  <input type="button" class="jiannumbtn" value="-" onclick="changenum('jian',this,<s:property value='key.p_number'/>)">
  <input type="text" class="buynum" value="<s:property value='value'/>" style="width:40px;height:25px;text-align:center;margin-left:10px;margin-right:10px;">
  <input type="button" class="jianumbtn" value="+" onclick="changenum('jia',this,<s:property value='key.p_number'/>)">
  </li>
  <li style="float:left;width:10%;margin-right:0.5%;height:100px;line-height:100px"><span style="color:#FF6700"><s:property value='key.price*value'/></span></li>
  <li style="float:left;width:18.5%;height:100px;line-height:100px">
  <a href="javascript:;" onclick="delcourse(this)">删除</a>&emsp;&emsp;
  <a href="javascript:;" onclick="sccourse(this)"> 移入收藏夹</a>
  </li>
  <s:hidden name="key.courseid" class="hdcid"></s:hidden>
  </ul>
  
  </div>
  <div class="clear"></div>
  <s:set var="sum" value="#sum+key.price*value"/>
  </s:iterator>
  </div>
  <div class="clear"></div>
  
  </s:iterator><%--大循环结束 --%>
  </div>
  <div id="jsdiv">合计：&emsp;<span style="font-size:20px;font-weight:bold;color:#FF6700">￥<s:property value='#sum'/></span>&emsp;&emsp;<input id="jsbtn" type="button" value="结算"></div>
  </div>
  </s:if>
  <s:else><%--购物车为空 --%>
  <div style="width:90%;height:330px;line-height:280px;font-size:18px">
  您的购物车是空的，您可以&emsp;<a href="${pageContext.request.contextPath }/course/courseaction_findcoursebypage">去逛逛</a>
  </div>
  </s:else>
  </div>
  </body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
//去结算
$("#jsbtn").click(function(){
location.href="${pageContext.request.contextPath }/course/courseaction_toconfirm_order?buymethod=gwcgm";
})
//
})
//修改数量
function changenum(btnname,obj,kucunnum){
var cid=$(obj).parent().parent().children(":hidden").first().val()
var opnum;
if(btnname=="jian"){
opnum=$(obj).next("input").val()-1;
if(opnum<1){
if(confirm("是否删除该商品?")){
opnum=0;
}else{
opnum=1;
}
}
}else{
opnum=parseInt($(obj).prev("input").val())+1;
if(opnum>kucunnum){
alert("购买数量不能超过库存");
opnum=kucunnum;
}
}
location.href="${pageContext.request.contextPath }/course/courseaction_docart?courseid="+cid+"&opnum="+opnum;
}
//删除商品
function delcourse(obj){
if(confirm("是否删除该商品？")){
var cid=$(obj).parent().parent().children(":hidden").first().val()
location.href="${pageContext.request.contextPath }/course/courseaction_docart?courseid="+cid+"&opnum=0"
}
}
//移入收藏夹
//收藏课程
function sccourse(obj){
var cid=$(obj).parent().parent().children(":hidden").first().val()
var params={"courseid":cid}
var url="${pageContext.request.contextPath}/course/courseaction_addcollect";
$.get(url,params,function(data){
alert("成功收藏该课程");
},"json");
}

</script>