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
    
    <title>添加课程</title>
    
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
  <div id="w" class="easyui-window" title="编辑课程" data-options="modal:true,iconCls:'icon-save'" style="width:500px;padding:10px;">


	
		<form id="ff" class="easyui-form" method="post" action="${pageContext.request.contextPath }/course/courseaction_updatecourse.action" enctype="multipart/form-data"  data-options="novalidate:true">
			<input type="hidden" name="courseid" value="<s:property value='courseid'/>" >
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="coursename" value="<s:property value='coursename'/>" style="width:100%;" data-options="label:'课程名称:',required:true">
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="p_number" value="<s:property value='p_number'/>" style="width:100%;" data-options="label:'开班人数:',required:true">
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-datebox" name="o_time" value="<s:date name="o_time" format='yyyy-MM-dd'/>" style="width:100%;" data-options="label:'开课时间:',required:true,formatter:myformatter,parser:myparser,validator:xianzhidate">
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="price" value="<s:property value='price'/>" style="width:100%;" data-options="label:'课程价格:',required:true">
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="introduction" value="<s:property value='introduction'/>" style="width:100%;height:80px" data-options="label:'课程简介:',required:true,multiline:true,validType:'length[20,100]'">
			</div>
			<div style="margin-bottom:20px">
				<select class="easyui-combobox" name="coursetype" label="课程类别:" style="width:100%;">
				  <option value="声乐">声乐</option>
                  <option value="舞蹈">舞蹈</option>
                  <option value="书法">书法</option>
                  <option value="美术">美术</option>
                  <option value="跆拳道">跆拳道</option>
                  <option value="棋类">棋类</option>
                  <option value="文化课">文化课</option>
                  <option value="语言">语言</option>
                  <option value="健身">健身</option>
				</select>
			</div>
		<div style="margin-bottom:20px">
			<input class="easyui-filebox" name="courseimg" label="上传图片:" style="width:100%;" data-options="">
		</div>
		</form>
		<div style="text-align:center;padding:5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">提交</a>&emsp;
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">重置</a>
		</div>
	</div>

  </body>
</html>
<script type="text/javascript">
        $(function(){
			
		});
		function submitForm(){
			$('#ff').form('submit',{
				onSubmit:function(){
					return $(this).form('enableValidation').form('validate');
				},
				 success : function(r){
				location.href="${pageContext.request.contextPath }/uiaction_merchant_mcourselist"
                }
			});
		}


		function clearForm(){
			$('#ff').form('clear');
		}
		
	
        function xianzhidate(date){
            var now = new Date();
			var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
			var d2 = new Date(now.getFullYear(), now.getMonth(), now.getDate()+10);
			return d1<=date;
        }
		function myformatter(date){
			var y = date.getFullYear();
			var m = date.getMonth()+1;
			var d = date.getDate();
			return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
		}
		function myparser(s){
			if (!s) return new Date();
			var ss = (s.split('-'));
			var y = parseInt(ss[0],10);
			var m = parseInt(ss[1],10);
			var d = parseInt(ss[2],10);
			if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
				return new Date(y,m-1,d);
			} else {
				return new Date();
			}
		}
		
	</script>
