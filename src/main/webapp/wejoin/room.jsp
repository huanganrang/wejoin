<%@ page import="jb.listener.Application" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%
	String staticVersion = Application.version;
	String houseToken = request.getParameter("houseToken");
	String houseId = request.getParameter("houseId");
	String channelId = request.getParameter("channelId");
	String huanxinRoomId = request.getParameter("huanxinRoomId");
	String owner = request.getParameter("owner");
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>房间</title>
<script type="text/javascript">
var base = '${pageContext.request.contextPath}/';
var namespace = "room";
</script>
<link href="${pageContext.request.contextPath}/wejoin/css/style.css?v=<%=staticVersion%>" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/wejoin/css/login.css?v=<%=staticVersion%>" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/wejoin/css/jquery.style.css?v=<%=staticVersion%>" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/wejoin/css/jquery.mCustomScrollbar.css?v=<%=staticVersion%>" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/wejoin/js/RightMenu/smartMenu.css?v=<%=staticVersion%>" rel="stylesheet" type="text/css" />
<%--<link href="${pageContext.request.contextPath}/jslib/video-js/video-js.css" rel="stylesheet" type="text/css" />--%>
<link href="${pageContext.request.contextPath}/jslib/jquery-ui-1.10.4/css/jquery-ui.min.css?v=<%=staticVersion%>" rel="stylesheet" type="text/css" />

	<!-- <script src="${pageContext.request.contextPath}/jslib/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script> -->
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/web-im-1.0.7.2/sdk/jquery-1.11.1.js?v=<%=staticVersion%>"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/jquery.mCustomScrollbar.concat.min.js?v=<%=staticVersion%>" type="text/javascript" charset="utf-8"></script>
<!-- <script src="${pageContext.request.contextPath}/wejoin/js/sockjs.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/stomp.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/knockout.js" type="text/javascript" charset="utf-8"></script> -->
<script src="${pageContext.request.contextPath}/wejoin/js/RightMenu/jquery-smartMenu.js?v=<%=staticVersion%>" type="text/javascript" charset="utf-8"></script>
<%--
<script src="${pageContext.request.contextPath}/jslib/video-js/video.js" type="text/javascript" charset="utf-8"></script>
--%>
<script type='text/javascript' src='${pageContext.request.contextPath}/jslib/web-im-1.0.7.2/sdk/strophe.js?v=<%=staticVersion%>'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/jslib/web-im-1.0.7.2/sdk/json2.js?v=<%=staticVersion%>'></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/web-im-1.0.7.2/sdk/easemob.im-1.0.7.js?v=<%=staticVersion%>"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/web-im-1.0.7.2/easemob.im.config.js?v=<%=staticVersion%>"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/jquery-ui-1.10.4/jquery-ui.min.js?v=<%=staticVersion%>"></script>

	<!-- <script src="${pageContext.request.contextPath}/wejoin/js/easemob.js" type="text/javascript" charset="utf-8"></script> -->
<link href="${pageContext.request.contextPath}/wejoin/js/slide/slide.css?v=<%=staticVersion%>" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/wejoin/js/slide/slide.js?v=<%=staticVersion%>" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/jslib/jquery.base64.js?v=<%=staticVersion%>" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/jquery.cookie.js?v=<%=staticVersion%>" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/room.js?v=<%=staticVersion%>" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/common.js?v=<%=staticVersion%>" type="text/javascript" charset="utf-8"></script>

<script src="${pageContext.request.contextPath}/wejoin/js/login.js?v=<%=staticVersion%>" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/check.js?v=<%=staticVersion%>" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/js.js?v=<%=staticVersion%>" type="text/javascript" charset="utf-8"></script>


<style type="text/css">
	.ck-slide { width: 730px; height: 580px; margin: 0 auto;}
	.ck-slide ul.ck-slide-wrapper { height: 320px;}
	#voiceLine .ui-slider-range { background: #b1ee1d; }
	#voiceLine .ui-slider-handle { border-color: #b1ee1d; }
	#voiceLine .ui-slider-handle{height:0.4em;top: -.15em;}
</style>

<script type="text/javascript">
var basePath = '${pageContext.request.contextPath}';
var ROOM_INFO = {
	channelId:<%=channelId%>,
	houseId:<%=houseId%>,
	owner: '<%=owner%>',
	isOwner: function () {
		return "true" == ROOM_INFO.owner;
	}
}
//videojs.options.flash.swf = base + "jslib/video-js/video-js.swf";

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
		$('.content_right').height(content_h);
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

function setVoiceNumber(voice){

	$( "#voiceLine" ).slider( "value",voice);
}
</script>
</head>

<body style="overflow: hidden;">
<input type="hidden" id="userToken" value="${sessionScope.userToken.token}" />
<input type="hidden" id="nickName" value="${sessionScope.userToken.nickName}" />
<!-- --><input type="hidden" id="huanxinUid" value="${sessionScope.userToken.huanxinUid}" />
<input type="hidden" id="huanxinPsw" value="${sessionScope.userToken.password}" /> 

<input type="hidden" id="houseToken" value="<%=houseToken %>" />
<input type="hidden" id="huanxinRoomId" value="<%=huanxinRoomId %>" />
<div class="header">

    
    <div class="logo"></div>
    
    <ul class="tab_button">
        <li id="blackbord" class="hover"><a href="javascript:void(0);">黑 板</a></li>
        <li id="documets"><a href="javascript:void(0);">文 档</a></li>
        <li id="voice"><a href="javascript:void(0);">影 音</a></li>
    </ul>
    
    <div class="aa">
    <ol>
    	<c:choose>
			<c:when test="${!sessionScope.userToken.loginMark}">
		        	<a href="javascript:void(0);" onClick="showDjcgBox()">登录</a> |
		            <a href="javascript:void(0);" onClick="showSyldBox()">注册</a>
		        <c:if test="${sessionScope.userToken.token != null}">
		        	<%--<div class="logo_name">${sessionScope.userToken.nickName} 您好！ </div>
					<a href="javascript:void(0)" onclick="logoutRoom()">退出</a>--%>

				</c:if>
			</c:when>
			<c:otherwise>
				<div class="logo_name">会员：${sessionScope.userToken.nickName} 您好！ </div>
				<a href="javascript:void(0)" onClick="logoutRoom()">退出</a>

			</c:otherwise>
        </c:choose>
		  </ol>
    <!--登录后的状态 <ol>会员：<a href="javascript:void(0);">会飞的鱼</a>  |   <a href="javascript:void(0);">退出</a></ol> -->
   
    
    <div class="hed_1"><a href="http://www.weiqu168.com/weixun.latest.apk" target="_blank">下载APP</a></div>
    <div class="hed_2"><a href="javascript:void(0);">下载PC客户端</a></div>
    <div class="qq"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1794691101&site=qq&menu=yes"><img src="images/q_1.gif" border="0" alt="点击咨询" title="点击咨询"></a></div>
    <div class="tel"></div>
    <div class="clear"></div>
    </div>
    
    <div class="sz_pr">
    	<a href="#" class="tb1">分享</a>
        <a href="#" onclick="showromBox()" class="tb2">房间设置</a>
    </div>
    
</div>


<div class="main_left">
	<div class="content mCustomScrollbar content_main" id="t_img" style="height:385px;">
	<div class="video example_video_1">
    	<%-- <video id="example_video_1" class="video-js vjs-default-skin" class="video-js vjs-default-skin" controls preload="auto" width="220" height="174"
      				poster="http://video-js.zencoder.com/oceans-clip.png" data-setup="{}">
		    	<source src="rtmp://s2.weiqu168.com/live/<%=channelId %>/<%=houseId %>" type="rtmp/mp4"/>
		    	<p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>
		  	</video>  --%>
		  <iframe id="cameraPull" width="220" height="182" frameborder="no" scrolling="no"></iframe>
			<div class="col"><a href="#"><img src="images/x.gif"></a></div>
       		<div class="name_title"><div class="name_tt">房主：全飞的鱼</div><div class="name_sj"></div></div>
		  	<%--<div class="name_title" style="z-index:-1">
                <div class="name_tt">${sessionScope.userToken.nickName}</div>
                <div class="name_sj"></div>
            </div>--%>
    </div>

  <!-- <div class="video hidden_area"> -->
  <!-- -->   <div class="hidden_area">
       <!--  <div class="name_title" style="z-index:-1"> -->
       <!--  --> <%--<div class="" style="z-index:-1">
            <div class="name_tt">${sessionScope.userToken.nickName}</div>
            <div class="name_sj"></div>
        </div>--%>
		<iframe id="cameraPush" width="220" height="174" frameborder="no" ></iframe>

    </div>

    <!-- <div class="video">
    	<img src="images/video.gif" />
    </div>

    <div class="video">
    	<img src="images/video.gif" />
    </div> -->
    </div>

   <div class="hy_title">
    	<span>在线会员</span>
        <%--<a href="#" class="le" onclick="setSearchScope(true)">男</a>
        <a href="#" onclick="setSearchScope(false)">女</a> --%>
	   	<ol id="onlineNum"></ol>
   </div>
    
    <div class="search">
        <input name="" type="button" class="tzbm" id="searchUser" value=""/>
        <input type="text" class="pt1" onBlur="if(this.value==''){this.value='查找用户';this.style.color='#ccc'}" onFocus="if(this.value=='查找用户'){this.value='';this.style.color='#333'}" value="查找用户" id="textfieldUser" name="telphone" style="color:#ccc;">
        
        <span></span>
        <div class="clear"></div>
    </div>
    <div class="content mCustomScrollbar content_buttom">
    <div class="list_name">
    	<ul>

        </ul>
    </div>
    </div>
	<div class="content_img">
	    	<div class="content_tb1"><a onclick="showvdoBox()" href="#"><img src="images/c1.png"></a></div>
	        <div class="content_tb1"><a href="javascript:void(0);"><img src="images/c2.png" /></a></div>
	        <div class="content_txt1" >
				<div id="voiceLine" style="width:100px;margin-top: 20px;height: 3px;"></div>
			</div>
	        <div class="content_tb2"><a href="javascript:void(0);" class="on" id="camaraControl">图标</a></div>
	 </div>
</div>

<div class="main_center" id="box3">

    <div class="center_max">
        <div class="main_pic">
        	<iframe id="drawer" style="width:100%;height:630px;" src="${pageContext.request.contextPath}/canvas/example/drawer.jsp?houseId=<%=houseId %>&channelId=<%=channelId %>" frameborder="no"></iframe>
            <div class="scroll"><marquee direction="left" id="notice" scrollamount="3">☆☆《投资宝典》已经上线，内含老师技术教学视频以及投资心得，免费领取,详情请咨询【高级客服QQ】↑↑↑</marquee></div>
        </div>

        <div class="main_pic" style="display: none;">
            <div class="cneter_menu">
	               <a href="javascript:void(0);" class="t4" id="uploadDocumet"><img src="images/t4.png" /></a>
	         </div>
	        
            <img src="images/pic.gif" width="730" id="imageBoard" height="550px;"/>
           
           	<div class="ck-slide" style="display: none;">
				<div class="ck-slide-dir">
					<ul class="ck-slide-wrapper">
					</ul>
				</div>
				<a href="javascript:;" class="ctrl-slide ck-prev" style="opacity: 0.6;">上一张</a> 
				<a href="javascript:;" class="ctrl-slide ck-next" style="opacity: 0.6;">下一张</a>
				<div class="ck-slidebox" style="margin-left: -54px;">
					<div class="slideWrap">
						<ul class="dot-wrap">
						</ul>
					</div>
				</div>
			</div>
			
        </div>
        <div class="main_pic" style="display: none;">
            <div class="cneter_menu">
                <a href="javascript:void(0);" class="t4" id="uploadMovie"><img src="images/t4.png" /></a>
            </div>
<%--
            <img src="images/pic.gif" width="730"/>
--%>
			<iframe id="videoIframe" style="width:100%;height:630px;" frameborder="no"></iframe>
        </div>
    </div>
    <!-- 
    <div class="fax">
    	<a href="javascript:void(0);">上一页</a>
        	<div class="fax_list">
            	<span>1</span>
                <div class="span_list">
                	<div class="content mCustomScrollbar" style="height:95px;">
                	<a href="javascript:void(0);">1</a>
                    <a href="javascript:void(0);">2</a>
                    <a href="javascript:void(0);">3</a>
                    <a href="javascript:void(0);">4</a>
                    <a href="javascript:void(0);">5</a>
                    <a href="javascript:void(0);">6</a>
                </div>
                </div>
            </div>
        <a href="javascript:void(0);">下一页</a>    
    </div> -->
  <div class="col" style="top:42px; right:0px;display: none; "><a href="javascript:void(0);" onClick="openShutManager(this,'box3')"><img src="images/x.gif" /></a></div>
    <div class="sj"><a class="a_toggle" href="javascript:;;"><img class="img_x" src="images/1.png" /></a></div>
</div>

<div class="main_right" id="box4">
	
	<div class="content mCustomScrollbar content_right" style="height:580px;">
	<div class="ltian">
    	<ul>
        </ul>
    </div>
    </div>
    
    <div class="ltian_menu" style="z-index: 3;">
    	<div class="ltia_2">
        	<ol class="face_div_ac"><img class="img_tb3 face_div_ac" src="images/tb3.png" /></ol>
            <div class="v_bc face_div" id="faceWrapper">
        	</div>
        </div>
        
        
        <div class="ltia_2" style="margin-left:5px;">
        	<ol class="gift_div_ac"><img class="img_tb3 gift_div_ac" src="images/tb2.png" /></ol>
            <div class="v_bc gift_div" style="top: -226px;">
        		<a href="javascript:void(0);"><img src="images/tb/balloon.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/bianping-christmas-2014-05.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/bird-toys.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/bird-white.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/bluefaces_12.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/buel.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/catlover.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/christmas-balls.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/cocktail.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/colour_apple_02.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/confettiicon.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/cyan.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/dahuangmao-04.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/dancing-minion-icon.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/disney_dax_pink_03.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/disney_dax_pink_06.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/dog_04.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/dummy-fish.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/email.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/fileexplorer.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/gm.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/goo.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/hatcon.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/iceage-02.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/iceage-06.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/kook.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/labrador.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/loco_roco_03.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/madagascar_01.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/madagascar_02.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/madagascar_03.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/madagascar_04.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/madagascar_08.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/medusa.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/mime_riendo.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/musicherz.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/pig-green.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/popkart_01.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/poulpo.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/psychotic-penguin.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/puppy_dogs_02.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/puppy_dogs_04.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/purple.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/rtm.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/russel.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/santa.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/shengdanlaoren-2014-10.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/snow_leopard_06.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/social_network.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/thememanager.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/twitter4.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/uncle-dumplin.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/updater.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/wabi.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/weather (1).png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/weather.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/wet-dog.png" /></a>
	            <a href="javascript:void(0);"><img src="images/tb/xmas-wreath.png" /></a>
        	</div>
        </div>

		<div style=" width:75px; text-align:center; padding-left:5px; " class="ltia_1">
        	<input type="checkbox" id="an1" value="456" name="name"><label for="an1">所有人</label>
        </div>
        
        <div class="ltia_1" style=" width:135px; float:right; display: none;">
        	<span>所有人</span>
            <div class="ltia_bj someone_div">
            <div class="content" style="height:320px;">
            <div class="v_ren mCustomScrollbar">
            	<ul></ul>
            </div>
            </div>
            </div>
        </div>

        
    </div>
    <div class="ltian_form">
    	<form action="" method="get">
        <textarea name="" cols="" rows="" class="pt3" id="content"></textarea>
        <input name="" type="button" value="发送" class="tzfs" id="sendMsg"/>
        </form>
    </div> 
    <!--
    <div class="itian_tb">
    	<span><a href="javascript:void(0);" class="a1">录制</a></span>
        <span><a href="javascript:void(0);" class="a2">屏幕共享</a></span>
        <span><a href="javascript:void(0);" class="a3">分享</a></span>
        <span><a href="javascript:void(0);" class="a4">房间设置</a></span>
        <div class="clear"></div>
    </div>-->
    
</div>

<div class="clear"></div>
<div style="display:none;">
    <form method="POST" target="uploadFrame" id="uploadform" action="http://139.196.34.76:8080/upload" enctype="multipart/form-data">
        <!--<form method="POST" action="http://localhost:8080/upload" enctype="multipart/form-data" >-->
        File:
        <input type="file" name="file" id="file" /> <br/>

        houseToken:
        <input type="text" value="<%=houseToken%>" name="houseToken"/>
        userToken:
        <input type="text" value="${sessionScope.userToken.token}" name="userToken"/>
        type:
        <input type="text" value="3" name="type" id="fileType"/>

        </br>
    </form>
    <form method="POST" target="uploadFrame" id="uploadformMovie" action="http://139.196.34.76:8080/upload" enctype="multipart/form-data">
        <input type="file" name="file" id="moviefile" /> <br/>
    </form>
    <iframe name="uploadFrame" id="uploadFrame"></iframe>
</div>
<script src="${pageContext.request.contextPath}/wejoin/js/camara.js" type="text/javascript" charset="utf-8"></script>


<!--登录 开始-->
		<div class="windows djcgBox" id="djcgBox" style="display:none;" >
			<div class="windowsBg"></div>
		  	<div class="windows_box">
				<div class="djcgBox_con">
					<div class="dj_top_a"></div>
		               <div class="dj_con_a">
		               	<div class="dj_title_a">
		                   	<span></span>
		                       <div>
		                       	<ol>用户登录</ol>
		                           <em>USER LOGIN</em>
		                       </div>
		                   </div>
		                   <ul>
		                   	<form action="" method="get">
		                   	<li><input type="text" class="pt1" placeholder="请输入用户名" id="username" style="color:#333;"><b></b></li>
		                       <li><input type="password" class="pt1" placeholder="请输入密码" id="password" style="color:#333;"><p></p></li>
		                       <strong><a href="javascript:void(0);" onClick="showTjcgBox()">找回密码</a></strong>
		                       <input name="" type="button" value="登  录" class="tzam" id="login_btn"/>
		                       </form>
		                   </ul>
		               </div>
		               <div class="dj_btn"></div>
				</div>
				<div class="close_btn"></div>
			</div>
		</div>
		<!--登录 结束-->

		<!--找回密码 开始-->
		<div class="windows tjcgBox" id="tjcgBox" style="display:none;" >
			  <div class="windowsBg"></div>
			  <div class="windows_box">
				<div class="tjcg_con">
		           	<div class="dj_top_a"></div>
		               <div class="tjcg_bj_b">
		           	<div class="dj_title_a">
		                   	<span></span>
		                       <div>
		                       	<ol>密码找回</ol>
		                           <em>PASSWORD RETRIEVE</em>
		                       </div>
		               </div>
		               <div class="tjcg_list_b">
		               	<ul>
		                   	<form action="" method="get">
		                   	<li><input type="text" class="pt2" onBlur="if(this.value==''){this.value='请输入手机号获取验证码';this.style.color='#ccc'}" onFocus="if(this.value=='请输入手机号获取验证码'){this.value='';this.style.color='#333'}" value="请输入手机号获取验证码" id="textfield11" name="telphone" style="color:#ccc;"><ol><a href="#">点击获取</a></ol></li>
		                       <li><input type="text" class="pt3" onBlur="if(this.value==''){this.value='请输入验证码';this.style.color='#ccc'}" onFocus="if(this.value=='请输入验证码'){this.value='';this.style.color='#333'}" value="请输入验证码" id="textfield12" name="telphone" style="color:#ccc;"></li>
		                       <li><span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input type="password" class="pt2" onBlur="if(this.value==''){this.value='请输入新密码';this.style.color='#ccc'}" onFocus="if(this.value=='请输入新密码'){this.value='';this.style.color='#333'}" value="请输入新密码" id="textfield13" name="telphone" style="color:#ccc;"></li>
		                       <li style="margin-bottom:40px; "><span>确认密码：</span><input type="password" class="pt2" onBlur="if(this.value==''){this.value='请重复输入新密码';this.style.color='#ccc'}" onFocus="if(this.value=='请重复输入新密码'){this.value='';this.style.color='#333'}" value="请重复输入新密码" id="textfield14" name="telphone" style="color:#ccc;"></li>
		                       <input name="" type="submit" value="确  定" class="tzam"/>
		                       </form>
		                   </ul>
		               </div>
		               </div>
		               <div class="dj_btn"></div>
		           </div>
				<div class="close_btn"></div>
			  </div>
		</div>
		<!--找回密码 结束-->

		<!--注册 开始-->
		<div class="windows syldBox" id="syldBox" style="display:none;" >
			  <div class="windowsBg"></div>
			  <div class="windows_box">
				<div class="tjcg_con">
		           	<div class="dj_top_a"></div>
		               <div class="tjcg_bj_b">
		           	<div class="dj_title_a">
		                   	<span class="zc_tb"></span>
		                       <div>
		                       	<ol>用户注册</ol>
		                           <em>USER REGISTRATION</em>
		                       </div>
		               </div>
		               <div class="tjcg_list_b">
		               	<ul>
		                   	<form action="" method="get">
		                   	<li><input type="text" class="pt2" placeholder="请输入手机号获取验证码" id="telphone" style="color:#333;"><ol><a href="javascript:void(0);" class="validCode_btn">点击获取</a></ol></li>
		                       <li><input type="text" class="pt3" placeholder="请输入验证码" id="validCode" style="color:#333;"></li>
		                       <li><span>用户昵称：</span><input type="text" class="pt2" placeholder="请输入用户昵称" id="username" style="color:#333;"></li>
		                       <li style="margin-bottom:40px; "><span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input type="password" class="pt2" placeholder="请输入密码" id="password" style="color:#333;"></li>
		                       <input name="" type="button" value="注  册" class="tzam" id="register_btn"/>
		                       </form>
		                   </ul>
		               </div>
		               </div>
		               <div class="dj_btn"></div>
		           </div>
				<div class="close_btn"></div>
			  </div>
		</div>


<!--上传进度条 开始-->
<div class="windows dhdBox" id="dhdBox" style="display:none;" >
		  <div class="windowsBg"></div>
		  <div class="windows_box">
			<div class="tjcg_con">
            	<div class="dj_top2"></div>
                <div class="sz_ta">
                	<div class="sz_ta_title">文件上传</div>
                    <div class="up_center">
                            <div id="ff">   
                            <div class="up_par">
                            	<!-- <input type="file" id="f" class="up_style" size="30" /> -->
                                <div class="up_zi" id="fileUpload">选择文件</div>
                                <input type="button" id="b" class="up_an" value="上传" onClick="upload()"/> 
                                
                                <div id="up">   
                                <span class="spa">载入中,请稍等...</span>   
                                <input id="chart" type="text" size="54" class="put" readOnly />   
                                <input id="percent" type="text" size="20" class="put2" readOnly />   
                                </div>
                            </div>
                        </div>  
                    </div> 
                </div>
                <div class="dj_btn2"></div>
            </div>
			<div class="close_btn"></div>
		  </div>
	</div>
<!--上传进度条 结束-->
<!-- ui-dialog -->
<div id="dialog">
</div>


<!--房间设置 开始-->
<div class="windows romBox" id="romBox" style="display:none;" >
		  <div class="windowsBg"></div>
		  <div class="windows_box">
			<div class="house_see">
            	<ul>
                	<form action="" method="get">
                	<li>
                    	<span>房间密码</span>
                        <input name="" type="text" class="house_put"/>
                        <div class="vdo_seelist">
                            <input type="checkbox" name="mm" value="" id="mm" class="vd_style"/>
                            <label for="mm">开启密码</label>
                    	</div>
                    </li>
                    <li>
                    	<span>房间密码</span>
                        <div class="vdo_seelist">
                            <input type="checkbox" name="aa" value="" id="aa" class="vd_style"/>
                            <label for="aa">允许发言</label>
                    	</div>
                        <div class="vdo_seelist">
                            <input type="checkbox" name="bb" value="" id="bb" class="vd_style"/>
                            <label for="bb">允许图文</label>
                    	</div>
                    </li>
                    <li>
                    	<span>自由讨论</span>
                        <div class="vdo_seelist">
                            <input type="radio" name="cc" value="1" id="cc1" class="vd_style"/>
                            <label for="cc1">开启</label>
                    	</div>
                        <div class="vdo_seelist">
                            <input type="radio" name="cc" value="2" id="cc2" class="vd_style"/>
                            <label for="cc2">禁止</label>
                    	</div>
                    </li>
                    <li>
                    	<span>开放试听</span>
                        <div class="vdo_seelist">
                            <input type="radio" name="dd" value="1" id="dd1" class="vd_style"/>
                            <label for="dd1">开启</label>
                    	</div>
                        <div class="vdo_seelist">
                            <input type="radio" name="dd" value="2" id="dd2" class="vd_style"/>
                            <label for="dd2">禁止</label>
                    	</div>
                    </li>
                    <li>
                    	<span>只限成员</span>
                        <div class="vdo_seelist">
                            <input type="radio" name="ee" value="1" id="ee1" class="vd_style"/>
                            <label for="ee1">开启</label>
                    	</div>
                        <div class="vdo_seelist">
                            <input type="radio" name="ee" value="2" id="ee2" class="vd_style"/>
                            <label for="ee2">禁止</label>
                    	</div>
                    </li>
                    <li>
                    	<span>允许所有</span>
                        <div class="vdo_seelist">
                            <input type="radio" name="ff" value="1" id="ff1" class="vd_style"/>
                            <label for="ff1">开启</label>
                    	</div>
                        <div class="vdo_seelist">
                            <input type="radio" name="ff" value="2" id="ff2" class="vd_style"/>
                            <label for="ff2">禁止</label>
                    	</div>
                    </li>
                    <li>
                    	<span>锁定教室</span>
                        <div class="vdo_seelist">
                            <input type="radio" name="gg" value="1" id="gg1" class="vd_style"/>
                            <label for="gg1">开启</label>
                    	</div>
                        <div class="vdo_seelist">
                            <input type="radio" name="gg" value="2" id="gg2" class="vd_style"/>
                            <label for="gg2">禁止</label>
                    	</div>
                    </li>
                    <li>
                    	<span>录播方式</span>
                        <div class="vdo_seelist">
                            <input type="radio" name="hh" value="1" id="hh1" class="vd_style"/>
                            <label for="hh1">开启</label>
                    	</div>
                        <div class="vdo_seelist">
                            <input type="radio" name="hh" value="2" id="hh2" class="vd_style"/>
                            <label for="hh2">禁止</label>
                    	</div>
                    </li>
                    <li>
                    	<span>房间地址</span>
                        <strong><a href="#">http://www.weixun.com/class/83</a></strong>
                        <ol><a href="#">复制</a></ol>
                    </li>
                    <div class="vdosee_an" style="padding-left:10px; margin-top:10px; ">
                    	<a href="#" class="okcolor">确 定</a>
                        <a href="#">取 消</a>
                    </div>
                    </form>
                </ul>
            </div>
			<div class="close_btn"></div>
		  </div>
	</div>
<!--房间设置 结束-->


<!--视频设置 开始-->
<div class="windows vdoBox" id="vdoBox" style="display:none;" >
		  <div class="windowsBg"></div>
		  <div class="windows_box">
			<div class="video_see">
            	<form action="" method="get">
                	<div class="vdo_seelist">
                        <input type="radio" name="butt" value="1" id="buttt1" checked="checked" class="vd_style"/>
                        <label for="buttt1">320*240</label>
                    </div>
                    <div class="vdo_seelist">
                        <input type="radio" name="butt" value="2" id="buttt2" class="vd_style"/>
                        <label for="buttt2">640*480</label>
                    </div>
                    <div class="vdo_seelist">
                        <input type="radio" name="butt" value="3" id="buttt3" class="vd_style"/>
                        <label for="buttt3">1920*1080</label>
                    </div>
                    <div class="vdo_seelist">
                        <input type="radio" name="butt" value="4" id="buttt4" class="vd_style"/>
                        <label for="buttt4">自适应</label>
                    </div>
                    <div class="clear"></div>
                    <div class="vdosee_an">
                    	<a href="#" class="okcolor">确 定</a>
                        <a href="#">取 消</a>
                    </div>
                </form>
            </div>
			<div class="close_btn"></div>
		  </div>
	</div>
<!--视频设置 结束-->


</body>
</html>
