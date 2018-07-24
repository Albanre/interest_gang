<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>课程列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <style type="text/css">
  body{background-color: #F5F5F5}
  #content{font-size:15px}
  .courseli{background-color: #FFFFFF;width:20%;height:350px;float:left;margin-left:4%;margin-top:30px}
  #cl_content1{ height:30px;line-height:30px;font-size:15px;padding-left:3%;color:#757575}
  #cl_content2{height:50px;line-height:50px;background-color: #FFFFFF;text-align:left;padding-left:3%;color:#424242;width:100%}
  #cl_content3{margin-top:30px}
  #pagetool{margin-top:50px}
  </style>
  </head>
  
  <body>
  <div id="container">
  <jsp:include page="/head.jsp"></jsp:include>
  <s:if test="coursedata.size!=0">
  <div id="content">
  <div id="cl_content1">
  <div style="float:left"><a href="index.jsp">首页</a>&emsp;&gt;&emsp;全部结果&emsp;&gt;&emsp;</div>
  <div style="float:right;margin-right:3%">共<s:property value="totalrecord"/>个相关结果</div>
  </div>
  <div id="cl_content2">
  <div style="float:left;width:10%" id="tjspan">推荐&emsp;&emsp;|&emsp;&emsp;</div>
  
  <s:if test="pnumpaixu=='asc'">
  <div style="float:left;width:8%;color:#FF6700"><span id="syrlspan">剩余容量</span><span>↑</span></div>|&emsp;&emsp;
  </s:if>
  <s:elseif test="pnumpaixu=='desc'">
  <div style="float:left;width:8%;color:#FF6700"><span id="syrlspan">剩余容量</span><span>↓</span></div>|&emsp;&emsp;
  </s:elseif>
  <s:else>
  <div style="float:left;width:8%"><span id="syrlspan">剩余容量</span><span></span></div>|&emsp;&emsp;
  </s:else>
  
  <s:if test="pricepaixu=='asc'">
  <span  style="color:#FF6700"><span id="jgspan">价格</span><span>↑</span></span>
  </s:if>
  <s:elseif test="pricepaixu=='desc'">
  <span  style="color:#FF6700"><span id="jgspan">价格</span><span>↓</span></span>
 </s:elseif>
  <s:else>
  <span><span id="jgspan">价格</span><span></span></span>
  </s:else>
  </div>
  <div id="cl_content3">
  <ul>
  <s:iterator value="coursedata"><%--循环开始 --%>
  <li class="courseli">
   <a href="${pageContext.request.contextPath }/course/courseaction_findcourseinfo?courseid=<s:property value='courseid'/>">
  		<img src="${pageContext.request.contextPath }/images/<s:property value='img_url'/>" width="95%" height="230px">
  		<div class ="divA">
		<div style="margin-top:10px;width:95%"><div style="float:left;font-size:20px;color:#FF6700;font-weight: bold;">¥<s:property value="price"/></div><div style="text-align:right;float:right;color:#95957D;font-size:15px">剩余容量&nbsp;<font color="#B57C5B"><s:property value="p_number"/></font></div><div class="clear"></div></div>
		<p style="margin-top:15px;font-size:14px"><s:property value="coursename"/></p>
	    <div style="color:#95957D;margin-top:6px;"><div style="float:left;"><s:property value="merchant.o_name"/></div><div style="float:right;"><s:property value="merchant.city"/></div></div>
		</div>
 	</a>	
  </li>
  </s:iterator><%--循环结束 --%>
  </ul>
  </div>
  </div>
  <div class="clear"></div>
  <div id="pagetool">
  <ul >
<li  style="font-size:18px;">
<s:if test="currentpage>1">
<a href="javascript:void(0)" onclick="showpage(1)">&lt;&lt;首页</a>
&emsp;<a href="javascript:void(0)" onclick="showpage(<s:property value='currentpage-1'/>)">&lt;上一页</a>&emsp;
</s:if>
第<s:property value='currentpage'/>页/共<s:property value='totalpage'/>页
<s:if test="currentpage<totalpage">
&emsp;<a href="javascript:void(0)" onclick="showpage(<s:property value='currentpage+1'/>)">下一页&gt;</a>&emsp;
<a href="javascript:void(0)" onclick="showpage(<s:property value='totalpage'/>)">尾页&gt;&gt;</a>
</s:if>
</li>
</ul>
</div>
</s:if>
<s:else><%--没有查到结果 --%>
<div id="cl_content1">
  <div style="float:left"><a href="index.jsp">首页</a>&emsp;&gt;&emsp;全部结果&emsp;&gt;&emsp;</div>
  <div style="float:right;margin-right:3%">共<s:property value="totalrecord"/>个相关结果</div>
  </div>
<div style="height:350px;line-height:300px;font-size:18px;background-color: #FFFFFF">没有找到相关记录</div>
</s:else>
</div>
<jsp:include page="/footer.jsp"></jsp:include>
  </body>

<script type="text/javascript">
$(function(){
//按剩余容量排序
$("#syrlspan").click(function(){
//重置其他span样式
$("#jgspan").parent().css("color","black");
$("#jgspan").next().text("");
//清空其他排序方式
$("[name='pricepaixu']").val("");
var shunxu=$(this).next().text();//获得排序方式
if(shunxu==""){
$(this).next().text("↓");
$(this).parent().css("color","#FF6700");
$("[name='pnumpaixu']").val("desc");
$("#searchform").submit();
}
if(shunxu=="↓"){
$(this).next().text("↑");
$(this).parent().css("color","#FF6700");
$("[name='pnumpaixu']").val("asc");
$("#searchform").submit();
}
if(shunxu=="↑"){
$(this).next().text("↓");
$(this).parent().css("color","#FF6700");
$("[name='pnumpaixu']").val("desc");
$("#searchform").submit();
}
})
//按价格排序
$("#jgspan").click(function(){
$("[name='pnumpaixu']").val("");
$("#syrlspan").parent().css("color","black");
$("#syrlspan").next().text("");
var shunxu=$(this).next().text();
if(shunxu==""){
$(this).next().text("↓");
$(this).parent().css("color","#FF6700");
$("[name='pricepaixu']").val("desc");
$("#searchform").submit();
}
if(shunxu=="↓"){
$(this).next().text("↑");
$(this).parent().css("color","#FF6700");
$("[name='pricepaixu']").val("asc");
$("#searchform").submit();
}
if(shunxu=="↑"){
$(this).next().text("↓");
$(this).parent().css("color","#FF6700");
$("[name='pricepaixu']").val("desc");
$("#searchform").submit();
}
})

})
//翻页
function showpage(pagenum){
$("#crtpage").val(pagenum);
$("#searchform").submit();
}
</script>
</html>