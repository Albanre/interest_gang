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
    
    <title>商家注册</title>
    
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
  
  <body style="background-color: #EBEBEB">
  <div style="padding-left:20%">
	<div class="easyui-panel" title="商家注册" style="width:100%;max-width:65%;padding:15px 60px;">
	    <div id="messd" style="height:30px;line-height:30px;color:red"></div>
		<form id="ff" class="easyui-form" action="${pageContext.request.contextPath }/merchant/merchantaction_register" method="post" data-options="novalidate:true">
			<div style="margin-bottom:10px">
				<input class="easyui-textbox" name="username" style="width:100%" data-options="label:'用户名:',required:true">
			</div>
			<div style="margin-bottom:10px">
				<input class="easyui-passwordbox" id="pwd" name="password" style="width:100%" data-options="label:'密码:',required:true,validType:'length[6,20]'">
			</div>
			<div style="margin-bottom:10px">
				<input class="easyui-passwordbox" name="repassword" style="width:100%" data-options="label:'确认密码:',required:true" validType="equals['#pwd']" >
			</div>
			<div style="margin-bottom:10px">
				<input class="easyui-textbox" name="telephone" style="width:100%;" data-options="label:'手机号:',required:true,validType:'mobile'">
			</div>
			<div style="margin-bottom:10px">
				<input class="easyui-textbox" name="email" style="width:100%" data-options="label:'邮箱:',required:true,validType:'email'">
			</div>
			<div style="margin-bottom:10px">
				<input class="easyui-textbox" name="o_name" style="width:100%" data-options="label:'机构名称:',required:true">
			</div>
			<div style="margin-bottom:10px">
				<input class="easyui-textbox" name="introduction" style="width:100%;height:80px" data-options="label:'机构介绍:',required:true,multiline:true">
			</div>
			<div style="margin-bottom:10px">
				<input class="easyui-datebox" name="createtime" style="width:100%" data-options="label:'成立时间:',required:true,formatter:myformatter,parser:myparser">
			</div>
			<div style="margin-bottom:10px"><%--省市区 --%>
				<input class="easyui-combobox"  id="province" name="eprovince" style="width:40%" data-options="label:'机构地址:',required:true">
				<input class="easyui-combobox" id="citys" name="ecity" style="width:28%" data-options="required:true">
				<input class="easyui-combobox" id="county" name="ecounty" style="width:28%" data-options="required:true">
			    <input type="hidden" id="hprovince" name="province">
			    <input type="hidden" id="hcity" name="city">
			    <input type="hidden" id="hcounty" name="county">
			</div>
			<div style="margin-bottom:10px">
				<input class="easyui-textbox" name="detailaddress" style="width:100%" data-options="label:'详细地址:',required:true">
			</div>
			<div style="margin-bottom:10px">
				<input class="easyui-textbox" name="code" style="width:50%" data-options="label:'验证码:',required:true">
				<img src="${pageContext.request.contextPath }/codeaction" id="codeimg" style="width:130px;height:30px">
			</div>
            <div style="text-align:center;padding:5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()" style="width:80px">注册</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()" style="width:80px">重置</a>
		</div>     
  </form>
  </div>
  
  </div>
  </body>
</html>
<script>
        
        
		function submitForm(){
			$('#ff').form('submit',{
				onSubmit:function(){
				     var countytext=$('#county').combobox('getText')
				    $("#hcounty").val(countytext);
				     var citytext=$('#citys').combobox('getText')
				    $("#hcity").val(citytext);
				    var provincetext=$('#province').combobox('getText')
				    $("#hprovince").val(provincetext);
					return $(this).form('enableValidation').form('validate');
				},
				 success : function(r){
				if(r!="regissuccess"){
				$("#messd").text(r);
                }else{
                location.href="sjregissuccess.jsp";
                }
                }
			});
		}
		function clearForm(){
			$('#ff').form('clear');
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
		//拓展校验规则
		$.extend($.fn.validatebox.defaults.rules, {
		//确认密码验证    
        equals: {    
        validator: function(value,param){    
            return value == $(param[0]).val();    
        },    
        message: '确认密码与密码不一致'   
        },
        // 手机号码验证
        mobile : {
        validator : function(value) {
        var reg = /^(((13[0-9]{1})|(14[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        return value.length == 11 && reg.test(value);},
        message : "请正确填写您的手机号码."
        }   
        });  
		$(function(){
        //更换验证码
        $("#codeimg").click(function(){
        $("#codeimg").attr("src","${pageContext.request.contextPath }/codeaction?time="+new Date())
        })
        
        })
        //省市区三联动
         	showPro();
	function showPro(){
		$.ajax({
			url : 'json/pca-code.json',
			 dataType: 'json',  
		     success: function (jsonstr) {  
		    	jsonstr.unshift({  
		            'code': '',  
		            'name': '请选择省份..'  
		        });
				$('#province').combobox({
					data: jsonstr,  
					valueField:'code',//code
					textField:'name',
					editable:false,
					onLoadSuccess:function (data){
						var data = $('#province').combobox('getData');					
						//console.log(JSON.stringify(data))
						if(data.length>0){
							$('#province').combobox('select',data[0].code);//code
						}
					},
					onChange : function(newValue, oldValue) {			
						if (newValue) {
							showCity(newValue)
							$("#citys").combobox("clear")
							$("#county").combobox("clear")					
						}
					}
				});
		     }
		});
	}

	function showCity(newValue){				
		$.ajax({
			 url :'json/pca-code.json',
			 dataType: 'json',  
		     success: function (json) {
		     	
		     	var cityJson = json;
		     	//console.log(JSON.stringify(cityJson))
		     	$.each(cityJson, function(i, val) {
		        	if(val.code == newValue){ //判断省份的code 是否与省份的val 相同//1 code
	        			//console.log(JSON.stringify(val))
	        			val.childs.unshift({  
				            'code': '',  
				            'name': '请选择城市..'  
				        });
	        			$('#citys').combobox({
							data: val.childs,  
							valueField:'code',//code
							textField:'name',
							editable:false,
							onLoadSuccess:function (data){
								var data = $('#citys').combobox('getData');					
								//console.log(JSON.stringify(data))
								if(data.length>0){
									$('#citys').combobox('select',data[0].code);//code
								}
							},
							onChange : function(newValue, oldValue) {
								//console.log(newValue, oldValue)
								if (newValue) {				
									showCounty(String(newValue))
								}
							}							
						});
	        			
	        		}
		        })		     	
		     }
		})			
				
	}


	function showCounty(newValue){
				
		$.ajax({
			 url : 'json/pca-code.json',
			 dataType: 'json',  
		     success: function (json) {
		     	var cityJson = json;
		     	$.each(cityJson, function(i, val) {

		     		if(val.code == newValue.substr(0, 2)){
		     			var pro_childs =  val.childs;
		     			$.each(pro_childs, function(j, proVal) {// 然后 省份循环 寻找与省份对应的城市

			     			if(proVal.code == newValue){ //判断省份的code 是否与省份的val 相同//
			     				proVal.childs.unshift({  
						            'code': '',  
						            'name': '请选择区/县..'  
						        });
			        			$('#county').combobox({
									data: proVal.childs,  
									valueField:'code',//code
									textField:'name',
									editable:false,
									onLoadSuccess:function (data){
										var data = $('#county').combobox('getData');					
										//console.log(JSON.stringify(data))
										if(data.length>0){
											$('#county').combobox('select',data[0].code);//code
										}
									}
								});
			        			
			        		}
			     		})
		     		}
		     		
		        	
		        })		     	
		     }
		})			
				
	}
	</script>

