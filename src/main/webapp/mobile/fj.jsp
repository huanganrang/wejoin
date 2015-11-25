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
<link rel="stylesheet" type="text/css" href="images/common.css"/>

<script src="${pageContext.request.contextPath}/jslib/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/jslib/web-im-1.0.7.2/sdk/strophe.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/jslib/web-im-1.0.7.2/sdk/json2.js'></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/web-im-1.0.7.2/sdk/easemob.im-1.0.7.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/web-im-1.0.7.2/easemob.im.config.js"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/common.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/jslib/jquery.base64.js" type="text/javascript" charset="utf-8"></script>

<script src="${pageContext.request.contextPath}/mobile/js/chart.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/mobile/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
var base = '${pageContext.request.contextPath}/';

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
$(function(){
    //_$[20] = '" controls="controls" width="100%" autoplay="autoplay" height="260" poster="';
    //视频自动播放
    if($("video")[0])
    $("video")[0].play();
});
</script>
</head>

<body>
houseId
<input type="hidden" id="houseId" value="<%=houseId%>"/>
<input type="hidden" id="userToken"/>
<input type="hidden" id="nickName"/>
<input type="hidden" id="huanxinUid"/>
<input type="hidden" id="password"/>
<input type="hidden" id="houseToken"/>
<input type="hidden" id="huanxinRoomId"/>
<div class="hed_100">
	<a href="#" class="left1"></a>
    <a href="#" class="right1"></a>
    <div class="hed_title">房间标题（<%=houseId%>）</div>
</div>
<div style="height:55px;"></div>


<%--<div id="box1">
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
</div>--%>


<div id="box2">
<div class="fired">
    <SCRIPT LANGUAGE=JavaScript>
        /*
         * HLSPlayer参数应用=========================<br>
         * @Contact QQ:261532593
         * @param {Object} vID        ID
         * @param {Object} vWidth     播放器宽度设置
         * @param {Object} vHeight    播放器宽度设置
         * @param {Object} vPlayer    播放器文件
         * @param {Object} vHLSset    HLS配置
         * @param {Object} vPic       视频缩略图
         * @param {Object} vCssurl    移动端CSS应用文件
         * @param {Object} vHLSurl    HLS(m3u8)地址
         * ==========================================
         */
        var vID        = "";
        var vWidth     = "100%";                //播放器宽度设置
        var vHeight    = "100%";                   //播放器宽度设置
        var vPlayer    = "HLSPlayer.swf?v=1.5"; //播放器文件
        var vHLSset    = "HLS.swf";             //HLS配置
        var vPic       = "images/start.jpg";    //视频缩略图
        var vCssurl    = "images/mini.css";     //移动端CSS应用文件
        //HLS(m3u8)地址,适配PC,安卓,iOS,WP
        var vHLSurl    = "http://s2.weiqu168.com:80/live/<%=channelId%>/<%=houseId%>/playlist.m3u8";
        //var vHLSurl    = "http://b.cuplayer.net:8011/hls2-vod/test.mp4.m3u8";

        //http://b.cuplayer.net:8011/hls2-vod/test.mp4.m3u8
    </SCRIPT>
    <script type="text/javascript" src="js/hls.min.js?rand=20141217"></script>
<div class="appdown" style="display: none;">
	<div class="apptb">
    	<!-- <img src="images/apptb.png"><span><a href="#">快速加载，流畅收听</a></span> -->
    	<div class="video" id="HLSPlayer" >


        </div>
    </div>
    <%--<div class="app_an"><a href="#">立即下载</a></div>
    <div class="app_clock"><a onClick="openShutManager(this,'box2')"></a></div>--%>
</div>
</div>
</div>


<div class="scroll_center">
	<div class="content mCustomScrollbar">
    <div style="height:15px;" id="lastOne"></div>
    </div>
</div>

<div class="input_wenbi">
    <div class="inp_div">
        <div class="inp_tb1">
            <a href="javascript:void(0)" onClick="javascript:void(0)"><img src="images/tb16.png"></a>
        </div>
        <div class="inp_tb2">
            <form action="" method="get">
                <input name="" type="text" class="inp_wbe" id="content">
            </form>
        </div>
        <div class="inp_tb3">
            <a href="javascript:void(0)"><img src="images/tb17.png"></a>
            <a href="javascript:void(0)" id="sendButton"style="background:#33af3c; text-align:center; color:#fff; padding:0px; height:57px; line-height:57px; font-size:14px;">发送</a>

        </div>
    </div>
</div>
</body>
</html>
