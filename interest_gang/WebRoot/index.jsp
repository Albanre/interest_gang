<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib  uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>兴趣帮-首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/reset.css"/>
    <style>

  
 
	<!--   -------------------------------------------------------    -->
	
	
	 * { 
 padding: 0; 
 margin: 0 auto; 
 } 
 ul { 
 list-style: outside none none; 
 } 
 .slider, .slider-panel img, .slider-extra { 
 width: 96%; 
 height: 500px; 
 } 
 .slider { 
 text-align: center; 
 margin: 0 auto; 
 margin-top:10px;
 position: relative; 
 } 
 .slider-panel, .slider-nav, .slider-pre, .slider-next { 
 position: absolute; 
 z-index: 8; 
 } 
 .slider-panel { 
 position: absolute; 
 } 
 .slider-panel img { 
 border: none; 
 } 
 .slider-extra { 
 position: relative; 
 } 
 .slider-nav { 
 margin-left: -51px; 
 position: absolute; 
 left: 50%; 
 bottom: 4px; 
 } 
 .slider-nav li { 
 background: #3e3e3e; 
 border-radius: 50%; 
 color: #fff; 
 cursor: pointer; 
 margin: 0 2px; 
 overflow: hidden; 
 text-align: center; 
 display: inline-block; 
 height: 18px; 
 line-height: 18px; 
 width: 18px; 
 } 
 .slider-nav .slider-item-selected { 
 background: blue; 
 } 
 .slider-page a{ 
 background: rgba(0, 0, 0, 0.2); 
 filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#33000000,endColorstr=#33000000); 
 color: #fff; 
 text-align: center; 
 display: block; 
 font-family: "simsun"; 
 font-size: 22px; 
 width: 28px; 
 height: 62px; 
 line-height: 62px; 
 margin-top: -31px; 
 position: absolute; 
 top: 50%; 
 } 
 .slider-page a:HOVER { 
 background: rgba(0, 0, 0, 0.4); 
 filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#66000000,endColorstr=#66000000); 
 } 
 .slider-next { 
 left: 100%; 
 margin-left: -28px; 
 } 
  </style>
  </head>
  
  <body>
 <div id="container">
 <jsp:include page="/head.jsp"></jsp:include>
 <div class="slider"> 
 <ul class="slider-main"> 
  <li class="slider-panel"> 
  <a href="#" target="_blank"><img alt="兴趣帮" title="兴趣帮" src="images/jigou7.png"></a> 
  </li> 
  <li class="slider-panel"> 
  <a href="#" target="_blank"><img alt="兴趣帮" title="兴趣帮" src="images/jigou4.png"></a> 
  </li> 
  <li class="slider-panel"> 
  <a href="#" target="_blank"><img alt="兴趣帮" title="兴趣帮" src="images/jigou5.png"></a> 
  </li> 
  <li class="slider-panel"> 
  <a href="#" target="_blank"><img alt="兴趣帮" title="兴趣帮" src="images/jigou6.png"></a> 
  </li> 
 </ul> 
 <div class="slider-extra"> 
  <ul class="slider-nav"> 
  <li class="slider-item">1</li> 
  <li class="slider-item">2</li> 
  <li class="slider-item">3</li> 
  <li class="slider-item">4</li> 
  </ul> 
  <div class="slider-page"> 
  <a class="slider-pre" href="javascript:;;"><</a> 
  <a class="slider-next" href="javascript:;;">></a> 
  </div> 
 </div> 
 </div><%--轮播结束 --%>
 <s:if test="#session.loginuser.tjcourses.size!=0"><%--有推荐课程 --%>
 <jsp:include page="/tjcourselist.jsp"></jsp:include>
 </s:if>
 <jsp:include page="/footer.jsp"></jsp:include>
 </div> 
  </body>
</html>
<script type="text/javascript" src="js/easyui/jquery.min.js"></script>
<script type="text/javascript"> 
   /*--------------搜索框有值时发送ajax请求---------------------------*/
   $("#keyword").keyup(function(){//给文本框绑定按键弹起事件
   var inputval=$(this).val();
   if(inputval==""){
   $("#icbykeyword").hide();
   return;
   } 
   $.ajax(
   {url:"searchicajaxservlet?name="+$("#keyword").val()+"&time="+new Date().getTime(),
   type:"GET",
   success:function(result){
   if(result!=""){
   var names=result.split(",");
   var childspan="";
   for(var i=0;i<names.length;i++){
   childspan+="<span id='bzd' onclick='writetext(this)' onmouseover='changeBackground_over(this)' onmouseout='changeBackground_out(this)'>"+names[i]+"</span>&emsp;&emsp;";
   }
   $("#icbykeyword").show();
   $("#icbykeyword").html(childspan);
   }
   }
   })
   })
   //鼠标悬浮时，改变背景色
	function changeBackground_over(span){
		$(span).css({"backgroundColor":"#FF0036","color":"#FFFFFF"});
	}
	//鼠标离开时，恢复背景色
	function changeBackground_out(span){
		$(span).css({"backgroundColor":"#FFFFFF","color":"#000000"});
	}
	//填充文本到搜索框
	function writetext(span){
	var namevalue=$(span).html();//获得span中的值
	$("#keyword").val(namevalue);//把span中的文本添加到搜索框中
	$("#icbykeyword").hide()//把icbykeyword的div隐藏
	}
	/*-------------------------------------------------*/
   //搜索
   var keyword=$("#keyword");
   $("#seac").click(function(){
   location.href="iclistbypageservlet?keyword="+keyword.val();
   })
 $(document).ready(function() { 
 var length, 
  currentIndex = 0, 
  interval, 
  hasStarted = false, //是否已经开始轮播 
  t = 3000; //轮播时间间隔 
 length = $('.slider-panel').length; 
 //将除了第一张图片隐藏 
 $('.slider-panel:not(:first)').hide(); 
 //将第一个slider-item设为激活状态 
 $('.slider-item:first').addClass('slider-item-selected'); 
 //隐藏向前、向后翻按钮 
 $('.slider-page').hide(); 
 //鼠标上悬时显示向前、向后翻按钮,停止滑动，鼠标离开时隐藏向前、向后翻按钮，开始滑动 
 $('.slider-panel, .slider-pre, .slider-next').hover(function() { 
  stop(); 
  $('.slider-page').show(); 
 }, function() { 
  $('.slider-page').hide(); 
  start(); 
 }); 
 $('.slider-item').hover(function(e) { 
  stop(); 
  var preIndex = $(".slider-item").filter(".slider-item-selected").index(); 
  currentIndex = $(this).index(); 
  play(preIndex, currentIndex); 
 }, function() { 
  start(); 
 }); 
 $('.slider-pre').unbind('click'); 
 $('.slider-pre').bind('click', function() { 
  pre(); 
 }); 
 $('.slider-next').unbind('click'); 
 $('.slider-next').bind('click', function() { 
  next(); 
 }); 
 /** 
  * 向前翻页 
  */
 function pre() { 
  var preIndex = currentIndex; 
  currentIndex = (--currentIndex + length) % length; 
  play(preIndex, currentIndex); 
 } 
 /** 
  * 向后翻页 
  */
 function next() { 
  var preIndex = currentIndex; 
  currentIndex = ++currentIndex % length; 
  play(preIndex, currentIndex); 
 } 
 /** 
  * 从preIndex页翻到currentIndex页 
  * preIndex 整数，翻页的起始页 
  * currentIndex 整数，翻到的那页 
  */
 function play(preIndex, currentIndex) { 
  $('.slider-panel').eq(preIndex).fadeOut(500) 
  .parent().children().eq(currentIndex).fadeIn(1000); 
  $('.slider-item').removeClass('slider-item-selected'); 
  $('.slider-item').eq(currentIndex).addClass('slider-item-selected'); 
 } 
 /** 
  * 开始轮播 
  */
 function start() { 
  if(!hasStarted) { 
  hasStarted = true; 
  interval = setInterval(next, t); 
  } 
 } 
 /** 
  * 停止轮播 
  */
 function stop() { 
  clearInterval(interval); 
  hasStarted = false; 
 } 
 //开始轮播 
 start(); 
 
 }); 
 
</script> 
