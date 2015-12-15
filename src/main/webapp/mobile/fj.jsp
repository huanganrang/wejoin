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
<%--
<link rel="stylesheet" href="${pageContext.request.contextPath}/mobile/css/jquery.mCustomScrollbar.css">
--%>
<link rel="stylesheet" type="text/css" href="images/common.css"/>

<script src="${pageContext.request.contextPath}/jslib/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/jslib/web-im-1.0.7.2/sdk/strophe.js'></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/jslib/web-im-1.0.7.2/sdk/json2.js'></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/web-im-1.0.7.2/sdk/easemob.im-1.0.7.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/web-im-1.0.7.2/easemob.im.config.js"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/common.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/jslib/jquery.base64.js" type="text/javascript" charset="utf-8"></script>

<script src="${pageContext.request.contextPath}/mobile/js/chart.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/mobile/js/tab.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/mobile/js/swiper.min.js"></script>

<%--
<script src="${pageContext.request.contextPath}/mobile/js/jquery.mCustomScrollbar.concat.min.js"></script>
--%>
<script>
var base = '${pageContext.request.contextPath}/';

$(function(){
	changeHeight();
})
	$(window).resize(function() {
		//changeHeight();
	});
	
function changeHeight(){
    var video_H = $('.video').height();
    var head_h = $('#box2').height();
    var footer_h = $('.input_wenbi').height();
    var b_h = $(window).height();
    var content_h = b_h - head_h - footer_h-video_H+5;
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

<input type="hidden" id="houseId" value="<%=houseId%>"/>
<input type="hidden" id="userToken"/>
<input type="hidden" id="nickName"/>
<input type="hidden" id="huanxinUid"/>
<input type="hidden" id="password"/>
<input type="hidden" id="houseToken"/>
<input type="hidden" id="huanxinRoomId"/>
<div class="hed_100" style="display: none;">
	<a href="#" class="left1"></a>
    <a href="#" class="right1"></a>
    <div class="hed_title">房间标题（<%=houseId%>）</div>
</div>


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


<div class="video">
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
</div>
<div id="box2">
    <div class="fired">
        <div class="appdown">
            <div class="apptb">
                <img src="images/apptb.png"><span><a href="#">下载APP，直播更流畅</a></span>    </div>
            <div class="app_an"><a href="#">立即下载</a></div>
            <div class="app_clock"><a onClick="openShutManager(this,'box2')"></a></div>
        </div>
    </div>
</div>






<div class="scroll_center">
    <div class="content mCustomScrollbar">
        <div style="height:15px;"></div>
    </div>
</div>

<div class="input_wenbi">
    <div class="inp_div">
        <div class="inp_tb1">
            <a href="javascript:void(0)" onClick="javascript:alert('使用音视频功能，请下载APP')"><img src="images/tb16.png"></a>
        </div>
        <div class="inp_tb2">
                <input name="" id="content" type="text" class="inp_wbe">
        </div>
        <div class="inp_tb3">

            <a onClick="openShutManager(this,'box6')" style="width: 33%"><img src="images/tb17.png"></a>
            <a onClick="openShutManager(this,'box7')" style="width: 33%"><img src="images/tb18.png"></a>
            <a href="javascript:void(0)" id="sendButton" style="width: 33%">发送</a>

        </div>
    </div>

    <div class="ys_center" id="box6" style="display:none; height:212px; position:relative;">
        <div class="ys_title">
            <ul>
                <li class="hover" onclick="setTab('one',1,2)" id="one1">表情</li>
                <li onclick="setTab('one',2,2)" id="one2">礼物</li>
                <ol><a href="javascript:void(0)" >发送</a></ol>
            </ul>
        </div>

        <!-- 表情 -->
        <div id="con_one_1">
            <div class="swiper-container fadeInDown animated">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="qqexp">
                            <ul>
                                <li><a href="#"><img src="qqexp/1.png"></a></li>
                                <li><a href="#"><img src="qqexp/2.png"></a></li>
                                <li><a href="#"><img src="qqexp/3.png"></a></li>
                                <li><a href="#"><img src="qqexp/4.png"></a></li>
                                <li><a href="#"><img src="qqexp/5.png"></a></li>
                                <li><a href="#"><img src="qqexp/6.png"></a></li>
                                <li><a href="#"><img src="qqexp/7.png"></a></li>
                                <li><a href="#"><img src="qqexp/8.png"></a></li>
                                <li><a href="#"><img src="qqexp/9.png"></a></li>
                                <li><a href="#"><img src="qqexp/10.png"></a></li>
                                <li><a href="#"><img src="qqexp/11.png"></a></li>
                                <li><a href="#"><img src="qqexp/12.png"></a></li>
                                <li><a href="#"><img src="qqexp/13.png"></a></li>
                                <li><a href="#"><img src="qqexp/14.png"></a></li>
                                <li><a href="#"><img src="qqexp/15.png"></a></li>
                                <li><a href="#"><img src="qqexp/16.png"></a></li>
                                <li><a href="#"><img src="qqexp/17.png"></a></li>
                                <li><a href="#"><img src="qqexp/18.png"></a></li>
                                <li><a href="#"><img src="qqexp/19.png"></a></li>
                                <li><a href="#"><img src="qqexp/20.png"></a></li>
                                <li><a href="#"><img src="qqexp/x.png"></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="qqexp">
                            <ul>
                                <li><a href="#"><img src="qqexp/21.png"></a></li>
                                <li><a href="#"><img src="qqexp/22.png"></a></li>
                                <li><a href="#"><img src="qqexp/23.png"></a></li>
                                <li><a href="#"><img src="qqexp/24.png"></a></li>
                                <li><a href="#"><img src="qqexp/25.png"></a></li>
                                <li><a href="#"><img src="qqexp/26.png"></a></li>
                                <li><a href="#"><img src="qqexp/27.png"></a></li>
                                <li><a href="#"><img src="qqexp/28.png"></a></li>
                                <li><a href="#"><img src="qqexp/29.png"></a></li>
                                <li><a href="#"><img src="qqexp/30.png"></a></li>
                                <li><a href="#"><img src="qqexp/31.png"></a></li>
                                <li><a href="#"><img src="qqexp/32.png"></a></li>
                                <li><a href="#"><img src="qqexp/33.png"></a></li>
                                <li><a href="#"><img src="qqexp/34.png"></a></li>
                                <li><a href="#"><img src="qqexp/35.png"></a></li>
                                <li><a href="#"><img src="qqexp/36.gif"></a></li>
                                <li><a href="#"><img src="qqexp/x.png"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
        <!-- 表情 -->

        <!-- 礼物 -->
        <div id="con_one_2">
            <div class="swiper-container2 fadeInDown animated">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="qqexp">
                            <ul>
                                <li><a href="#"><img src="tb/1.png"></a></li>
                                <li><a href="#"><img src="tb/2.png"></a></li>
                                <li><a href="#"><img src="tb/3.png"></a></li>
                                <li><a href="#"><img src="tb/4.png"></a></li>
                                <li><a href="#"><img src="tb/5.png"></a></li>
                                <li><a href="#"><img src="tb/6.png"></a></li>
                                <li><a href="#"><img src="tb/7.png"></a></li>
                                <li><a href="#"><img src="tb/8.png"></a></li>
                                <li><a href="#"><img src="tb/9.png"></a></li>
                                <li><a href="#"><img src="tb/10.png"></a></li>
                                <li><a href="#"><img src="tb/11.png"></a></li>
                                <li><a href="#"><img src="tb/12.png"></a></li>
                                <li><a href="#"><img src="tb/13.png"></a></li>
                                <li><a href="#"><img src="tb/14.png"></a></li>
                                <li><a href="#"><img src="tb/15.png"></a></li>
                                <li><a href="#"><img src="tb/16.png"></a></li>
                                <li><a href="#"><img src="tb/17.png"></a></li>
                                <li><a href="#"><img src="tb/18.png"></a></li>
                                <li><a href="#"><img src="tb/19.png"></a></li>
                                <li><a href="#"><img src="tb/20.png"></a></li>
                                <li><a href="#"><img src="qqexp/x.png"></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="qqexp">
                            <ul>
                                <li><a href="#"><img src="tb/21.png"></a></li>
                                <li><a href="#"><img src="tb/22.png"></a></li>
                                <li><a href="#"><img src="tb/23.png"></a></li>
                                <li><a href="#"><img src="tb/24.png"></a></li>
                                <li><a href="#"><img src="tb/25.png"></a></li>
                                <li><a href="#"><img src="tb/26.png"></a></li>
                                <li><a href="#"><img src="tb/27.png"></a></li>
                                <li><a href="#"><img src="tb/28.png"></a></li>
                                <li><a href="#"><img src="tb/29.png"></a></li>
                                <li><a href="#"><img src="tb/30.png"></a></li>
                                <li><a href="#"><img src="tb/31.png"></a></li>
                                <li><a href="#"><img src="tb/32.png"></a></li>
                                <li><a href="#"><img src="tb/33.png"></a></li>
                                <li><a href="#"><img src="tb/34.png"></a></li>
                                <li><a href="#"><img src="tb/35.png"></a></li>
                                <li><a href="#"><img src="tb/36.png"></a></li>
                                <li><a href="#"><img src="tb/37.png"></a></li>
                                <li><a href="#"><img src="tb/38.png"></a></li>
                                <li><a href="#"><img src="tb/39.png"></a></li>
                                <li><a href="#"><img src="tb/40.png"></a></li>
                                <li><a href="#"><img src="qqexp/x.png"></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="qqexp">
                            <ul>
                                <li><a href="#"><img src="tb/41.png"></a></li>
                                <li><a href="#"><img src="tb/42.png"></a></li>
                                <li><a href="#"><img src="tb/43.png"></a></li>
                                <li><a href="#"><img src="tb/44.png"></a></li>
                                <li><a href="#"><img src="tb/45.png"></a></li>
                                <li><a href="#"><img src="tb/46.png"></a></li>
                                <li><a href="#"><img src="tb/47.png"></a></li>
                                <li><a href="#"><img src="tb/48.png"></a></li>
                                <li><a href="#"><img src="tb/49.png"></a></li>
                                <li><a href="#"><img src="tb/50.png"></a></li>
                                <li><a href="#"><img src="tb/51.png"></a></li>
                                <li><a href="#"><img src="tb/52.png"></a></li>
                                <li><a href="#"><img src="tb/53.png"></a></li>
                                <li><a href="#"><img src="tb/54.png"></a></li>
                                <li><a href="#"><img src="tb/55.png"></a></li>
                                <li><a href="#"><img src="tb/56.png"></a></li>
                                <li><a href="#"><img src="tb/57.png"></a></li>
                                <li><a href="#"><img src="tb/58.png"></a></li>
                                <li><a href="#"><img src="qqexp/x.png"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="swiper-pagination2"></div>
            </div>
        </div>
        <!-- 礼物 -->
    </div>

    <!-- 功能设置 -->
    <div class="cj_tb swiper-container2 fadeInDown animated" id="box7" style="display:none;">
        <ul>
            <li><a href="javascript:void(0)" onClick="javascript:alert('使用音视频功能，请下载APP')"><img src="images/tb4.png">白板</a></li>
            <li><a href="javascript:void(0)" onClick="javascript:alert('使用音视频功能，请下载APP')"><img src="images/tb5.png">视频</a></li>
            <li><a href="javascript:void(0)" onClick="javascript:alert('使用音视频功能，请下载APP')"><img src="images/tb6.png">语音视频</a></li>
            <li><a href="javascript:void(0)" onClick="javascript:alert('使用音视频功能，请下载APP')"><img src="images/tb7.png">录制</a></li>
            <li><a href="javascript:void(0)" onClick="javascript:alert('使用音视频功能，请下载APP')"><img src="images/tb8.png">福利</a></li>
            <li><a href="javascript:void(0)" onClick="javascript:alert('使用音视频功能，请下载APP')"><img src="images/tb9.png">分享</a></li>
            <li><a href="javascript:void(0)" onClick="javascript:alert('使用音视频功能，请下载APP')"><img src="images/tb10.png">房间设置</a></li>
            <li><a href="javascript:void(0)" onClick="javascript:alert('使用音视频功能，请下载APP')"><img src="images/tb11.png">联系客服</a></li>
            <div class="clear"></div>
        </ul>
    </div>
    <!-- 功能设置 -->

</div>
</body>
</html>
