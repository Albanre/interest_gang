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
    
    <title>账户管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <!-- 导入jquery核心类库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script> 
	<script type="text/javascript">
$(function(){
var currenttime=new Date();
var currenthour=currenttime.getHours();
var str="";
if(5<currenthour&&currenthour<=9){
str="早上好";
}else if(9<currenthour&&currenthour<=11){
str="上午好"
}else if(11<currenthour&&currenthour<=13){
str="中午好"
}else if(13<currenthour&&currenthour<=18){
str="下午好"
}else if(18<currenthour&&currenthour<=23){
str="晚上好"
}else{
str="深夜时分，注意休息"
}
$("#timep").text(str);
})
//修改个人信息
function editaccountinfo(){
$("#content2r_right").hide();
$("#editpassword").hide();
$("#editpersoninfo").show();
}
//显示修改密码窗口
function editPassword(){
$("#editpersoninfo").hide();
$("#content2r_right").hide();
$("#editpassword").show();
}
//验证修改信息表单
function checkform1(){

}
//验证修改密码表单
function checkform2(){
if($("[name='renewpassword']").val()!=$("[name='renewpassword']")){
$("[name='renewpassword']").append("你输入的重复密码与新密码不匹配");
return false;
}
}
//修改密码
function modifypwd(){
var oldp=$("[name='password']").val();
var newp=$("[name='newpassword']").val();
var renewp=$("[name='renewpassword']").val();
if(oldp==""||oldp==null){
$(".errorspan").text("");
$($(".errorspan")[0]).text("请输入原密码")
}else if(newp==""||newp==null){
$(".errorspan").text("");
$($(".errorspan")[1]).text("请输入新密码")
}else if(newp!=renewp){
$(".errorspan").text("");
$($(".errorspan")[2]).text("重复密码与新密码不一致")
}else{
var params={"newpassword":newp,"password":oldp}
var url="${pageContext.request.contextPath}/user/useraction_modifypwd"
$.post(url,params,function(data){
if(data=="false"){
$($(".errorspan")[0]).text("你输入的原密码不正确")
}else{
alert("修改密码成功，请重新登录");
location.href="${pageContext.request.contextPath}/login.jsp"

}
});
}
}
</script> 
    <style type="text/css">
    #container{background-color: #F5F5F5;}
    #content{width:90%;}
    #content_1{text-align:left;height:30px;line-height:30px}
    #content_2{}
    #content2_left{float:left;width:23%;background-color: #FFFFFF;text-align:left;padding-left:50px;padding-top:30px;font-size:18px;color:#757575;line-height:50px;padding-bottom: 50px}
    #content2_right{float:right;width:70%;margin-left:1%;height:400px;background-color: #FFFFFF}
    #content2r_left{float:left;width:30%;padding-top:150px;text-align:left;padding-left:5%}
    #content2r_right{float:left;width:60%;text-align:left;line-height:30px}
    #editpersoninfo{display:none;float:left;width:60%;text-align:left;line-height:40px;font-size:18px}
    #editpassword{display:none;float:left;width:60%;text-align:left;line-height:40px;font-size:18px}
    #saveinfobtn{height:30px;width:100px;border:0;background-color: #FF6700;color:#FFFFFF;margin-top:15px}
    #resetpwdbtn{height:30px;width:100px;border:0;background-color: #FF6700;color:#FFFFFF;margin-top:20px}
    </style>
  </head>
  
  <body>
  <div id="container">
 <jsp:include page="/head.jsp"></jsp:include>
  <div id="content">
  <div id="content_1">
  <p>您的位置：<a href="index.jsp">首页</a>&gt;个人中心</p>
  </div>
  <div id="content_2">
  <div id="content2_left">
  <div id="myorderdiv">
  <p style="font-size:19px;font-weight: bold;color:#333333">订单中心</p>
  <p><a href="${pageContext.request.contextPath }/user/useraction_findorderbyuser">我的订单</a></p>
  <p><a href="${pageContext.request.contextPath }/user/useraction_findnocmorderbyuser">评价晒单</a></p>
  </div>
  <div id="personcenterdiv">
  <p style="font-size:19px;font-weight: bold;color:#333333">个人中心</p>
  <p><a href="${pageContext.request.contextPath }/uiaction_user_account_manage">个人信息</a></p>
  <p><a href="${pageContext.request.contextPath }/user/useraction_findcollectbyuser">我喜欢的</a></p>
  <p><a href="javascript:;" onclick="editPassword();" >修改密码</a></p>
  </div>
  </div>
  <div id="content2_right">
  <div id="content2r_left">
  <p style="font-size:30px"><s:property value="#session.loginuser.username"/></p>
  <p id="timep" style="margin-top:5px;color:#03BB52;font-size:15px"></p><%--显示时间 --%>
  <p style="margin-top:5px"><a href="javascript:;" onclick="editaccountinfo();" >修改个人信息&gt;</a></p>
  </div>
  <div id="content2r_right">
  <p style="font-size:18px;font-weight: bold;margin-top:30px">基础资料</p>
  <hr/>
  <p>用户名：&emsp;<s:property value="#session.loginuser.username"/></p>
  <hr/>
  <p>性别：&emsp;&emsp;<s:property value="#session.loginuser.gender"/></p>
  <hr/>
  <p>手机号：&emsp;<s:property value="#session.loginuser.telephone"/></p>
  <hr/>
  <p>邮箱：&emsp;&emsp;<s:property value="#session.loginuser.email"/></p>
  <hr/>
  <p>地址：&emsp;&emsp;<s:property value="#session.loginuser.address"/></p>
  <hr/>
  <p>注册时间：<s:date name="#session.loginuser.register_time" format="yyyy-MM-dd hh:mm:ss"/></p>
  <hr/>
  </div>
  <%--修改个人信息 --%>
  <div id="editpersoninfo">
  <p style="font-size:18px;font-weight: bold;margin-top:30px">编辑信息</p>
  <hr/>
  <s:form action="useraction_modifyinfo" namespace="/user" id="form1" onsubmit="return checkform1()">
  <p>用户名：&emsp;<s:property value="#session.loginuser.username"/></p>
  <p>性别：&emsp;&emsp;<input type="radio" name="gender" value="男" ${session.loginuser.gender=="男"?"checked='checked'":"" }>男&emsp;<input type="radio" name="gender" value="女" ${session.loginuser.gender=="女"?"checked='checked'":"" }>女</p>
  <p>手机号：&emsp;<s:textfield name="telephone" value="%{#session.loginuser.telephone}"/></p>
  <p>邮箱：&emsp;&emsp;<s:textfield name="email" value="%{#session.loginuser.email}"/></p>
  <p>地址：&emsp;&emsp;<s:textfield name="address" value="%{#session.loginuser.address}"/></p>
  <p><input type="submit" value="保存" id="saveinfobtn"></p>
  </s:form>
  </div>
  <%--修改个人信息结束 --%>
  <%--修改密码 --%>
  <div id="editpassword">
  <p style="font-size:18px;font-weight: bold;margin-top:30px">修改密码</p>
  <hr/>
  <s:form action="useraction_modifypwd" namespace="/user" onsubmit="return checkform2()">
  <p style="margin-top:30px">原密码：&emsp;&emsp;<input type="password" name="password"><span class="errorspan" style='color:red;font-size:15px'></span></p>
  <p>新密码：&emsp;&emsp;<input type="password" name="newpassword"><span class="errorspan" style='color:red;font-size:15px'></span></p>
  <p>重复新密码：<input type="password" name="renewpassword"><span class="errorspan" style='color:red;font-size:15px'></span></p>
  <p><input type="button" value="提交" id="resetpwdbtn" onclick="modifypwd()"/></p>
  </s:form>
  </div>
  <%--修改密码结束 --%>
  </div>
  <div class="clear"></div>
  </div>
  </div>
  
  <jsp:include page="/footer.jsp"></jsp:include>
  </div>
  </body>
</html>
