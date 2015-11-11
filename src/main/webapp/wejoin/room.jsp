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
<script src="${pageContext.request.contextPath}/wejoin/js/room.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

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
		$(".main_center").css("width","61%");
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
<!--  --><input type="hidden" id="huanxinUid" value="${sessionScope.userToken.huanxinUid}" />
<input type="hidden" id="password" value="${sessionScope.userToken.password}" />
<!--  <input type="hidden" id="huanxinUid" value="test" />
<input type="hidden" id="password" value="123456" />-->
<input type="hidden" id="houseToken" value="<%=houseToken %>" />
<input type="hidden" id="huanxinRoomId" value="<%=huanxinRoomId %>" />
<div class="header">
	<div class="logo"></div>
    <ul>
    	<li class="on"><a href="javascript:void(0);">黑 板</a></li>
        <li><a href="javascript:void(0);">文 档</a></li>
        <li><a href="javascript:void(0);">影 音</a></li>
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
	<div class="content mCustomScrollbar content_main" style="height:340px;">
	<div class="video example_video_1">
    	<video id="example_video_1" class="video-js vjs-default-skin" class="video-js vjs-default-skin" controls preload="auto" width="185" height="150" 
      				poster="http://video-js.zencoder.com/oceans-clip.png" data-setup="{}">
		    	<source src="rtmp://s2.weiqu168.com/live/<%=channelId %>/<%=houseId %>" type="rtmp/mp4"/>
		    	<p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>
		  	</video> 
		  	
    </div>
    
    <div class="video hidden_area">
		<iframe id="cameraPush" width="190" height="150" border=""></iframe>
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
        <a href="javascript:void(0);" class="le">男</a>
        <a href="javascript:void(0);">女</a>
    </div>
    
    <div class="search">
    	<form action="" method="get">
        <input name="" type="submit" class="tzbm" value=""/>
        <input type="text" class="pt1" onblur="if(this.value==''){this.value='查找用户';this.style.color='#ccc'}" onfocus="if(this.value=='查找用户'){this.value='';this.style.color='#333'}" value="查找用户" id="textfield" name="telphone" style="color:#ccc;">
        
        <span></span>
        </form>
        <div class="clear"></div>
    </div>
    <div class="content mCustomScrollbar content_buttom">
    <div class="list_name">
    	<ul>
        	<li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="javascript:void(0);" class="le_on">语音</a> <a href="javascript:void(0);">视频</a>  </li>
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
        </ul>
    </div>
    </div>
    <div class="content_img"><img src="images/c.gif" style="width:100%;"/></div>
</div>

<div class="main_center" id="box3">
	<div class="cneter_menu"><img src="images/gl.gif" /></div>
    <div class="center_max">  
        <div class="main_pic">
        	<img src="images/pic.gif" />
        	 
        	
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
  <div class="col" style="top:42px; right:0px; "><a href="javascript:void(0);" onclick="openShutManager(this,'box3')"><img src="images/x.gif" /></a></div>
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
            <div class="v_bc gift_div" style="top: -166px;">
        	<a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a>
            <a href="javascript:void(0);">表情图片</a> 
        </div>
        </div>

        <div class="ltia_1" style=" width:135px; float:right;">
        	<span>选择成员</span>
            <div class="ltia_bj someone_div">
            <div class="content" style="height:320px;">
            <div class="v_ren mCustomScrollbar">
            	<ul>
                	<!-- <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="javascript:void(0);"><img src="images/xt.gif" />我是会飞的鱼</a></li> -->
                </ul>
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

<script type="text/javascript">
$(function(){
	$(".content_img").click(function(){
		$(".example_video_1").hide();
		$(".hidden_area").show();
		$("#cameraPush").attr("src","${pageContext.request.contextPath}/simplest_as3_rtmp_streamer/rtmp_streamer.jsp?houseId=<%=houseId %>&channelId=<%=channelId %>");
	});
});
</script>
</body>
</html>
