<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%
	String houseToken = request.getParameter("houseToken");
	String houseId = request.getParameter("houseId");
	String channelId = request.getParameter("channelId");
	String huanxinRoomId = request.getParameter("huanxinRoomId");
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>房间</title>
<script type="text/javascript">
var base = '${pageContext.request.contextPath}/';
</script>
<link href="${pageContext.request.contextPath}/wejoin/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/wejoin/css/jquery.style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/wejoin/css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/wejoin/js/RightMenu/smartMenu.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/jslib/video-js/video-js.css" rel="stylesheet" type="text/css" />
<!-- <script src="${pageContext.request.contextPath}/jslib/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script> -->
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/web-im-1.0.7.2/sdk/jquery-1.11.1.js"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/jquery.mCustomScrollbar.concat.min.js" type="text/javascript" charset="utf-8"></script>
<!-- <script src="${pageContext.request.contextPath}/wejoin/js/sockjs.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/stomp.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/knockout.js" type="text/javascript" charset="utf-8"></script> -->
<script src="${pageContext.request.contextPath}/wejoin/js/RightMenu/jquery-smartMenu.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/jslib/video-js/video.js" type="text/javascript" charset="utf-8"></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/jslib/web-im-1.0.7.2/sdk/strophe.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/jslib/web-im-1.0.7.2/sdk/json2.js'></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/web-im-1.0.7.2/sdk/easemob.im-1.0.7.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/web-im-1.0.7.2/easemob.im.config.js"></script>
<!-- <script src="${pageContext.request.contextPath}/wejoin/js/easemob.js" type="text/javascript" charset="utf-8"></script> -->
<link href="${pageContext.request.contextPath}/wejoin/js/slide/slide.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/wejoin/js/slide/slide.js" type="text/javascript" charset="utf-8"></script>

<script src="${pageContext.request.contextPath}/wejoin/js/jquery.cookie.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/room.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/common.js" type="text/javascript" charset="utf-8"></script>

<style type="text/css">
	.ck-slide { width: 730px; height: 580px; margin: 0 auto;}
	.ck-slide ul.ck-slide-wrapper { height: 320px;}
</style>

<script type="text/javascript">
var basePath = '${pageContext.request.contextPath}';
var ROOM_INFO = {
    channelId :<%=channelId%> ,
    houseId:<%=houseId%>
}
videojs.options.flash.swf = base + "jslib/video-js/video-js.swf";

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
		$(".main_center").css("width","85%");
	  },
	  function () {
		$('.img_x').attr('src','images/2.png');
		$('.main_right').show();
		//$(".main_center").css("width","61%");
	  }
	);
})
$(function(){
	//changeHeight();
	//changeHeightLeft();
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
	var head_h = $('.header').height();
	var hy_title_h = $('.hy_title').height();
	var search_h = parseInt($('.search').height());
	var m_search_t = parseInt($('.search').css('margin-top').replace('px', ''));
	var m_search_b = parseInt($('.search').css('margin-bottom').replace('px', ''));
	
	var content_buttom_h = $('.content_buttom').height();
	var content_img_h = $('.content_img').height();
	var b_h = $(window).height();
	var content_h = b_h - head_h - hy_title_h - content_buttom_h - search_h - content_img_h;

	$('.content_main').height((b_h - head_h)/2);
	$('.content_buttom').height((b_h - head_h)/2-hy_title_h-(search_h+m_search_t+m_search_b)-content_img_h);
	$('.main_left').height(content_h);
}
$(window).load(function(){
	changeHeightLeft();
})
</script>
</head>

<body style="overflow: hidden;">
<input type="hidden" id="userToken" value="${sessionScope.userToken.token}" />
<input type="hidden" id="nickName" value="${sessionScope.userToken.nickName}" />
<!-- --><input type="hidden" id="huanxinUid" value="${sessionScope.userToken.huanxinUid}" />
<input type="hidden" id="password" value="${sessionScope.userToken.password}" /> 
<!-- <input type="hidden" id="huanxinUid" value="test" />
<input type="hidden" id="password" value="123456" /> -->
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
    <!--<span>游客：我是会飞的鱼</span>
    <ol><a href="javascript:void(0);">注册</a>  |   <a href="javascript:void(0);">登录</a>   </ol>-->
    <div class="hed_1"><a href="javascript:void(0);">下载APP</a></div>
    <div class="hed_2"><a href="javascript:void(0);">下载PC客户端</a></div>
    <div class="qq">客服QQ <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1794691101&site=qq&menu=yes"><img src="images/q_1.gif" border="0" alt="点击咨询" title="点击咨询"></a></div>
    <div class="tel"></div>
    <div class="clear"></div>
    </div>
</div>


<div class="main_left">
	<div class="content mCustomScrollbar content_main" style="height:385px;">
	<div class="video example_video_1">
    	<%-- <video id="example_video_1" class="video-js vjs-default-skin" class="video-js vjs-default-skin" controls preload="auto" width="220" height="174"
      				poster="http://video-js.zencoder.com/oceans-clip.png" data-setup="{}">
		    	<source src="rtmp://s2.weiqu168.com/live/<%=channelId %>/<%=houseId %>" type="rtmp/mp4"/>
		    	<p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>
		  	</video>  --%>
		  <iframe id="cameraPull" width="220" height="174" frameborder="no"></iframe>
		  	
		  	<div class="name_title" style="z-index:-1">
                <div class="name_tt">${sessionScope.userToken.nickName}</div>
                <div class="name_sj"></div>
            </div>
    </div>
    
    <div class="video hidden_area">
        <div class="name_title" style="z-index:-1">
            <div class="name_tt">${sessionScope.userToken.nickName}</div>
            <div class="name_sj"></div>
        </div>
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
    	<span style="display:none;">在线会员</span>
        <a href="javascript:void(0);" class="le" style="display:none;">男</a>
        <a href="javascript:void(0);" style="display:none;">女</a>
    </div>
    
    <div class="search" >
    	<form action="" method="get" style="display:none;">
        <input name="" type="submit" class="tzbm" value=""/>
        <input type="text" class="pt1" onblur="if(this.value==''){this.value='查找用户';this.style.color='#ccc'}" onfocus="if(this.value=='查找用户'){this.value='';this.style.color='#333'}" value="查找用户" id="textfield" name="telphone" style="color:#ccc;">
        
        <span></span>
        </form>
        <div class="clear"></div>
    </div>
    <div class="content mCustomScrollbar content_buttom">
    <div class="list_name">
    	<ul>
        	<!-- <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="javascript:void(0);" class="le_on">语音</a> <a href="javascript:void(0);">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="javascript:void(0);" class="le">语音</a> <a href="javascript:void(0);">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="javascript:void(0);" class="le">语音</a> <a href="javascript:void(0);" class="on">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="javascript:void(0);" class="le">语音</a> <a href="javascript:void(0);">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="javascript:void(0);" class="le">语音</a> <a href="javascript:void(0);">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="javascript:void(0);" class="le">语音</a> <a href="javascript:void(0);">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="javascript:void(0);" class="le">语音</a> <a href="javascript:void(0);">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="javascript:void(0);" class="le">语音</a> <a href="javascript:void(0);">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="javascript:void(0);" class="le">语音</a> <a href="javascript:void(0);">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="javascript:void(0);" class="le">语音</a> <a href="javascript:void(0);">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="javascript:void(0);" class="le">语音</a> <a href="javascript:void(0);">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="javascript:void(0);" class="le">语音</a> <a href="javascript:void(0);">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="javascript:void(0);" class="le">语音</a> <a href="javascript:void(0);">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="javascript:void(0);" class="le">语音</a> <a href="javascript:void(0);">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="javascript:void(0);" class="le">语音</a> <a href="javascript:void(0);">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="javascript:void(0);" class="le">语音</a> <a href="javascript:void(0);">视频</a>  </li>
             -->
        </ul>
    </div>
    </div>
	<div class="content_img">
	    	<div class="content_tb1"><a href="javascript:void(0);"><img src="images/c1.png" /></a></div>
	        <div class="content_tb1"><a href="javascript:void(0);"><img src="images/c2.png" /></a></div>
	        <div class="content_txt1"><span> <ol style="width:70%;"><img src="images/ca.png" /></ol></span></div>
	        <div class="content_tb2"><a href="javascript:void(0);" class="on" id="camaraControl">图标</a></div>
	 </div>
</div>

<div class="main_center" id="box3">

    <div class="center_max">
        <div class="main_pic">
        	<iframe id="drawer" style="width:100%;height:700px;" src="${pageContext.request.contextPath}/canvas/example/drawer.jsp?houseId=<%=houseId %>&channelId=<%=channelId %>" frameborder="no"></iframe>
        </div>

        <div class="main_pic" style="display: none;">
            <div class="cneter_menu">
                <a href="javascript:void(0);" class="t4" id="uploadDocumet"><img src="images/t4.png" /></a>
            </div>
            <img src="images/pic.gif" width="730" id="imageBoard"/>
           
           	<div class="ck-slide" style="display: none;">
				<div class="ck-slide-dir">
					<ul class="ck-slide-wrapper">
					</ul>
				</div>
				<a href="javascript:;" class="ctrl-slide ck-prev" style="opacity: 0.6;">上一张</a> <a href="javascript:;" class="ctrl-slide ck-next" style="opacity: 0.6;">下一张</a>
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
            <img src="images/pic.gif" width="730"/>
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
  <div class="col" style="top:42px; right:0px;display: none; "><a href="javascript:void(0);" onclick="openShutManager(this,'box3')"><img src="images/x.gif" /></a></div>
    <div class="sj"><a class="a_toggle" href="javascript:;;"><img class="img_x" src="images/1.png" /></a></div>
</div>

<div class="main_right" id="box4">
	
	<div class="content mCustomScrollbar content_right" style="height:580px;">
	<div class="ltian">
    	<ul>
        </ul>
    </div>
    </div>
    
    <div class="ltian_menu">
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

        <div class="ltia_1" style=" width:135px; float:right;">
        	<span>选择成员</span>
            <div class="ltia_bj someone_div">
            <div class="content" style="height:320px;">
            <div class="v_ren mCustomScrollbar">
            	<ul></ul>
            </div>
            </div>
            </div>
        </div>
        
        <div class="ltia_1" style=" width:75px; text-align:center; padding-left:5px; ">
        	<input type="checkbox" name="name" value="456" id="an1"><label for="an1">所有人</label>
        </div>
        
    </div>
    <div class="ltian_form">
    	<form action="" method="get">
        <textarea name="" cols="" rows="" class="pt3" id="content"></textarea>
        </form>
    </div> 
    <div class="itian_tb">
    	<span><a href="javascript:void(0);" class="a1">录制</a></span>
        <span><a href="javascript:void(0);" class="a2">屏幕共享</a></span>
        <span><a href="javascript:void(0);" class="a3">分享</a></span>
        <span><a href="javascript:void(0);" class="a4">房间设置</a></span>
        <div class="clear"></div>
    </div>
    
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

</body>
</html>
