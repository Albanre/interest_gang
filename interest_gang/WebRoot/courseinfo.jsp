<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>课程详情</title>
    
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
#courseinfo{margin-top:50px}
#cileft{float:left;width:40%;padding-left:3%}
#courseimg{text-align:left}
#ciright{float:left;width:50%;margin-left:5%;text-align:left}
#collecttool{margin-top:30px;text-align:left}
#sjtool{width:50%;height:150px;background-color: #E5E4E4;border:1px solid #CCCCCC;margin-top:50px;float:left}
#price{background-color: #E5E4E4;height:50px;line-height:50px;font-size:15px;margin-top:20px}
#sprice{color:#FF0036;font-size:20px;font-weight: bold;}
#looksjbtn{background-color:#F77100;border:0;width:30%;height:30px;color:#FFFFFF}
.courseprop{height:35px;line-height:35px;font-size:15px}
.propspan{color:#A5A5A5}
.numbtn{width:25px;height:25px}
#ljgm{background-color:#FFFFFF;width:30%;height:40px;border:2px solid #F36705;color:#F36705;font-size:20px;font-weight: bold}
#jrgwc{margin-left:20px;background-color:#F36705;width:30%;height:40px;border:0;color:#FFFFFF;font-size:20px;font-weight: bold}
#gmbtn{margin-top:30px;}
#cmdiv{margin-top:50px;}
#cmmenudiv{height:50px;line-height:50px;color:#A5A5A5;font-size:15px;border:1px solid #E5E5E5;padding-left:20px}
#cintroductiondiv{font-size:15px}
#ccommentdiv{display: none;}
</style>
  </head>
  
  <body>
  <div id="container">
  <jsp:include page="/head.jsp"></jsp:include>
  <div id="courseinfo">
  <div id="cileft">
  <s:hidden name="courseid" id="hcourseid"/>
  <div id="courseimg"><img src="${pageContext.request.contextPath }/images/<s:property value='img_url'/>" style="width:90%;height:400px"></div>
  <div id="collecttool">分享&emsp;&emsp;<span id="scgkc">☆收藏该课程</span></div>
  <div id="sjtool">
  <div style="height:50px;line-height:50px;background-color: #333333;color:#FFFFFF"><s:property value='merchant.o_name'/></div>
  <div style="margin-top:50px">
  <button type="button" id="looksjbtn" onclick="looksj(<s:property value='merchant.merchantid'/>)">进去逛逛</button>
  <button type="button" style="margin-left:5%;border:1px solid #CCCCCC;width:30%;height:30px;">收藏</button></div>
  </div>
  </div>
  <div id="ciright">
  <p style="font-size:23px;font-weight: bold;"><s:property value='coursename'/></p>
  <div id="price"><span class="propspan">价格</span>&emsp;&emsp;&emsp;&emsp;&emsp;<span id="sprice">￥<s:property value='price'/></span></div>
  <p class="courseprop"><span class="propspan">开课时间</span>&emsp;&emsp;&emsp;<s:date name='o_time' format="yyyy-MM-dd"/></p>
  <p class="courseprop"><span class="propspan">课程类别</span>&emsp;&emsp;&emsp;<s:property value='coursetype'/></p>
  <p class="courseprop"><span class="propspan">所属机构</span>&emsp;&emsp;&emsp;<s:property value='merchant.o_name'/></p>
  <p class="courseprop"><span class="propspan">机构地址</span>&emsp;&emsp;&emsp;<s:property value='merchant.address'/></p>
  <p class="courseprop"><span class="propspan">商家电话</span>&emsp;&emsp;&emsp;<s:property value='merchant.telephone'/></p>
  <p class="courseprop"><span class="propspan">库存量</span>&emsp;&emsp;&emsp;&emsp;<s:property value='p_number'/></p>
  <p class="courseprop"><span class="propspan">数量&emsp;&emsp;&emsp;&emsp;&emsp;</span>
  <input type="button" class="numbtn" id="jiannum" value="-"><input type="text" id="buynum" value="1" style="width:40px;height:25px;text-align:center;margin-left:10px;margin-right:10px;"><input type="button" class="numbtn" id="jianum" value="+" onclick="addnum(<s:property value='p_number'/>)">
  </p>
  <div id="gmbtn">
  <input type="button" id="ljgm" value="立即购买">
  <input type="button" id="jrgwc" value="加入购物车">
  </div>
  <div id="cmdiv">
  <div id="cmmenudiv">
  <span id="xqjs" style="color:#F36705">详情介绍</span>
  <span>&emsp;&emsp;|&emsp;&emsp;</span>
  <span id="ljpj">累计评价(<s:property value='comments.size'/>)</span>
  </div>
  
  <div style="margin-top:15px">
  
  <div id="cintroductiondiv">
  <s:property value="introduction"/>
  </div>
  <div id="ccommentdiv">
  <s:if test="comments.size!=0">
  <div style="height:30px;line-height:30px;font-size:18px;background-color:#E5E4E4;margin-bottom: 20px ">
  综合评分：<span style="color:#FF6600;font-weight:blod"><s:property value="avgscore"/></span>
  </div>
  <s:iterator value="comments">
  <div>
  <div style="margin-bottom: 15px"><s:property value="cm_content"/></div>
  <div style="float:left">匿名用户：<s:property value="user.username"/></div>
  <div style="float:left;margin-left:30%">评分：<s:property value="score"/></div>
  <div style="float:right"><s:date name="cm_time" format="yyyy-MM-dd hh:mm:ss"/></div>
  <div class="clear"></div>
  <hr color="#C8C8C8"/>
  </div>
  </s:iterator>
  </s:if>
  <s:else>
  <p>暂无评价</p>
  </s:else>
  </div>
  </div>
  </div>
  </div>
  </div>
  <div class="clear"></div>
  <jsp:include page="/footer.jsp"></jsp:include>
  </div>
  </body>

<script type="text/javascript">
$(function(){
//详情和评价按钮点击事件
$("#xqjs").click(function(){
$("#ljpj").css('color','#A5A5A5');
$("#xqjs").css('color','#F36705');
$("#cintroductiondiv").css('display','block');
$("#ccommentdiv").css('display','none');
})
$("#ljpj").click(function(){
$("#xqjs").css('color','#A5A5A5');
$("#ljpj").css('color','#F36705');
$("#cintroductiondiv").css('display','none');
$("#ccommentdiv").css('display','block');
})
//收藏课程
$("#scgkc").click(function(){
var params={"courseid":$("#hcourseid").val()}
var url="${pageContext.request.contextPath}/course/courseaction_addcollect"
$.get(url,params,function(data){
$("#scgkc").html("<font color='#F36705'>★收藏该课程</font>");
alert("收藏成功");
},"json");
})
//立即购买
$("#ljgm").click(function(){
location.href="${pageContext.request.contextPath}/course/courseaction_toconfirm_order?buymethod=ljgm&courseid="+$("#hcourseid").val()+"&buynum="+$("#buynum").val();
})
//加入购物车
$("#jrgwc").click(function(){
location.href="${pageContext.request.contextPath}/course/courseaction_addcart?courseid="+$("#hcourseid").val()+"&buynum="+$("#buynum").val();
})
//数量减
$("#jiannum").click(function(){
if($(this).next("input").val()=='1'){
$(this).next("input").val('1');
}else{
var numm=$(this).next("input").val()-1;
$(this).next("input").val(numm);
}
})

})

//数量加
function addnum(kucunnum){
var numm=parseInt($("#buynum").val());
if(numm==kucunnum){
alert("购买数量不能超过库存量");
}else{
numm+=1;
$("#buynum").val(numm)
}
}
//查看商家
function looksj(mid){
location.href="${pageContext.request.contextPath}/merchant/merchantaction_findmerchantbyid?merchantid="+mid;
}
</script>
</html>