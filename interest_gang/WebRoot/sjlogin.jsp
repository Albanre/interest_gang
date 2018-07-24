<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'sjlogin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
       <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"></script>
  </head>
  
  <body>
  <div style="padding-left:30%;padding-top:100px">
  <div class="easyui-panel" title="商家登录" style="width:50%;padding:30px 60px;">
       <div id="messd" style="height:30px;line-height:30px;color:red"></div>
		<form id="ff" class="easyui-form" action="${pageContext.request.contextPath }/merchant/merchantaction_login" method="post" data-options="novalidate:true">
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="username" style="width:100%;height:30px" data-options="label:'用户名:',required:true">
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-passwordbox" name="password" style="width:100%;height:30px" data-options="label:'密码:',required:true">
			</div>
			<div style="margin-bottom:20px;padding-left:23%">
				<input type="checkbox" name="" ${!empty cookie.merchant?"checked":"" }>记住我&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a href="">忘记密码</a>
			</div>
        </form>
		<div style="padding:5px 0;text-align:right;margin-bottom:20px;height:30px">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:76%">登录</a>
		</div>
		<div style="margin-bottom:20px;padding-left:25%">
			还没有账号?<a href="sjregis.jsp">去注册</a>
		</div>
  </div>
  </div>
  </body>
</html>
<script>
        
        
		function submitForm(){
			$('#ff').form('submit',{
				onSubmit:function(){
					return $(this).form('enableValidation').form('validate');
				},
				 success : function(r){
				 if(r!="loginsuccess"){
				 $("#messd").text(r);
				 }else{
				 location.href="${pageContext.request.contextPath }/uiaction_merchant_home"
				 }
                }
			});
		}
</script>