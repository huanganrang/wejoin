<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>房间</title>
<link href="${pageContext.request.contextPath}/wejoin/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/wejoin/css/jquery.style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/wejoin/css/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/jslib/jquery-1.8.3.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/wejoin/js/jquery.mCustomScrollbar.concat.min.js" type="text/javascript" charset="utf-8"></script>
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
		$(document).click(function(e){
			if(!$(e.target).hasClass("gift_div_ac")){
				$(".gift_div").hide();
			}
			if(!$(e.target).hasClass("face_div_ac")){
				$(".face_div").hide();
			}	
		})
		$(".a_toggle").toggle(
		  function () {
			$('.img_x').attr('src','images/1.png');
			$('.main_right').hide();
			$(".main_center").css("width","85%");
		  },
		  function () {
			$('.img_x').attr('src','images/2.png');
			$('.main_right').show();
			$(".main_center").css("width","59%");
		  }
		);
		
		$(".ltia_2").click(function(e){
			$(".someone_div").hide();
			$(".all_div").hide();
			if($(this).find("div").attr("class")=="v_bc gift_div"){
				
				$(".face_div").hide();
				if($(this).find(".v_bc").is(":hidden")){
					$(this).find(".v_bc").show();
				}else{
					$(this).find(".v_bc").hide();
				}
			}
			if($(this).find("div").attr("class")=="v_bc face_div"){
				$(".gift_div").hide();
				if($(this).find(".v_bc").is(":hidden")){
					$(this).find(".v_bc").show();
				}else{
					$(this).find(".v_bc").hide();
				}
			}
			
		})
		$(".ltia_1").click(function(){
			$(".face_div").hide();
			$(".gift_div").hide();
			if($(this).find("div").attr("class")=="v_hover all_div"){
				$(".someone_div").hide();
				$(".all_div").show();
			}else{
				$(".someone_div").show();
				$(".all_div").hide();
			}
		})
	})
</script>
</head>

<body>
<div class="header">
	<div class="logo"></div>
    <ul>
    	<li class="on"><a href="#">黑 板</a></li>
        <li><a href="#">文 档</a></li>
        <li><a href="#">影 音</a></li>
    </ul>
    
    <div class="aa">
    <span>游客：我是会飞的鱼</span>
    <ol><a href="#">注册</a>  |   <a href="#">登录</a>   </ol>
    <div class="hed_1"><a href="#">下载APP</a></div>
    <div class="hed_2"><a href="#">下载PC客户端</a></div>
    <div class="qq">客服QQ <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1794691101&site=qq&menu=yes"><img src="images/q_1.gif" border="0" alt="点击咨询" title="点击咨询"></a></div>
    <div class="tel"></div>
    <div class="clear"></div>
    </div>
</div>


<div class="main_left">
	<div class="content mCustomScrollbar" style="height:440px;">
	<div class="video" id="box">
    	<img src="images/video.gif" />
        <span></span>
        <div class="col"><a href="#" onclick="openShutManager(this,'box')"><img src="images/x.gif" /></a></div>
    </div>
    
    <div class="video" id="box1">
    	<img src="images/video.gif" />
        <ol></ol>
        <div class="col"><a href="#" onclick="openShutManager(this,'box1')"><img src="images/x.gif" /></a></div>
    </div>
    
    <div class="video" id="box2">
    	<img src="images/video.gif" />
        <ol></ol>
        <div class="col"><a href="#" onclick="openShutManager(this,'box2')"><img src="images/x.gif" /></a></div>
    </div>
    </div>
    
    <div class="hy_title">
    	<span>在线会员</span>
        <a href="#" class="le">男</a>
        <a href="#">女</a>
    </div>
    
    <div class="search">
    	<form action="" method="get">
        <input name="" type="submit" class="tzbm" value=""/>
        <input type="text" class="pt1" onblur="if(this.value==''){this.value='查找用户';this.style.color='#ccc'}" onfocus="if(this.value=='查找用户'){this.value='';this.style.color='#333'}" value="查找用户" id="textfield" name="telphone" style="color:#ccc;">
        <span></span>
        </form>
        <div class="clear"></div>
    </div>
    <div class="content mCustomScrollbar">
    <div class="list_name">
    	<ul>
        	<li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="#" class="le">语音</a> <a href="#">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="#" class="le">语音</a> <a href="#">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="#" class="le">语音</a> <a href="#">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="#" class="le">语音</a> <a href="#">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="#" class="le">语音</a> <a href="#">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="#" class="le">语音</a> <a href="#">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="#" class="le">语音</a> <a href="#">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="#" class="le">语音</a> <a href="#">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="#" class="le">语音</a> <a href="#">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="#" class="le">语音</a> <a href="#">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="#" class="le">语音</a> <a href="#">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="#" class="le">语音</a> <a href="#">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="#" class="le">语音</a> <a href="#">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="#" class="le">语音</a> <a href="#">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="#" class="le">语音</a> <a href="#">视频</a>  </li>
            <li><img src="images/xt.gif" /><span>我是会飞的鱼</span> <a href="#" class="le">语音</a> <a href="#">视频</a>  </li>
        </ul>
    </div>
    </div>
    <img src="images/c.gif" style="width:100%;"/>
</div>

<div class="main_center" id="box3">
	<div class="cneter_menu"><img src="images/gl.gif" /></div>
    <div class="center_max">
    	<div class="scroll"><marquee scrollamount="3" id="notice" direction="left">☆☆《投资宝典》已经上线，内含老师技术教学视频以及投资心得，免费领取,详情请咨询【高级客服QQ】↑↑↑</marquee></div>
        <div class="main_pic"><img src="images/pic.gif" /></div>
    </div>
    <div class="fax">
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
                </div>
                </div>
            </div>
        <a href="#">下一页</a>    
    </div>
  <div class="col" style="top:42px; right:0px; "><a href="#" onclick="openShutManager(this,'box3')"><img src="images/x.gif" /></a></div>
    <div class="sj"><a class="a_toggle" href="javascript:;;"><img class="img_x" src="images/1.png" /></a></div>
</div>

<div class="main_right" id="box4">
	
	<div class="content mCustomScrollbar" style="height:580px;">
	<div class="ltian">
    	<ul>
        	<li>
            	<div class="ltian_img"><a href="#"><img src="images/tx.gif" /></a></div>
                <div class="ltian_txt">
                	<span>我是会飞的鱼</span>
                    <div class="txt_zi">我们目前《刀塔传奇》这款游戏有新手礼包哦，亲如果在玩的话可以去看看，里面送的东西不少呢！</div>
                    <ol></ol>
                </div>
                <div class="clear"></div>
            </li>
            
            <li class="wo">
            	<div class="ltian_img"><a href="#"><img src="images/tx.gif" /></a></div>
                <div class="ltian_txt">
                	<span>我是会飞的鱼</span>
                    <div class="txt_zi">我们123123123！</div>
                    <em></em>
                </div>
                <div class="clear"></div>
            </li>
            
            <li>
            	<div class="ltian_img"><a href="#"><img src="images/tx.gif" /></a></div>
                <div class="ltian_txt">
                	<span>我是会飞的鱼</span>
                    <div class="txt_zi">我们目前《刀塔传奇》这款游戏有新手礼包哦，亲如果在玩的话可以去看看，里面送的东西不少呢！</div>
                    <ol></ol>
                </div>
                <div class="clear"></div>
            </li>
            
            <li class="wo">
            	<div class="ltian_img"><a href="#"><img src="images/tx.gif" /></a></div>
                <div class="ltian_txt">
                	<span>我是会飞的鱼</span>
                    <div class="txt_zi">我们123123123！</div>
                    <em></em>
                </div>
                <div class="clear"></div>
            </li>
            
            <li>
            	<div class="ltian_img"><a href="#"><img src="images/tx.gif" /></a></div>
                <div class="ltian_txt">
                	<span>我是会飞的鱼</span>
                    <div class="txt_zi">我们目前《刀塔传奇》这款游戏有新手礼包哦，亲如果在玩的话可以去看看，里面送的东西不少呢！</div>
                    <ol></ol>
                </div>
                <div class="clear"></div>
            </li>
            
            <li class="wo">
            	<div class="ltian_img"><a href="#"><img src="images/tx.gif" /></a></div>
                <div class="ltian_txt">
                	<span>我是会飞的鱼</span>
                    <div class="txt_zi">我们123123123！</div>
                    <em></em>
                </div>
                <div class="clear"></div>
            </li>
            <li>
            	<div class="ltian_img"><a href="#"><img src="images/tx.gif" /></a></div>
                <div class="ltian_txt">
                	<span>我是会飞的鱼</span>
                    <div class="txt_zi">我们1241242342呢！</div>
                    <ol></ol>
                </div>
                <div class="clear"></div>
            </li>
            
            <li class="wo">
            	<div class="ltian_img"><a href="#"><img src="images/tx.gif" /></a></div>
                <div class="ltian_txt">
                	<span>我是会飞的鱼</span>
                    <div class="txt_zi">我们123123123！</div>
                    <em></em>
                </div>
                <ol class="ol1"></ol>
            </li>
            <div class="clear"></div>
        </ul>
    </div>
    </div>
    
    <div class="ltian_menu">
    	<div class="ltia_2">
        	<ol class="face_div_ac"><img class="img_tb3 face_div_ac" src="images/tb3.png" /></ol>
            <div class="v_bc face_div">
        	<a href="#">表情图片aaa</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
        </div>
        </div>
        
        
        <div class="ltia_2" style="margin-left:5px;">
        	<ol class="gift_div_ac"><img class="img_tb3 gift_div_ac" src="images/tb2.png" /></ol>
            <div class="v_bc gift_div">
        	<a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
            <a href="#">表情图片</a>
        </div>
        </div>

        <div class="ltia_1" style="width:155px; float:right;">
        	<span>选择成员</span>
            <div class="ltia_bj someone_div">
            <div class="content mCustomScrollbar" style="height:320px;">
            <div class="v_ren">
            	<ul>
                	<li><a href="#"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="#"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="#"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="#"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="#"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="#"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="#"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="#"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="#"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="#"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="#"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="#"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="#"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                    <li><a href="#"><img src="images/xt.gif" />我是会飞的鱼</a></li>
                </ul>
            </div>
            </div>
            </div>
        </div>
        
        <div class="ltia_1">
        	<span>所有人</span>
            <div class="v_hover all_div">
            	<a href="#">所有人聊天</a>
                <a href="#">私聊</a>
            </div>
        </div>
        
    </div>
    <div class="ltian_form">
    	<form action="" method="get">
        <textarea name="" cols="" rows="" class="pt3"></textarea>
        </form>
    </div> 
    <div class="itian_tb">
    	<span><a href="#" class="a1">录制</a></span>
        <span><a href="#" class="a2">屏幕共享</a></span>
        <span><a href="#" class="a3">分享</a></span>
        <span><a href="#" class="a4">房间设置</a></span>
        <div class="clear"></div>
    </div>
</div>

<div class="clear"></div>

</body>
</html>
