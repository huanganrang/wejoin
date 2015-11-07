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
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>微区</title>
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" name="viewport" id="viewport" />
<link href="${pageContext.request.contextPath}/mobile/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/mobile/css/jquery.style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/mobile/css/jquery.mCustomScrollbar.css">
<script src="${pageContext.request.contextPath}/jslib/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
<link href="${pageContext.request.contextPath}/jslib/video-js/video-js.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jslib/video-js/video.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/mobile/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
var base = '${pageContext.request.contextPath}/';
videojs.options.flash.swf = base + "jslib/video-js/video-js.swf";

$(function(){
	changeHeight();
})
	$(window).resize(function() {
		changeHeight();
	});
	
	function changeHeight(){
		var head_h = $('.hed_100').height();
		var footer_h = $('.input_wenbi').height();
		var b_h = $(window).height();
		var content_h = b_h - head_h - footer_h;
		$('.content').height(content_h)
	}
//=点击展开关闭效果=
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
</script>
</head>

<body>
<div class="hed_100">
	<a href="#" class="left1"></a>
    <a href="#" class="right1"></a>
    <div class="hed_title">房间标题（<%=houseId%>）</div>
</div>
<div style="height:55px;"></div>


<div id="box1">
<div class="fired">
<div class="top_d">
	<div class="d_txt">内容++++++++++</div>
    <div class="d_bottom">
    	<span>
        	<a href="#" class="d_tb1"></a>
            <a href="#" class="d_tb2"></a>
            <a href="#" class="d_tb3"></a>
        </span>
        <ol><a href="#" class="d_tb4"></a></ol>
    </div>
    <div class="d_clock"><a onClick="openShutManager(this,'box1')"></a></div>
</div>
</div>
</div>


<div id="box2">
<div class="fired">
<div class="appdown">
	<div class="apptb">
    	<!-- <img src="images/apptb.png"><span><a href="#">快速加载，流畅收听</a></span> -->
    	<video id="example_video_1" class="video-js vjs-default-skin" class="video-js vjs-default-skin" controls preload="auto"
     				poster="http://video-js.zencoder.com/oceans-clip.png" data-setup="{}">
	    	<source src="rtmp://s2.weiqu168.com/live/<%=channelId %>/<%=houseId %>" type="rtmp/mp4"/>
	    	<p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>
	  	</video> 
    </div>
    <div class="app_an"><a href="#">立即下载</a></div>
    <div class="app_clock"><a onClick="openShutManager(this,'box2')"></a></div>
</div>
</div>
</div>


<div class="scroll_center">
	<div class="content mCustomScrollbar">
    <div style="height:15px;"></div>
	<div class="lt_1">
    	<div class="lt_img"><img src="images/tx.gif"></div>
        <div class="lt_rg">
            <strong>我是会飞的鱼</strong>
            <div class="lt_txt">
            我们目前《刀塔传奇》这款游戏有新手礼包哦，亲如果在玩的话可以去看看，里面送的东西不少呢！<span></span></div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="lt_line">
    	<div class="yline"></div>
        <div class="lt_date">6-18 13:08</div>
    </div>
    <div class="lt_1">
    	<div class="lt_img"><img src="images/tx.gif"></div>
        <div class="lt_rg">
            <strong>我是会飞的鱼</strong>
            <div class="lt_txt">
            我们目前《刀塔传奇》这款游戏有新手礼包哦，亲如果在玩的话可以去看看，里面送的东西不少呢！<span></span></div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="lt_1 wo">
    	<div class="lt_img"><img src="images/tx.gif"></div>
        <div class="lt_rg">
        	<strong>我是会飞的鱼</strong>
            <div class="lt_zi">您已申请举手发言<br />请等待管理员批准 <em></em></div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="lt_1 wo">
    	<div class="lt_img"><img src="images/tx.gif"></div>
        <div class="lt_rg">
        	<strong>我是会飞的鱼</strong>
        	<div class="lt_txt">嘿嘿哈嘿快使用嘿嘿哈嘿快使用嘿嘿哈嘿快使用嘿嘿哈嘿快使用嘿嘿哈嘿快使用双节<span></span> <ol><a href="#">!</a></ol></div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="lt_1">
    	<div class="lt_img"><img src="images/tx.gif"></div>
        <div class="lt_rg">
            <strong>我是会飞的鱼</strong>
            <div class="lt_txt">
            我们目前《刀塔传奇》这款游戏有新手礼包哦，亲如果在玩的话可以去看看，里面送的东西不少呢！<span></span></div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="lt_line">
    	<div class="yline"></div>
        <div class="lt_date">6-18 13:08</div>
    </div>
    <div class="lt_1">
    	<div class="lt_img"><img src="images/tx.gif"></div>
        <div class="lt_rg">
            <strong>我是会飞的鱼</strong>
            <div class="lt_txt">
            我们目前《刀塔传奇》这款游戏有新手礼包哦，亲如果在玩的话可以去看看，里面送的东西不少呢！<span></span></div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="lt_1 wo">
    	<div class="lt_img"><img src="images/tx.gif"></div>
        <div class="lt_rg">
        	<strong>我是会飞的鱼</strong>
            <div class="lt_zi">您已申请举手发言<br />请等待管理员批准 <em></em></div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="lt_1 wo">
    	<div class="lt_img"><img src="images/tx.gif"></div>
        <div class="lt_rg">
        	<strong>我是会飞的鱼</strong>
        	<div class="lt_txt">嘿嘿哈嘿快使用嘿嘿哈嘿快使用嘿嘿哈嘿快使用嘿嘿哈嘿快使用嘿嘿哈嘿快使用双节<span></span> <ol><a href="#">!</a></ol></div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="lt_1">
    	<div class="lt_img"><img src="images/tx.gif"></div>
        <div class="lt_rg">
            <strong>我是会飞的鱼</strong>
            <div class="lt_txt">
            我们目前《刀塔传奇》这款游戏有新手礼包哦，亲如果在玩的话可以去看看，里面送的东西不少呢！<span></span></div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="lt_line">
    	<div class="yline"></div>
        <div class="lt_date">6-18 13:08</div>
    </div>
    <div class="lt_1">
    	<div class="lt_img"><img src="images/tx.gif"></div>
        <div class="lt_rg">
            <strong>我是会飞的鱼</strong>
            <div class="lt_txt">
            我们目前《刀塔传奇》这款游戏有新手礼包哦，亲如果在玩的话可以去看看，里面送的东西不少呢！<span></span></div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="lt_1 wo">
    	<div class="lt_img"><img src="images/tx.gif"></div>
        <div class="lt_rg">
        	<strong>我是会飞的鱼</strong>
        	<div class="lt_txt">嘿嘿哈嘿快使用<span></span> <ol><a href="#">!</a></ol></div>
        </div>
        <div class="clear"></div>
    </div>
    
    <div style="height:55px;"></div>
</div>
</div>

<div class="input_wenbi">
	<div class="cj_center"><img src="images/cj.gif"></div>
    
    
    <!--插件区域
    <div class="cj_tb">
    	<ul>
        	<li><a href="#"><img src="images/tb4.png">白板</a></li>
            <li><a href="#"><img src="images/tb5.png">视频</a></li>
            <li><a href="#"><img src="images/tb6.png">语音视频</a></li>
            <li><a href="#"><img src="images/tb7.png">录制</a></li>
            <li><a href="#"><img src="images/tb8.png">福利</a></li>
            <li><a href="#"><img src="images/tb9.png">分享</a></li>
            <li><a href="#"><img src="images/tb10.png">房间设置</a></li>
            <li><a href="#"><img src="images/tb11.png">联系客服</a></li>
            <div class="clear"></div>
        </ul>
    </div>  
    
    <div class="cjpic"><img src="images/cjpic.gif"></div>
    <div class="cj_mu">
    	<a href="#" class="mu_1">举手申请上麦</a>
        <a href="#" class="mu_2">上麦申请中</a>
        <a href="#" class="mu_3">点击 说话</a>
        <a href="#" class="mu_4"><span></span></a>
    </div>
    -->
    
</div>
</body>
</html>
