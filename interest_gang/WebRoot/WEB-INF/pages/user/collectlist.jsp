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
    
    <title>我的收藏</title>
    
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
  #container{}
  #weizhi{height:30px;width:90%;text-align:left;line-height:30px;background-color: #F5F5F5}
  #content{width:90%;padding-bottom: 100px}
  #pldelbtn{width:60px;height:30px;}
  #content_1{margin-top:30px;height:50px;}
  #content_2{}
  #content_2 li{float:left;margin-left:2%;width:14%;margin-top:30px}
  </style>
  </head>
  
  <body>
  <div id="container">
  <jsp:include page="/head.jsp"></jsp:include>
  <div id="weizhi">
  <p>您的位置：<a href="index.jsp">首页</a>&gt;收藏夹</p>
  </div>
  <div id="content">
  <s:if test="courses.size!=0"><%--收藏夹不为空 --%>
  <div id="content_1">
  <div style="float:left;font-weight: bold;font-size:18px;color:#999999">全部收藏&gt;</div>
  <div style="float:right"><input type="checkbox" id="ckall" onclick="clickall()"><span style="font-size:15px">全选</span>&emsp;&emsp;<input type="button" id="pldelbtn" value="批量删除" onclick="batchdel()"></div>
  <div class="clear"></div>
  <hr/>
  </div>
  <div id="content_2">
  <ul>
  <%--循环开始 --%>
  <s:iterator value="courses">
  <li>
  <div><input type="checkbox" name="ids" value="<s:property value="courseid"/>"></div>
  <a href="${pageContext.request.contextPath }/course/courseaction_findcourseinfo?courseid=<s:property value='courseid'/>">
  <div>
  <div style="margin-top:10px"><img src="${pageContext.request.contextPath }/images/<s:property value="img_url"/>" style="width:95%;height:150px;"></div>
  <div><s:property value="coursename"/></div>
  </div>
  </a>
  <div style="font-size:15px;color:#FF6700;font-weight: bold;">￥<s:property value="price"/></div>
  
  </li>
  </s:iterator>
  <%--循环结束 --%>
  </ul>
  <div class="clear"></div>
  </div>
  </s:if>
  
  <s:else><%--收藏夹为空 --%>
  <div style="height:240px;line-height:200px">您的收藏夹是空的，您可以看看<a href="${pageContext.request.contextPath }/user/useraction_findhistoryrecord">我的足迹</a></div>
  </s:else>
  </div>
  <jsp:include page="/footer.jsp"></jsp:include>
  </div>
  </body>
</html>
<script type="text/javascript">
$(function(){

})

//全选
function clickall(){
var flag=$("#ckall").attr("checked");
if(flag=='checked'){
$("[name='ids']").attr("checked",flag);
}else{
$("[name='ids']").attr("checked",false);
}
}
//批量删除
function batchdel(){
var str="";
$("[name='ids']").each(function(){
if($(this)[0].checked){
str+="courseids="+$(this).val()+"&";
}
})
if(str!=""){
if(confirm("是否确认删除？")){
str=str.substring(0,str.length-1)//iid=1&iid=2&iid=3
location.href="${pageContext.request.contextPath}/course/courseaction_delcollect?"+str;
}
}
}

</script>