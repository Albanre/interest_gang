<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商家首页</title>
  <style type="text/css">
  a {cursor:pointer;text-decoration: none;color:#666666} 
  body{background-color: #F0F0F0;}
  #content{margin-top:30px;text-align:left;width:100%;}
  li{list-style: none;}
  #sjjs{width:90%;color:#666666;background-color: #FFFFFF;padding-left:3%;padding-right:3%;border:1px solid #E5E5E5;margin-top:10px;margin-bottom: 30px}
  .mcinfo{height:auto;line-height:normal;padding-top:10px;padding-bottom: 10px;}
  .mcinfospan{font-weight: bold;}
  #courselist{border-top:1px solid #E5E5E5;margin-top:30px; }
  .courseli{width:20%;height:350px;float:left;margin-left:4%;margin-top:30px;background-color: #FFFFFF;}
  #fddiv{
	position:absolute;
	width:30%;
	left:30%;
	top:200px;
	height:300px
	background-color:pink;
	}
  </style>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/outOfBounds.js"></script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;text-align:center;font-size:20px">
	<div style="float:left;margin-left:50px;line-height:60px">商家后台</div>
	<div style="float:right;margin-right:50px;margin-top:18px"><a href="javascript:;" class="easyui-menubutton" data-options="menu:'#mm1'"><s:property value="#session.loginmerchant.username"/></a></div>
	<div id="mm1" style="width:30px;">
		<div onclick="logout()">注销</div>
	</div>
	</div>
	<div data-options="region:'west',split:true,title:'系统菜单'" style="width:150px;">
	<div class="easyui-accordion" data-options="fit:true">
			<!-- 每个子div是其中的一个面板 -->
			<div title="店铺管理" style="text-align:center;padding-top:10px">
				<div style="height:40px"><a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="doAdd('add')">添加课程</a></div>
				<div style="height:40px"><a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="doAdd('update')">修改信息</a></div>
				<a href="javascript:;" class="easyui-linkbutton" data-options="iconCls:'icon-more'" onclick="doAdd('cslist')">课程管理</a>
				<script type="text/javascript">
						function doAdd(str){
							//动态添加一个选项卡面板
							if(str=='add'){
							$("#tt").tabs("add",{
								title:'添加课程',
								content:'<iframe frameborder="0" width="100%" height="100%" src="${pageContext.request.contextPath }/uiaction_merchant_addcourse"></iframe>',
								closable:true,
								iconCls:'icon-add'
							});
							}
							//课程列表
							if(str=='cslist'){
							$("#tt").tabs("add",{
								title:'课程列表',
								content:'<iframe frameborder="0" width="100%" height="100%" src="${pageContext.request.contextPath }/uiaction_merchant_mcourselist"></iframe>',
								closable:true,
								iconCls:'icon-blank'
							});
							}
							//修改信息
							if(str=='update'){
							$("#tt").tabs("add",{
								title:'修改信息',
								content:'<iframe frameborder="0" width="100%" height="100%" src="${pageContext.request.contextPath }/uiaction_merchant_modifyshopinfo"></iframe>',
								closable:true,
								iconCls:'icon-edit'
							});
							}
							
						}
						
						
						function logout(){
						location.href="${pageContext.request.contextPath }/merchant/merchantaction_logout"
						}
				</script>
			</div>
			<div title="订单管理">订单管理</div>
		</div>
	</div>
	<div data-options="region:'south',border:false" style="height:30px;background:#A9FACD;padding:10px;text-align:center">Copyright &copy; 2018&nbsp;&nbsp;兴趣帮</div>
	<div data-options="region:'center'">
	<!-- 选项卡面板效果 -->
		<div id="tt" class="easyui-tabs" data-options="fit:true">
			<!-- 每个子div是其中的一个面板 -->
			<div data-options="" title="店铺信息">
			  <div id="content">
  <p style="font-size:20px;font-weight: bold;padding-left:3%;color:#333333">商户简介</p>
  <div id="sjjs">
  <div class="mcinfo"><span class="mcinfospan">机构名称：</span>&emsp;<s:property value="#session.loginmerchant.o_name"/></div>
  <hr style="border:1px dashed #E5E5E5" size="1"/>
  <div class="mcinfo"><span class="mcinfospan">创立时间：</span>&emsp;<s:date name="#session.loginmerchant.createtime" format="yyyy-MM-dd"/></div>
  <hr style="border:1px dashed #E5E5E5" size="1"/>
  <div class="mcinfo" style="line-height:20px"><span class="mcinfospan">商户介绍：</span>&emsp;
  <s:property value="#session.loginmerchant.introduction"/>
  </div>
  <hr style="border:1px dashed #E5E5E5" size="1"/>
  <div class="mcinfo"><span class="mcinfospan">地址：</span>&emsp;&emsp;&emsp;<s:property value="#session.loginmerchant.address"/></div>
  <hr style="border:1px dashed #E5E5E5" size="1"/>
  <div class="mcinfo"><span class="mcinfospan">电话：</span>&emsp;&emsp;&emsp;<s:property value="#session.loginmerchant.telephone"/></div>
  </div>
  <p style="font-size:20px;font-weight: bold;padding-left:3%;color:#333333;">本店课程（<s:property value="#session.loginmerchant.courses.size"/>）</p>
  <div id="courselist">
  <ul>
  <s:iterator value="#session.loginmerchant.courses">
  <li class="courseli">
   <a href="${pageContext.request.contextPath }/course/courseaction_findcourseinfo?courseid=<s:property value='courseid'/>">
  		<div style="text-align:center"><img src="${pageContext.request.contextPath }/images/<s:property value='img_url'/>" style="width:95%;height:230px;"></div>
  		<div class ="divA">
		<div style="margin-top:10px;width:95%"><div style="float:left;font-size:16px;color:#FF6700;font-weight: bold;">¥<s:property value="price"/></div><div style="text-align:right;float:right;color:#95957D;font-size:13px">剩余容量&nbsp;<font color="#B57C5B"><s:property value="p_number"/></font></div><div class="clear"></div></div>
		<div style="clear: both;"></div>
		<p style="margin-top:15px;font-size:14px;text-align:center"><s:property value="coursename"/></p>
		</div>
 	</a>	
  </li>
  </s:iterator>
  </ul>
  <div class="clear"></div>
  </div>
  </div>
			</div>
		</div>
	
	</div>
	
</body>

</html>