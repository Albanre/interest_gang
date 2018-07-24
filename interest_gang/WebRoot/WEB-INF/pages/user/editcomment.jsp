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
    
    <title>编辑评论</title>
    
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
  #content{width:85%;border:0.6px solid #85D04D;}
  #content_1{height:30px;line-height:30px;text-align:left;font-size:18px;background-color: #85D04D;color:#FFFFFF}
  #content_2{}
  .cmitemdiv{height:230px;border:0.6px solid #85D04D;padding-top:30px}
  .dafendiv{height:30px;line-height:30px}
  .dafendiv li{float:left;color:#DDDDDD;font-size:20px;margin-left:13px;font-weight: bold;}
  .cm_textarea{width:100%;background-color: #EEF8FD;border:0.6px solid #DAF1FC;padding:5px}
  #fbpjbtndiv{text-align:right;margin:30px;width:85%}
  #fbpjbtn{width:80px;height:40px;color:#FFFFFF;background-color: #3498DB;border:0}
  </style>
  </head>
  
  <body>
  <div id="container">
  <jsp:include page="/orderhead.jsp"></jsp:include>
  <div id="content">
  <div id="content_1">
    评价课程
  </div>
  <div id="content_2">
  <s:form action="commentaction_savecomment" namespace="/comment">
  <s:hidden name="cm_orderid" value="%{orderid}"/>
  <%--循环开始 --%>
  <s:iterator value="orderitems">
  <s:hidden name="cm_courseid" value="%{course.courseid}"/>
  <div class="cmitemdiv">
  <div style="float:left;width:30%;text-align:left;padding-left:5%">
   
  <div><a href="${pageContext.request.contextPath }/course/courseaction_findcourseinfo?courseid=<s:property value='course.courseid'/>"><div><img src="${pageContext.request.contextPath }/images/<s:property value='course.img_url'/>" style="width:150px;height:150px"></div>
  <div style="margin-top:15px;text-align:left"><p><s:property value="course.coursename"/></p></div></a></div>
  
  </div>
  
  <div style="float:left;width:60%;text-align:left;">
  <div class="dafendiv"><div style="float:left;font-size:15px">请为该课程打分</div><ul><input type="hidden" name="cm_score" value=""><li onclick="jishu(1,this)">★</li><li onclick="jishu(2,this)">★</li>
  <li onclick="jishu(3,this)">★</li><li onclick="jishu(4,this)">★</li><li onclick="jishu(5,this)">★</li></ul><span style="margin-left:20px"></span>
  </div>
  
  <div class="cm_textarea">
  <textarea rows="10" cols="90" name="cm_content"  placeholder="请输入评价内容"></textarea>
  </div>
  </div>
  </div>
  </s:iterator>
  <%--循环结束 --%>
  </div>
  </div>
  <div id="fbpjbtndiv">
  <input type="submit" id="fbpjbtn" value="发表评价">
  </div>
  </s:form>
  <jsp:include page="/footer.jsp"></jsp:include>
  </div>
  </body>
</html>
<script type="text/javascript">
$(function(){
/*
//星星评分
var dianjinum=0;
//鼠标悬浮
$(".dafendiv li").hover(
function(){
$(this).prevAll("li").andSelf().css("color","red");
},
function(){
if(dianjinum==0){
$(this).prevAll("li").andSelf().css("color","pink");
}else{
$(".dafendiv li:lt(dianjinum)").css("color","black");
}
})
//鼠标点击
$(".dafendiv li").click(function(){
$(".dafendiv li").css("color","pink");
$(this).prevAll("li").andSelf().css("color","red");
dianjinum=$(this).index()+1;
})
*/
})

function jishu(num,obj){

$(obj).siblings("li").css("color","#DDDDDD");//全部重置
$(obj).parent().next().html("");
if(num<=2){
$(obj).prevAll("li").andSelf().css("color","#4B4B4B");
if(num==1){
$(obj).parent().next().html("<font color='#4B4B4B'>1分&nbsp;很差</font>")
}else{
$(obj).parent().next().html("<font color='#4B4B4B'>2分&nbsp;较差</font>")
}
}else if(num<=4){
$(obj).prevAll("li").andSelf().css("color","#FF6700");
if(num==3){
$(obj).parent().next().html("<font color='#FF6700'>3分&nbsp;一般</font>")
}else{
$(obj).parent().next().html("<font color='#FF6700'>4分&nbsp;较好</font>")
}
}else{
$(obj).prevAll("li").andSelf().css("color","#FF0036");
$(obj).parent().next().html("<font color='#FF0036'>5分&nbsp;非常好</font>")
}
$(obj).parent().children(":input").val(num);
}
</script>