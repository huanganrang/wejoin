<%@ page import="jb.listener.Application" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String staticVersion = Application.version;
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码</title>
<script type="text/javascript">
var base = '${pageContext.request.contextPath}/';
var namespace = "home";
</script>
<link href="${pageContext.request.contextPath}/wejoin/center/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/wejoin/center/css/login.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/wejoin/center/css/jquery.style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/wejoin/center/css/jquery.mCustomScrollbar.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/wejoin/center/js/jquery-1.5.1.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/wejoin/center/js/tab.js" ></script>
<script src="${pageContext.request.contextPath}/wejoin/center/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="${pageContext.request.contextPath}/wejoin/center/js/js.js"></script>
<script type="text/javascript">
function openShutManager(oSourceObj,oTargetObj,shutAble,oOpenTip,oShutTip){
var sourceObj = typeof oSourceObj == "string" ? document.getElementById(oSourceObj) : oSourceObj;
var targetObj = typeof oTargetObj == "string" ? document.getElementById(oTargetObj) : oTargetObj;
var openTip = oOpenTip || "";
var shutTip = oShutTip || "";
if(targetObj.style.display!="none"){
   if(shutAble) return;
   targetObj.style.display="none";
   if(openTip && shutTip){
    sourceObj.innerHTML = shutTip;
   }
} else {
   targetObj.style.display="block";
   if(openTip && shutTip){
    sourceObj.innerHTML = openTip;
   }
}
}
$(function(){
	changeHeightRight();
	//changeHeightLeft();
	$(".a_toggle").toggle(
	  function () {
		$('.img_x').attr('src','images/1.png');
		$('.main_right').hide();
		$(".main_center").css("width","100%");
	  },
	  function () {
		$('.img_x').attr('src','images/2.png');
		$('.main_right').show();
		$(".main_center").css("width","76%");
	  }
	);
})
$(function(){
    changeHeightRight();
	changeHeightLeft();
})
	$(window).resize(function() {
		changeHeightRight();
		changeHeightLeft();
	});
function changeHeightRight(){
	var head_h = $('.header').height();
	var ltian_menu_h = $('.ltian_menu').height();
	var ltian_form_h = $('.ltian_form').height();
	var itian_tb_h = $('.itian_tb').height();
	var b_h = $(window).height();
	var content_h = b_h - head_h - ltian_menu_h - ltian_form_h - itian_tb_h;
	$('.content_right').height(content_h)
}
function changeHeightLeft(){
	InitLeftVideo();
	var head_h = $('.header').height();
	var content_main_h = $('.content_main').height();
	var hy_title_h = $('.hy_title').height();
	var search_h = $('.search').height();
	var content_img_h = $('.content_img').height();
	var b_h = $(window).height();
	var content_h = b_h - head_h - content_main_h - hy_title_h - search_h - content_img_h ;
	console.log(content_h);
	
	if(content_h<=0){
		$('.content_main').height(195);
		content_h = b_h - head_h - content_main_h - hy_title_h - search_h - content_img_h ;
	}
	$('.content_buttom').height(content_h);
}
function InitLeftVideo(){
	var _l = $('#t_img .video').size();
	var obj_img = $('#t_img');
	if(_l==0){
		obj_img.height(0);
	}
	if(_l==1){
		obj_img.height(195);
	}
	if(_l>=2){
		obj_img.height(385);
	}
}
var bar=0;   
    var line="||";   
    var amount="";   
    document.getElementById("up").style.display="none";   
    function count(){   
    var f = document.getElementById("f");   
    var b = document.getElementById("b");   
    b.disabled  = true;   
    f.disabled  = true;   
    if(f.value==""){   
    b.disabled  = false;   
    f.disabled  = false;   
    alert("请添加上传文件");   
    return false;   
    }   
    document.getElementById("up").style.display="inline";   
    bar = bar+2;   
    amount = amount+line;   
    document.getElementById("chart").value=amount;   
    document.getElementById("percent").value=bar+"%";   
    if(bar<99){   
    setTimeout("count()",200);   
    }else{   
    b.disabled  = false;   
    f.disabled  = false;   
    alert("加载完毕！");   
    document.getElementById("up").style.display="none";   
    //  window.location="";   
    }   
    }   
</script>
</head>

<body class="ltbj">
<input type="hidden" id="userToken" value="${sessionScope.userToken.token}" />
<input type="hidden" id="userNickName" value="${sessionScope.userToken.nickName}" />
<div class="header" style="height:72px;">
	<div class="logo_list2">
		<c:choose>
			<c:when test="${!sessionScope.userToken.loginMark}">
				<div class="logo_dl">
		        	<a href="javascript:void(0);" onclick="showDjcgBox()">登录</a> 
		            <a href="javascript:void(0);" onclick="showSyldBox()">注册</a>
		        </div>
		        <c:if test="${sessionScope.userToken.token != null}">
		        	<div class="logo_name">${sessionScope.userToken.nickName} 您好！ </div>
		        	<a href="javascript:void(0)" onclick="goUserCenter()">个人中心</a>
					<a href="javascript:void(0)" onclick="logout()">退出</a>
				</c:if>
			</c:when>
			<c:otherwise>
				<div class="logo_name">会员：${sessionScope.userToken.nickName} 您好！ </div>
				<a href="javascript:void(0)" onclick="goUserCenter()">个人中心</a>
				<a href="javascript:void(0)" onclick="logout()">退出</a>
			</c:otherwise>
        </c:choose>
	</div>
    <div class="lb_menu">
    	<a href="#" class="pd_1" onclick="showchaBox()">免费创建频道</a>
        <a href="#" class="pd_2">免费创建社群</a>
        <a href="#" class="pd_3">微币充值</a>
        <a href="#" class="pd_4">使用帮助</a>
    </div>
    
    <div class="aa" style=" margin-top:13px;">
    <!--<span>游客：我是会飞的鱼</span>
    <ol><a href="#">注册</a>  |   <a href="#">登录</a>   </ol>-->
    <div class="hed_1"><a href="#">下载APP</a></div>
    <div class="hed_2"><a href="#">下载PC客户端</a></div>
    <div class="tel"></div>
    <div class="clear"></div>
    </div>
</div>

<div class="list_main">
	<div class="list_left">
    	<ul>
        	<div><span>我的收藏</span></div>
        	<li><a href="${pageContext.request.contextPath}/wejoin/center/spaceManage.jsp"><ol>收藏的频道</ol> <em>245.300</em></a></li>
            <li><a href="${pageContext.request.contextPath}/wejoin/center/association.jsp"><ol>收藏的社群</ol> <em>245.300</em></a></li>
        </ul>
        <div class="line"></div>
        <ul>
        	<div style="margin-top:10px;"><span>基本资料</span></div>
        	<li><a href="${pageContext.request.contextPath}/wejoin/center/reviseUserInfo.jsp"><ol>我的信息</ol> </a></li>
            <li><a href="${pageContext.request.contextPath}/wejoin/center/revisePassword.jsp"><ol>密码修改</ol></a></li>
        </ul>
        <div class="line"></div>
        <ul>
        	<div style="margin-top:10px;"><span>我的空间</span></div>
        	<li><a href="${pageContext.request.contextPath}/wejoin/center/spaceManage.jsp"><ol>空间管理</ol> </a></li>
        </ul>
        <div class="line"></div>
        <ul>
        	<div style="margin-top:10px;"><span>意见反馈</span></div>
        	<li><a href="${pageContext.request.contextPath}/wejoin/center/feedBack.jsp"><ol>意见反馈</ol> </a></li>
        </ul>
        <div class="line"></div>
        <ul>
        	<div style="margin-top:10px;"><span>系统消息</span></div>
        	<li><a href="#"><ol>系统消息</ol> </a></li>
        </ul>
        <div class="line"></div>
        <div class="lef_back"><a href="${pageContext.request.contextPath}/wejoin/home.jsp">返  回</a></div>
    </div>
  <div class="list_right">
    	<div class="search_title">
        	<ul>
            	<li id="one1" onclick="setTab('one',1,2)" class="hover">我的频道</li>
                <li id="one2" onclick="setTab('one',2,2)">我的社群</li>
            </ul>
            <div class="lise_se">
                <form action="" method="get">
               	  <input type="text" class="puta" onblur="if(this.value==''){this.value='请输入房间 / 室主号';this.style.color='#ccc'}" onfocus="if(this.value=='请输入房间 / 室主号'){this.value='';this.style.color='#333'}" value="请输入房间 / 室主号" id="textfield" name="telphone" style="color:#ccc;">
                    <input name="" type="submit" value="" class="putb"/>
                </form>
          </div>
        </div>
        
      <div class="list_txt">
       	  <div id="con_one_1">
          		<div class="society_list">
                	<ul>
                    	<li>
                            <div class="list_1"><span class="youimg">稻米之家</span>  <em>在线：292680</em></div>
                            <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                            <div class="list_3">
                            	<span>创建者：会飞的鱼</span> 
                                <div class="lis_rig">
                                	<div class="ls_tt">
                                        <a onclick="openShutManager(this,'box_100',false,'关闭','展开')">展开</a>
                                        <span>历史人数 :<strong>17864</strong> </span>
                                        <span>正式学员 :<strong>17864</strong> </span>
                                        <span>管理员 :<strong>17864</strong> </span>
                                        <span>讲师 :<strong>17864</strong> </span>
                                        <span>黑名单 :<strong>17864</strong> </span>
                                	</div>
                                    <div class="rig_tb">
                                		<strong><a href="#" class="bimg_2">编辑</a></strong>  <strong><a href="#" class="bimg_3">删除</a></strong>
                                    </div>
                                </div>  
                            </div>
                         </li>
                         <div class="channel_block" id="box_100" style="display:none;">
                         	<div class="hous_list">
                            	<div class="hous_bor">
                                    <div class="list_1"><span class="youimg">稻米之家</span>  <em><a onclick="openShutManager(this,'box_201')">人员设置</a>  在线：292680</em></div>
                                    <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                                    <div class="list_3">
                                        <span>房号：287&nbsp;&nbsp; 创建者：会飞的鱼</span> <ol><a href="#">创建房间</a></ol>  
                                        <div class="rig_tb">
                                            <strong><a href="#" class="bimg_2">编辑</a></strong>  <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="staff_set" id="box_201" style="display:none;">
                                	<div class="staff_search">
                                    	<div class="sear_le">
                                        	<form action="" method="get">
                                              <input type="text" class="sear_pt1" onblur="if(this.value==''){this.value='请输入ID/昵称搜索';this.style.color='#ccc'}" onfocus="if(this.value=='请输入ID/昵称搜索'){this.value='';this.style.color='#333'}" value="请输入ID/昵称搜索" id="textfield" name="telphone" style="color:#ccc;">
                                                <input name="" type="submit" value="" class="sear_an"/>
                                            </form>
                                        </div>
                                        <div class="sear_tb">
                                        	<a href="#" class="tb1"></a>
                                            <a href="#" class="tb2"></a>
                                            <a href="#" class="tb3"></a>
                                        </div>
                                    </div>
                                    
                                    <div class="portrait_list">
                                    	<div class="content mCustomScrollbar" style=" height:382px;">
                                    	<ul>
                                        	<li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb1"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb2"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb3"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb4"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb1"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb2"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb1"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb2"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb3"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb4"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb1"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb2"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            <div class="clear"></div>
                                        </ul>
                                        </div>
                                    </div>
                                    
                                    <div class="pro_bottom">
                                    	<div class="pro_sel">
                                        	 <input name="" type="checkbox" value="sugar" class="lba_n" id="allChecked" onClick="selectAllDels()"/>
                                             <label for="allChecked">全选</label>
                                        </div>
                                        <span>
                                        	<a href="#">设为管理员</a>
                                            <a href="#">设为讲师</a>
                                            <a href="#">设为学员</a>
                                            <a href="#">设为黑名单</a>
                                            <a href="#">发送消息</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="hous_list">
                            	<div class="hous_bor">
                                    <div class="list_1"><span class="youimg">稻米之家</span>  <em><a onclick="openShutManager(this,'box_202')">人员设置</a>  在线：292680</em></div>
                                    <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                                    <div class="list_3">
                                        <span>房号：287&nbsp;&nbsp; 创建者：会飞的鱼</span> <ol><a href="#">创建房间</a></ol>  
                                        <div class="rig_tb">
                                            <strong><a href="#" class="bimg_2">编辑</a></strong>  <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="staff_set" id="box_202" style="display:none;">
                                	<div class="staff_search">
                                    	<div class="sear_le">
                                        	<form action="" method="get">
                                              <input type="text" class="sear_pt1" onblur="if(this.value==''){this.value='请输入ID/昵称搜索';this.style.color='#ccc'}" onfocus="if(this.value=='请输入ID/昵称搜索'){this.value='';this.style.color='#333'}" value="请输入ID/昵称搜索" id="textfield" name="telphone" style="color:#ccc;">
                                                <input name="" type="submit" value="" class="sear_an"/>
                                            </form>
                                        </div>
                                        <div class="sear_tb">
                                        	<a href="#" class="tb1"></a>
                                            <a href="#" class="tb2"></a>
                                            <a href="#" class="tb3"></a>
                                        </div>
                                    </div>
                                    
                                    <div class="portrait_list">
                                    	<div class="content mCustomScrollbar" style=" height:382px;">
                                    	<ul>
                                        	<li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb1"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb2"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb3"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb4"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb1"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb2"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb1"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb2"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb3"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb4"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb1"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb2"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            <div class="clear"></div>
                                        </ul>
                                        </div>
                                    </div>
                                    
                                    <div class="pro_bottom">
                                    	<div class="pro_sel">
                                        	 <input name="" type="checkbox" value="sugar" class="lba_n" id="allChecked" onClick="selectAllDels()"/>
                                             <label for="allChecked">全选</label>
                                        </div>
                                        <span>
                                        	<a href="#">设为管理员</a>
                                            <a href="#">设为讲师</a>
                                            <a href="#">设为学员</a>
                                            <a href="#">设为黑名单</a>
                                            <a href="#">发送消息</a>
                                        </span>
                                    </div>
                                </div>
                                
                            </div>
                            
                            <div class="hous_list hous_wid">
                            	<div class="hous_bor">
                                    <div class="list_1"><span class="youimg">稻米之家</span>  <em><a onclick="openShutManager(this,'box_203')">人员设置</a>  在线：292680</em></div>
                                    <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                                    <div class="list_3">
                                        <span>房号：287&nbsp;&nbsp; 创建者：会飞的鱼</span> <ol><a href="#">创建房间</a></ol>  
                                        <div class="rig_tb">
                                            <strong><a href="#" class="bimg_2">编辑</a></strong>  <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="staff_set" id="box_203" style="display:none;">
                                	<div class="staff_search">
                                    	<div class="sear_le">
                                        	<form action="" method="get">
                                              <input type="text" class="sear_pt1" onblur="if(this.value==''){this.value='请输入ID/昵称搜索';this.style.color='#ccc'}" onfocus="if(this.value=='请输入ID/昵称搜索'){this.value='';this.style.color='#333'}" value="请输入ID/昵称搜索" id="textfield" name="telphone" style="color:#ccc;">
                                                <input name="" type="submit" value="" class="sear_an"/>
                                            </form>
                                        </div>
                                        <div class="sear_tb">
                                        	<a href="#" class="tb1"></a>
                                            <a href="#" class="tb2"></a>
                                            <a href="#" class="tb3"></a>
                                        </div>
                                    </div>
                                    
                                    <div class="portrait_list">
                                    	<div class="content mCustomScrollbar" style=" height:382px;">
                                    	<ul>
                                        	<li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb1"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb2"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb3"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb4"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb1"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb2"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb1"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb2"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb3"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb4"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb1"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb2"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            <div class="clear"></div>
                                        </ul>
                                        </div>
                                    </div>
                                    
                                    <div class="pro_bottom">
                                    	<div class="pro_sel">
                                        	 <input name="" type="checkbox" value="sugar" class="lba_n" id="allChecked" onClick="selectAllDels()"/>
                                             <label for="allChecked">全选</label>
                                        </div>
                                        <span>
                                        	<a href="#">设为管理员</a>
                                            <a href="#">设为讲师</a>
                                            <a href="#">设为学员</a>
                                            <a href="#">设为黑名单</a>
                                            <a href="#">发送消息</a>
                                        </span>
                                    </div>
                                </div>  
                            </div>
                            
                            <div class="clear"></div>
                         </div>
                         
                         
                         <li>
                            <div class="list_1"><span class="youimg">稻米之家</span>  <em>在线：292680</em></div>
                            <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                            <div class="list_3">
                            	<span>创建者：会飞的鱼</span> 
                                <div class="lis_rig">
                                	<div class="ls_tt">
                                        <a onclick="openShutManager(this,'box_101',false,'关闭','展开')">展开</a>
                                        <span>历史人数 :<strong>17864</strong> </span>
                                        <span>正式学员 :<strong>17864</strong> </span>
                                        <span>管理员 :<strong>17864</strong> </span>
                                        <span>讲师 :<strong>17864</strong> </span>
                                        <span>黑名单 :<strong>17864</strong> </span>
                                	</div>
                                    <div class="rig_tb">
                                		<strong><a href="#" class="bimg_2">编辑</a></strong>  <strong><a href="#" class="bimg_3">删除</a></strong>
                                    </div>
                                </div>  
                            </div>
                         </li>
                         
                         <div class="channel_block" id="box_101" style="display:none;">
                         	<div class="hous_list">
                            	<div class="hous_bor">
                                    <div class="list_1"><span class="youimg">稻米之家</span>  <em><a onclick="openShutManager(this,'box_204')">人员设置</a>  在线：292680</em></div>
                                    <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                                    <div class="list_3">
                                        <span>房号：287&nbsp;&nbsp; 创建者：会飞的鱼</span> <ol><a href="#">创建房间</a></ol>  
                                        <div class="rig_tb">
                                            <strong><a href="#" class="bimg_2">编辑</a></strong>  <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="staff_set" id="box_204" style="display:none;">
                                	<div class="staff_search">
                                    	<div class="sear_le">
                                        	<form action="" method="get">
                                              <input type="text" class="sear_pt1" onblur="if(this.value==''){this.value='请输入ID/昵称搜索';this.style.color='#ccc'}" onfocus="if(this.value=='请输入ID/昵称搜索'){this.value='';this.style.color='#333'}" value="请输入ID/昵称搜索" id="textfield" name="telphone" style="color:#ccc;">
                                                <input name="" type="submit" value="" class="sear_an"/>
                                            </form>
                                        </div>
                                        <div class="sear_tb">
                                        	<a href="#" class="tb1"></a>
                                            <a href="#" class="tb2"></a>
                                            <a href="#" class="tb3"></a>
                                        </div>
                                    </div>
                                    
                                    <div class="portrait_list">
                                    	<div class="content mCustomScrollbar" style=" height:382px;">
                                    	<ul>
                                        	<li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb1"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb2"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb3"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb4"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb1"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb2"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb1"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb2"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb3"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb4"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb1"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            
                                            <li>
                                            	<img src="images/dog.gif" />
                                                <span>我是会飞的鱼</span>
                                                <strong>最近登录：2015/11/14</strong>
                                                <ol class="tb2"></ol>
                                                <input name="preDelCheck" type="checkbox" value="sugar" class="an"/>
                                            </li>
                                            <div class="clear"></div>
                                        </ul>
                                        </div>
                                    </div>
                                    
                                    <div class="pro_bottom">
                                    	<div class="pro_sel">
                                        	 <input name="" type="checkbox" value="sugar" class="lba_n" id="allChecked" onClick="selectAllDels()"/>
                                             <label for="allChecked">全选</label>
                                        </div>
                                        <span>
                                        	<a href="#">设为管理员</a>
                                            <a href="#">设为讲师</a>
                                            <a href="#">设为学员</a>
                                            <a href="#">设为黑名单</a>
                                            <a href="#">发送消息</a>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="hous_list">
                            	<div class="hous_bor">
                                    <div class="list_1"><span class="youimg">稻米之家</span>  <em><a href="#">人员设置</a>  在线：292680</em></div>
                                    <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                                    <div class="list_3">
                                        <span>房号：287&nbsp;&nbsp; 创建者：会飞的鱼</span> <ol><a href="#">创建房间</a></ol>  
                                        <div class="rig_tb">
                                            <strong><a href="#" class="bimg_2">编辑</a></strong>  <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="hous_list hous_wid">
                            	<div class="hous_bor">
                                    <div class="list_1"><span class="youimg">稻米之家</span>  <em><a href="#">人员设置</a>  在线：292680</em></div>
                                    <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                                    <div class="list_3">
                                        <span>房号：287&nbsp;&nbsp; 创建者：会飞的鱼</span> <ol><a href="#">创建房间</a></ol>  
                                        <div class="rig_tb">
                                            <strong><a href="#" class="bimg_2">编辑</a></strong>  <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         </div>
                         
                         
                         
                         <li>
                            <div class="list_1"><span class="youimg">稻米之家</span>  <em>在线：292680</em></div>
                            <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                            <div class="list_3">
                            	<span>创建者：会飞的鱼</span> 
                                <div class="lis_rig">
                                	<div class="ls_tt">
                                        <a>展开</a>
                                        <span>历史人数 :<strong>17864</strong> </span>
                                        <span>正式学员 :<strong>17864</strong> </span>
                                        <span>管理员 :<strong>17864</strong> </span>
                                        <span>讲师 :<strong>17864</strong> </span>
                                        <span>黑名单 :<strong>17864</strong> </span>
                                	</div>
                                    <div class="rig_tb">
                                		<strong><a href="#" class="bimg_2">编辑</a></strong>  <strong><a href="#" class="bimg_3">删除</a></strong>
                                    </div>
                                </div>  
                            </div>
                         </li>
                         
                         <li>
                            <div class="list_1"><span class="youimg">稻米之家</span>  <em>在线：292680</em></div>
                            <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                            <div class="list_3">
                            	<span>创建者：会飞的鱼</span> 
                                <div class="lis_rig">
                                	<div class="ls_tt">
                                        <a>展开</a>
                                        <span>历史人数 :<strong>17864</strong> </span>
                                        <span>正式学员 :<strong>17864</strong> </span>
                                        <span>管理员 :<strong>17864</strong> </span>
                                        <span>讲师 :<strong>17864</strong> </span>
                                        <span>黑名单 :<strong>17864</strong> </span>
                                	</div>
                                    <div class="rig_tb">
                                		<strong><a href="#" class="bimg_2">编辑</a></strong>  <strong><a href="#" class="bimg_3">删除</a></strong>
                                    </div>
                                </div>  
                            </div>
                         </li>
                         
                     <div class="fax" style="right:30px; bottom:10px; ">
                      <a href="#">上一页</a>
                          <div class="fax_list">
                              <span>1</span>
                              <div class="span_list">
                                  <div class="content mCustomScrollbar" style="height:95px;">
                                    <a href="#">1</a>
                                    <a href="#">2</a>
                                    <a href="#">3</a>
                                    <a href="#">4</a>
                                    <a href="#">5</a>
                                    <a href="#">6</a>
                                    <a href="#">7</a>
                                    <a href="#">8</a>
                                  	<a href="#">9</a>                                </div>
                              </div>
                      </div>
                  <a href="#">下一页</a>                </div>  
                  
                    </ul>
           	  	</div>
          </div>
          
          
          <div id="con_one_2" style="display:none;">
          		<div class="society_list">
                	<ul>
                    	<li>
                            <div class="list_1"><span>稻米之家</span>  </div>
                            <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                            <div class="list_3">
                            	<span>创建者：会飞的鱼</span> 
                                <div class="lis_rig">
                                    <div class="rig_tb">
                                		<strong><a onclick="openShutManager(this,'box20',false,'关闭','展开')" class="bimg_1">展开</a></strong>  <strong><a href="#" class="bimg_2">编辑</a></strong>  <strong><a href="#" class="bimg_3">删除</a></strong>
                                    </div>
                                </div>  
                            </div>
                            
                            <div class="box_list" id="box20" style="display:none;">
                            	<div class="box_cock">会员：154875 人 &nbsp;&nbsp;&nbsp;  帖子：52486 篇  &nbsp;&nbsp;&nbsp;  课程：16 个  </div>  
                            	<div class="content mCustomScrollbar" style=" background:none; height:308px; padding-right:20px; ">
                            	<ul>
                                	<li>
                                    	<a href="#" class="list_zi"><strong>(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                            <span>帖子：52486 篇 </span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" style="background:none;">查看</a></strong>  
                                        </div>
                                    </li>
                                    
                                	<li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                </ul>
                                </div>
                            </div>
                        </li>
                        
                        <li>
                            <div class="list_1"><span>稻米之家</span>  </div>
                            <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                            <div class="list_3">
                            	<span>创建者：会飞的鱼</span> 
                                <div class="lis_rig">
                                    <div class="rig_tb">
                                		<strong><a onclick="openShutManager(this,'box21',false,'关闭','展开')" class="bimg_1">展开</a></strong>  <strong><a href="#" class="bimg_2">编辑</a></strong>  <strong><a href="#" class="bimg_3">删除</a></strong>
                                    </div>
                                </div>  
                            </div>
                            
                            
                            <div class="box_list" id="box21" style="display:none;">
                            	<div class="box_cock">会员：154875 人 &nbsp;&nbsp;&nbsp;  帖子：52486 篇  &nbsp;&nbsp;&nbsp;  课程：16 个  </div>  
                            	<div class="content mCustomScrollbar" style=" background:none; height:308px; padding-right:20px; ">
                            	<ul>
                                	<li>
                                    	<a href="#" class="list_zi"><strong>(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                            <span>帖子：52486 篇 </span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" style="background:none;">查看</a></strong>  
                                        </div>
                                    </li>
                                    
                                	<li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                </ul>
                                </div>
                            </div>
                        </li>
                       
                       <li>
                            <div class="list_1"><span>稻米之家</span>  </div>
                            <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                            <div class="list_3">
                            	<span>创建者：会飞的鱼</span> 
                                <div class="lis_rig">
                                    <div class="rig_tb">
                                		<strong><a onclick="openShutManager(this,'box22',false,'关闭','展开')" class="bimg_1">展开</a></strong>  <strong><a href="#" class="bimg_2">编辑</a></strong>  <strong><a href="#" class="bimg_3">删除</a></strong>
                                    </div>
                                </div>  
                            </div>
                            
                            <div class="box_list" id="box22" style="display:none;">
                            	<div class="box_cock">会员：154875 人 &nbsp;&nbsp;&nbsp;  帖子：52486 篇  &nbsp;&nbsp;&nbsp;  课程：16 个  </div>  
                            	<div class="content mCustomScrollbar" style=" background:none; height:308px; padding-right:20px; ">
                            	<ul>
                                	<li>
                                    	<a href="#" class="list_zi"><strong>(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                            <span>帖子：52486 篇 </span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" style="background:none;">查看</a></strong>  
                                        </div>
                                    </li>
                                    
                                	<li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                </ul>
                                </div>
                            </div>
                        </li>
                        
                        
                        <li>
                            <div class="list_1"><span>稻米之家</span>  </div>
                            <div class="list_2"><span><img src="images/pic1.gif" /></span>  <em>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间，每个人眼里都有一个不同的微社区</em></div>
                            <div class="list_3">
                            	<span>创建者：会飞的鱼</span> 
                                <div class="lis_rig">
                                    <div class="rig_tb">
                                		<strong><a onclick="openShutManager(this,'box23',false,'关闭','展开')" class="bimg_1">展开</a></strong>  <strong><a href="#" class="bimg_2">编辑</a></strong>  <strong><a href="#" class="bimg_3">删除</a></strong>
                                    </div>
                                </div>  
                            </div>
                            
                            <div class="box_list" id="box23" style="display:none;">
                            	<div class="box_cock">会员：154875 人 &nbsp;&nbsp;&nbsp;  帖子：52486 篇  &nbsp;&nbsp;&nbsp;  课程：16 个  </div>  
                            	<div class="content mCustomScrollbar" style=" background:none; height:308px; padding-right:20px; ">
                            	<ul>
                                	<li>
                                    	<a href="#" class="list_zi"><strong>(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                            <span>帖子：52486 篇 </span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" style="background:none;">查看</a></strong>  
                                        </div>
                                    </li>
                                    
                                	<li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                    
                                    <li>
                                    	<a href="#" class="list_zi"><strong class="green">(I 吧)</strong>有人把微社区当成移动互联网时代的网上家园，有人把微社区当成平行于现实生活轨道的虚拟空间</a>
                                        <div class="praise">
                                        	<span class="pra_tb1">(31524)</span>
                                            <span class="pra_tb2">(1571)</span>
                                            <span>播放：7847</span>
                                        </div>
                                        <div class="operation">
                                        	<strong><a href="#" class="bimg_2">编辑</a></strong>  
                                            <strong><a href="#" class="bimg_3">删除</a></strong>
                                        </div>
                                    </li>
                                </ul>
                                </div>
                            </div>
                        </li>
                        
                    </ul>
                    
                    <div class="fax" style="right:30px; bottom:10px; ">
                      <a href="#">上一页</a>
                          <div class="fax_list">
                              <span>1</span>
                              <div class="span_list">
                                  <div class="content mCustomScrollbar" style="height:95px;">
                                    <a href="#">1</a>
                                    <a href="#">2</a>
                                    <a href="#">3</a>
                                    <a href="#">4</a>
                                    <a href="#">5</a>
                                    <a href="#">6</a>
                                    <a href="#">7</a>
                                    <a href="#">8</a>
                                  	<a href="#">9</a>                                </div>
                              </div>
                      </div>
                  <a href="#">下一页</a>                </div>
                  
                </div>
          </div>
      </div>
  </div>
    
    <div class="hot_list">
    	<div><span>房间人气排行榜</span></div>
        <ul>
        	<li><a href="#"><span>1</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>2</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>3</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>4</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>5</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>6</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>7</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>8</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>9</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>10</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>11</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>12</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>13</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>14</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>15</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>16</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
            <li><a href="#"><span>17</span><ol>放声SHOW唱</ol><em>245.300</em></a></li>
        </ul>
    </div>
    <div class="clear"></div>
</div>
<div class="bj230"></div>


</body>
</html>
